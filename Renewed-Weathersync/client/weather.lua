-- Renewed-Weathersync - client/weather.lua (safe EXTRASUNNY default)

local DEFAULT_WEATHER = {
    weather = 'EXTRASUNNY',
    windDirection = 0.0,
    windSpeed = 0.0,
    hasSnow = false
}

-- 既定は DEFAULT_WEATHER。サーバーが後から GlobalState を埋めてもハンドラで上書きされる
local serverWeather = GlobalState.weather or DEFAULT_WEATHER
local hadSnow = false
local playerState = LocalPlayer.state

-- ===== Snow / particle helpers =====
local function resetWeatherParticles()
    if hadSnow then
        SetForceVehicleTrails(false)
        SetForcePedFootstepsTracks(false)
        ReleaseNamedScriptAudioBank('ICE_FOOTSTEPS')
        ReleaseNamedScriptAudioBank('SNOW_FOOTSTEPS')
        ForceSnowPass(false)
        WaterOverrideSetStrength(0.5)
        RemoveNamedPtfxAsset('core_snow')

        if IsIplActive('alamo_ice') then
            RemoveIpl('alamo_ice')
        end

        hadSnow = false
    end
end

local function setWeatherParticles()
    if not hadSnow then
        lib.requestNamedPtfxAsset('core_snow', 1000)
        UseParticleFxAsset('core_snow')

        ForceSnowPass(true)
        SetForceVehicleTrails(true)
        SetForcePedFootstepsTracks(true)
        RequestScriptAudioBank('ICE_FOOTSTEPS', false)
        RequestScriptAudioBank('SNOW_FOOTSTEPS', false)
        WaterOverrideSetStrength(0.9)

        if GetResourceState('nve_iced_alamo') ~= 'missing' then
            RequestIpl('alamo_ice')
        end

        hadSnow = true
    end
end

-- ===== Apply weather safely =====
local function setWeather(forceSwap)
    -- serverWeather が nil / weather 欠落ならデフォルトにフォールバック
    if not serverWeather or not serverWeather.weather then
        serverWeather = DEFAULT_WEATHER
    end

    SetRainLevel(-1.0)

    if forceSwap then
        SetWeatherTypeNowPersist(serverWeather.weather)
    else
        SetWeatherTypeOvertimePersist(serverWeather.weather, 60.0)
    end

    if serverWeather.windDirection then
        SetWindDirection(math.rad(serverWeather.windDirection))
    end

    if serverWeather.windSpeed then
        SetWind(serverWeather.windSpeed / 2)
    end

    if serverWeather.hasSnow then
        setWeatherParticles()
    elseif hadSnow then
        resetWeatherParticles()
    end
end

-- ===== Global state change: weather =====
AddStateBagChangeHandler('weather', 'global', function(_, _, value)
    if value then
        serverWeather = value
        if playerState.syncWeather then
            setWeather()
        end
    end
end)

-- ===== Global state change: blackout (両方のキーに対応しておく) =====
local function applyBlackout(value)
    if type(value) == 'boolean' then
        SetArtificialLightsState(value)
    end
    SetArtificialLightsStateAffectsVehicles(false)
end

AddStateBagChangeHandler('blackOut', 'global', function(_, _, value)
    applyBlackout(value)
end)

AddStateBagChangeHandler('blackout', 'global', function(_, _, value)
    applyBlackout(value)
end)

-- ===== On client start =====
CreateThread(function ()
    while not NetworkIsSessionStarted() do -- slow clients 対策
        Wait(100)
    end

    -- サーバーが GlobalState.weather を出すまで少し待つ（最大5秒）
    local waited = 0
    while not GlobalState.weather and waited < 5000 do
        Wait(100)
        waited = waited + 100
    end
    serverWeather = GlobalState.weather or DEFAULT_WEATHER

    SetWind(0.1)
    WaterOverrideSetStrength(0.5)

    setWeather(true)

    playerState.syncWeather = true
    playerState.playerWeather = 'EXTRASUNNY'

    -- blackout の初期反映（どちらのキーでも拾う）
    if type(GlobalState.blackout) == 'boolean' then
        SetArtificialLightsState(GlobalState.blackout)
    elseif type(GlobalState.blackOut) == 'boolean' then
        SetArtificialLightsState(GlobalState.blackOut)
    end
    SetArtificialLightsStateAffectsVehicles(false)
end)

-- ===== Per-player sync toggle =====
AddStateBagChangeHandler('syncWeather', ('player:%s'):format(cache.serverId), function(_, _, value)
    if not value then
        SetTimeout(0, function()
            resetWeatherParticles()
            while not playerState.syncWeather do
                local setWeatherType = playerState.playerWeather or 'EXTRASUNNY'
                SetRainLevel(0.0)
                SetWeatherTypePersist(setWeatherType)
                SetWeatherTypeNow(setWeatherType)
                SetWeatherTypeNowPersist(setWeatherType)
                Wait(2500)
            end
        end)
    else
        setWeather(true)
    end
end)
