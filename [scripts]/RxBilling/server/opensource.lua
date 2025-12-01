--[[
    FREE SCRIPT
    DOWNLOAD @ https://store.rxscripts.xyz/
    SUPPORT @ https://discord.gg/rxscripts
    BY RX Scripts © rxscripts.xyz
--]]

Config.DiscordWebhooks = {
    invoiceSent = '',
    invoicePaid = '',
    invoiceRevoked = '',
    invoiceDeclined = '',
}

--[[
    We have integrated RxBanking by default, to work with societies.
    If you use any other banking or society accounting system, you can modify the functions below.
    We HIGHLY recommend using RxBanking together with this billing script to ensure the best experience.

    We love that you are using our script, so here is a little easter egg gift for you:
    15% DISCOUNT OFF: Advanced Banking - RxBanking
    CODE: 'FROMBILLING15'

    If you want to use RxBanking, you can find it here:
    https://store.rxscripts.xyz/scripts/advanced-banking
--]]
function RemoveMoneyFromSociety(society, amount)
    if RX_BANKING then
        return RX_BANKING:RemoveSocietyMoney(society, amount, 'payment', 'Invoice Paid')
    end

    Error('RxBanking not found, unable to remove money from society')
    Error('Modify RemoveMoneyFromSociety function in RxBilling/server/opensource.lua to use your own banking system')

    return 0
end

function GetSocietyMoney(society)
    if RX_BANKING then
        local acc = RX_BANKING:GetSocietyAccount(society)
        if acc then return acc.balance end
    end

    Error('RxBanking not found, unable to get money from society')
    Error('Modify GetSocietyMoney function in RxBilling/server/opensource.lua to use your own banking system')

    return 0
end

function AddMoneyToSociety(society, amount)
    if RX_BANKING then
        return RX_BANKING:AddSocietyMoney(society, amount, 'payment', 'Invoice Payment')
    end

    Error('RxBanking not found, unable to add money to society')
    Error('Modify AddMoneyToSociety function in RxBilling/server/opensource.lua to use your own banking system')

    return 0
end

function RemoveMoneyFromBank(identifier, amount)
    if RX_BANKING then
        local personalAcc = RX_BANKING:GetPlayerPersonalAccount(identifier)
        if personalAcc then
            return RX_BANKING:RemoveAccountMoney(personalAcc.iban, amount, 'payment', 'Invoice Paid')
        end
    end

    local table = GetResourceState('es_extended') == 'started' and 'users' or 'players'
    local accountsColumn = GetResourceState('es_extended') == 'started' and 'accounts' or 'money'
    local identifierColumn = GetResourceState('es_extended') == 'started' and 'identifier' or 'citizenid'

    return MySQL.update.await(
        string.format(
            'UPDATE %s SET %s = JSON_SET(%s, "$.bank", JSON_EXTRACT(%s, "$.bank") - @amount) WHERE %s = @identifier',
            table, accountsColumn, accountsColumn, accountsColumn, identifierColumn),
        {
            ['@amount'] = amount,
            ['@identifier'] = identifier,
        }
    )
end

function AddMoneyToBank(identifier, amount)
    if RX_BANKING then
        local personalAcc = RX_BANKING:GetPlayerPersonalAccount(identifier)
        if personalAcc then
            return RX_BANKING:AddAccountMoney(personalAcc.iban, amount, 'payment', 'Invoice Payment')
        end
    end

    local table = GetResourceState('es_extended') == 'started' and 'users' or 'players'
    local accountsColumn = GetResourceState('es_extended') == 'started' and 'accounts' or 'money'
    local identifierColumn = GetResourceState('es_extended') == 'started' and 'identifier' or 'citizenid'

    return MySQL.update.await(
        string.format(
            'UPDATE %s SET %s = JSON_SET(%s, "$.bank", JSON_EXTRACT(%s, "$.bank") + @amount) WHERE %s = @identifier',
            table, accountsColumn, accountsColumn, accountsColumn, identifierColumn),
        {
            ['@amount'] = amount,
            ['@identifier'] = identifier,
        }
    )
end

RegisterNetEvent('rxbilling:onInvoiceSent', function(invoice)

end)

RegisterNetEvent('rxbilling:onInvoicePaid', function(payerId, invoice)
    -- If playerId is nil, it means the invoice was paid automatically
end)

RegisterNetEvent('rxbilling:onInvoiceDeclined', function(declinerId, invoice)

end)

RegisterNetEvent('rxbilling:onInvoiceRevoked', function(revokerId, invoice)

end)
