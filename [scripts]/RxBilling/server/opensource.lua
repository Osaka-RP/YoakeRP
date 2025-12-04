-- rx_billing/server/opensource.lua  ← 全部これに置き換え


local QBCore = exports['qb-core']:GetCoreObject()

Config = Config or {}
Config.DiscordWebhooks = Config.DiscordWebhooks or {
    invoiceSent = '',
    invoicePaid = '',
    invoiceRevoked = '',
    invoiceDeclined = '',
}


-- 社内アカウント名（Renewed-Bankingは全部小文字）
local SocietyAccounts = {
    taxi       = "taxi",
    mechanic   = "mechanic",
    police     = "police",
    ambulance  = "ambulance",
    realestate = "realestate",
    cardealer  = "cardealer",
    -- 自分のサーバーのジョブ全部小文字で追加
}

-- 社内から引く（残高＋明細）
function RemoveMoneyFromSociety(society, amount)
    local acc = SocietyAccounts[society:lower()]
    if not acc then return false end
    
    exports['Renewed-Banking']:removeAccountMoney(acc, amount)
    exports['Renewed-Banking']:handleTransaction(
        acc, "社内口座支払い", amount, "RX-Billing", society.."社内", "請求書支払い", "withdraw"
    )
    return true
end

-- 社内資金取得
function GetSocietyMoney(society)
    local acc = SocietyAccounts[society:lower()]
    if not acc then return 0 end
    return exports['Renewed-Banking']:getAccountMoney(acc) or 0
end

-- 社内に追加（残高＋明細）
function AddMoneyToSociety(society, amount)
    local acc = SocietyAccounts[society:lower()]
    if not acc then return false end
    
    exports['Renewed-Banking']:addAccountMoney(acc, amount)
    exports['Renewed-Banking']:handleTransaction(
        acc, "社内口座受領", amount, "RX-Billing", society.."社内", "請求書受領", "deposit"
    )
    return true
end

-- 個人から引く（source強制＋明細）
function RemoveMoneyFromBank(identifier, amount)
    local src = source
    if not src then return false end
    
    exports['Renewed-Banking']:removeAccountMoney(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        exports['Renewed-Banking']:handleTransaction(
            src, "請求書支払い", amount, "RX-Billing", Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname, "請求書支払い", "withdraw"
        )
    end
    return true
end

-- 個人に追加（source強制＋明細）
function AddMoneyToBank(identifier, amount)
    local src = source
    if not src then return false end
    
    exports['Renewed-Banking']:addAccountMoney(src, amount)
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then
        exports['Renewed-Banking']:handleTransaction(
            src, "請求書受領", amount, "RX-Billing", Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname, "請求書受領", "deposit"
        )
    end
    return true
end