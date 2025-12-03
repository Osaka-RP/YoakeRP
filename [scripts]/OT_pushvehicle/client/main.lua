local AttachEntityToEntity = AttachEntityToEntity
local GetEntityCoords = GetEntityCoords
local GetEntityModel = GetEntityModel
local GetVehicleEngineHealth = GetVehicleEngineHealth
local GetModelDimensions = GetModelDimensions
local GetOffsetFromEntityInWorldCoords = GetOffsetFromEntityInWorldCoords
local NetworkGetEntityOwner = NetworkGetEntityOwner
local NetworkGetEntityFromNetworkId = NetworkGetEntityFromNetworkId
local NetworkGetNetworkIdFromEntity = NetworkGetNetworkIdFromEntity
local SetVehicleForwardSpeed = SetVehicleForwardSpeed
local SetVehicleEngineOn = SetVehicleEngineOn
local SetVehicleBrake = SetVehicleBrake
local SetVehicleSteeringAngle = SetVehicleSteeringAngle
local DisableControlAction = DisableControlAction
local IsDisabledControlPressed = IsDisabledControlPressed
local IsControlPressed = IsControlPressed
local TaskVehicleTempAction = TaskVehicleTempAction
local TaskPlayAnim = TaskPlayAnim
local IsEntityUpsidedown = IsEntityUpsidedown
local IsEntityAttachedToAnyVehicle = IsEntityAttachedToAnyVehicle
local ped = cache.ped
local playerId = cache.playerId
local seat = cache.seat
local pushing = false
local vehiclepushing = nil
local pushDirection = nil  -- ← 新しく追加！ 'bonnet' or 'trunk'

-- Wキー長押しで正しい方向に爆速前進（これが神！）
local isPushingWithW = false

CreateThread(function()
    while true do
        Wait(0)
        if pushing and vehiclepushing and not IsPedInAnyVehicle(ped, false) then
            local veh = vehiclepushing

            if IsControlPressed(0, 32) then  -- Wキー長押し
                if not isPushingWithW then
                    isPushingWithW = true
                    -- 正しい方向でstartMoveを呼ぶ！
                    TriggerServerEvent('OT_pushvehicle:startMove', NetworkGetNetworkIdFromEntity(veh), pushDirection)
                end

                -- 正しい方向に爆速！
                local speed = 5.8
                local class = GetVehicleClass(veh)
                if class == 10 or class == 11 or class == 12 or class == 18 or class == 20 then
                    speed = 7.5
                end

                -- ここが最重要！ボンネット側なら後ろに、トランク側なら前に！
                if pushDirection == 'bonnet' then
                    SetVehicleForwardSpeed(veh, -speed)  -- 後ろに進む
                else
                    SetVehicleForwardSpeed(veh, speed)   -- 前に進む
                end
            else
                if isPushingWithW then
                    isPushingWithW = false
                    TriggerServerEvent('OT_pushvehicle:stopMove')
                end
            end
        else
            if isPushingWithW then isPushingWithW = false end
        end
    end
end)

-- ハンドル操作（そのまま）
local function startTurn(netid, direction)
    if direction ~= 'left' and direction ~= 'right' then return end
    local vehicle = NetworkGetEntityFromNetworkId(netid)
    SetVehicleSteeringAngle(vehicle, direction == 'left' and 30.0 or -30.0)
end
RegisterNetEvent('OT_pushvehicle:startTurn', startTurn)

local function stopTurn(netid)
    local vehicle = NetworkGetEntityFromNetworkId(netid)
    SetVehicleSteeringAngle(vehicle, 0.0)
end
RegisterNetEvent('OT_pushvehicle:stopTurn', stopTurn)

-- startMove（そのまま）
local function startMove(netid, direction, pedid)
    local vehicle = NetworkGetEntityFromNetworkId(netid)
    local remoteped = NetworkGetEntityFromNetworkId(pedid)
    remotepush = true
    while remotepush do
        Wait(0)
        if IsEntityInAir(vehicle) or IsEntityUpsidedown(vehicle) or not IsEntityAttachedToAnyVehicle(remoteped) then
            remotepush = false
            return TriggerServerEvent('OT_pushvehicle:detach', netid)
        end
        local owner = NetworkGetEntityOwner(vehicle)
        if owner ~= playerId then
            remotepush = false
            return TriggerServerEvent('OT_pushvehicle:updateOwner', netid, direction)
        end
        SetVehicleEngineOn(vehicle, false, true, true)
        SetVehicleBrake(vehicle, false)
        if owner == playerId and seat == -1 then
            DisableControlAction(0, 34, true)
            DisableControlAction(0, 35, true)
            if IsDisabledControlPressed(0, 34) then TaskVehicleTempAction(ped, vehicle, 11, 1000) end
            if IsDisabledControlPressed(0, 35) then TaskVehicleTempAction(ped, vehicle, 10, 1000) end
        end
    end
end
RegisterNetEvent('OT_pushvehicle:startMove', startMove)

local function stopMove() remotepush = false end
RegisterNetEvent('OT_pushvehicle:stopMove', stopMove)

local function GetNetworkIdFromEntity(v)
    return DoesEntityExist(v) and NetworkGetEntityIsNetworked(v) and NetworkGetNetworkIdFromEntity(v) or nil
end

-- 押し開始（ここで方向を記録！）
local function startPushing(vehicle)
    local health = GetVehicleEngineHealth(vehicle) <= Config.healthMin
    if not health or IsEntityUpsidedown(vehicle) then return end

    local min, max = GetModelDimensions(GetEntityModel(vehicle))
    local coords = GetEntityCoords(ped)
    local closest = #(coords - GetOffsetFromEntityInWorldCoords(vehicle, 0.0, max.y, 0.0)) < #(coords - GetOffsetFromEntityInWorldCoords(vehicle, 0.0, min.y, 0.0)) and 'bonnet' or 'trunk'

    local netid = GetNetworkIdFromEntity(vehicle)
    if not netid then return end

    local success = lib.callback.await('OT_pushvehicle:startPushing', 500, netid, closest)
    if success then
        vehiclepushing = vehicle
        pushing = true
        pushDirection = closest  -- ← ここで方向を記憶！

        AttachEntityToEntity(ped, vehicle, 0, 0.0,
            closest == 'trunk' and min.y - 0.6 or -min.y + 0.4,
            closest == 'trunk' and min.z + 1.1 or max.z / 2,
            0.0, 0.0, closest == 'trunk' and 0.0 or 180.0,
            false, false, true, 0, true)
        lib.requestAnimDict('missfinale_c2ig_11')
        TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 1.5, 1.5, -1, 35, 0, false, false, false)
    end
end

-- 押し停止
local function stopPushing()
    if not vehiclepushing then return end
    TriggerServerEvent('OT_pushvehicle:stopPushing', NetworkGetNetworkIdFromEntity(vehiclepushing))
    vehiclepushing = nil
    pushing = false
    pushDirection = nil
    DetachEntity(ped, true, false)
    ClearPedTasks(ped)
end
RegisterNetEvent('OT_pushvehicle:detach', stopPushing)

-- ox_target専用（Eキー完全削除）
if Config.target then
    local options = {
        {
            name = 'startPushing',
            icon = 'fa-solid fa-hands',
            label = '車両を押す',
            onSelect = function(data) startPushing(data.entity) end,
            canInteract = function(entity)
                if pushing then return false end
                local health = GetVehicleEngineHealth(entity) <= Config.healthMin
                return health and not IsEntityUpsidedown(entity)
            end
        },
        {
            name = 'stopPushing',
            icon = 'fa-solid fa-xmark',
            label = '押すのをやめる',
            onSelect = stopPushing,
            canInteract = function() return pushing end
        }
    }

    if Config.Usebones then
        for i = 1, #options do options[i].bones = {'bonnet', 'boot'} end
    end

    exports.ox_target:addGlobalVehicle(options)
end

lib.onCache('ped', function(v) ped = v end)
lib.onCache('seat', function(v) seat = v end)

-- A/Dでハンドル操作（復活させる神コード）
lib.addKeybind({
    name = 'pushvehicle_turn_left',
    description = 'Push vehicle - Turn left',
    defaultKey = 'A',
    onPressed = function()
        if pushing and vehiclepushing then
            TriggerServerEvent('OT_pushvehicle:startTurn', NetworkGetNetworkIdFromEntity(vehiclepushing), 'left')
        end
    end,
    onReleased = function()
        if pushing and vehiclepushing then
        TriggerServerEvent('OT_pushvehicle:stopTurn', NetworkGetNetworkIdFromEntity(vehiclepushing))
        end
    end
})

lib.addKeybind({
    name = 'pushvehicle_turn_right',
    description = 'Push vehicle - Turn right',
    defaultKey = 'D',
    onPressed = function()
        if pushing and vehiclepushing then
            TriggerServerEvent('OT_pushvehicle:startTurn', NetworkGetNetworkIdFromEntity(vehiclepushing), 'right')
        end
    end,
    onReleased = function()
        if pushing and vehiclepushing then
            TriggerServerEvent('OT_pushvehicle:stopTurn', NetworkGetNetworkIdFromEntity(vehiclepushing))
        end
    end
})