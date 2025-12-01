--[[
BY RX Scripts © rxscripts.xyz
--]]

Config = {}

Config.Locale = 'en'

Config.ReceiveMoney = {
    enabled = true, -- When enabled, money from paid invoices go to the sender/society account
    deductTax = 0.00, -- Tax percentage that will be deducted from the invoice amount when paid (0.05 = 5%)
}

Config.PlayerInvoices = { -- Automatic payment is disabled within this feature, so it cannot get abused
    enabled = true, -- Allow players to send invoices to other players
    maxInvoices = 5, -- Maximum number of pending invoices a player can send in total (to prevent spamming)
}

Config.JobInvoices = {
    ['police'] = {
        label = 'Police',
        requiredGrade = 2, -- The minimum grade required to create & pay invoices
        presetInvoices = {
            { name = 'Running Red Light', amount = 250, reason = 'Running Red Light' },
            { name = 'Illegal Parking',   amount = 150, reason = 'Illegal Parking' },
            { name = 'Speeding',          amount = 300, reason = 'Speeding' },
            { name = 'Reckless Driving',  amount = 500, reason = 'Reckless Driving' },
            { name = 'Assault',           amount = 1000, reason = 'Assault' },
        }
    },
    ['ambulance'] = {
        label = 'Ambulance',
        requiredGrade = 2, -- The minimum grade required to create & pay invoices
        presetInvoices = {
            { name = 'Medical Service', amount = 500, reason = 'Medical Service' },
            { name = 'Ambulance Call',   amount = 300, reason = 'Ambulance Call' },
        }
    },
    ['mechanic'] = {
        label = 'Mechanic',
        requiredGrade = 1, -- The minimum grade required to create & pay invoices
        presetInvoices = {
            { name = 'Car Repair', amount = 200, reason = 'Car Repair' },
            { name = 'Towing Service', amount = 300, reason = 'Towing Service' },
        }
    },
    ['taxi'] = {
        label = 'Taxi',
        requiredGrade = 1, -- The minimum grade required to create & pay invoices
        presetInvoices = {
            { name = 'Taxi Service', amount = 100, reason = 'Taxi Service' },
            { name = 'Airport Transfer', amount = 200, reason = 'Airport Transfer' },
        }
    },
}

Config.AutoPay = {
    enabled = true, -- Enable automatic payment of invoices after a certain time of pending
    hours = 24, -- Time in hours after which the invoice will be automatically paid
    feePercentagePerHour = 0.05 -- Percentage of the invoice amount that will be added as a fee for each hour of pending time (0.05 = 5%)
}

Config.Commands = {
    openBilling = 'billing', -- /billing | Open the billing menu
}

Config.Keybinds = {
    openBilling = 'F10', -- Opens the billing menu | Set to false to disable
}

Config.UI = {
    color = {
        primary = { -- Different shades of primary color
            [50] = "#FEDDE9",
            [100] = "#FCBAD3",
            [200] = "#FA76A6",
            [300] = "#F7317A",
            [400] = "#D80955",
            [500] = "#95063B",
            [600] = "#76052E",
            [700] = "#580423",
            [800] = "#3B0217",
            [900] = "#1D010C",
            [950] = "#0F0106"
        },
    }
}

--[[
    ONLY CHANGE THIS PART IF YOU HAVE RENAMED SCRIPTS SUCH AS FRAMEWORK, TARGET, INVENTORY ETC
    RENAME THE SCRIPT NAME TO THE NEW NAME
--]]
---@type table Only change these if you have changed the name of a resource
Resources = {
    FM = { name = 'fmLib', export = 'new' },
    RX_BANKING = { name = 'RxBanking', export = 'all' },
}
IgnoreScriptFoundLogs = false
