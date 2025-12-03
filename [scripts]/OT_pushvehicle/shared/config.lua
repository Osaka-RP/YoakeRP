Config = {}

Config.target = false -- Use target system for vehicle push (disables TextUI)
Config.targetSystem = 'ox_target' -- Target System to use. ox_target, qtarget, qb-target
Config.Usebones = true -- Use bones for vehicle push
Config.PushKey = 'E' -- Key to push vehicle
Config.TurnRightKey = 'D' -- Keys to turn the vehicle while pushing it.
Config.TurnLeftKey = 'A' -- Keys to turn the vehicle while pushing it.
Config.TextUI = true -- Use Text UI for vehicle push
Config.useOTSkills = false -- Use OT Skills for XP gain from pushing vehicles. Found here: https://otstudios.tebex.io
Config.maxReward = 20 -- 車両を押すことで 1 回のプッシュで獲得できる XP の最大量。これが OT_skills 設定で強度に設定されている値と同じか、それ以下であることを確認してください。
Config.healthMin = 9999.0 -- 車両を押すことができる最小限の車両の健全性。

Config.blacklist = { -- blacklist vehicle models from being pushed.
    [`phantom`] = true
}