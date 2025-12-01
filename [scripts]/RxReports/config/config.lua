--[[
    フリースクリプト
    ダウンロード: https://store.rxscripts.xyz/
    サポート: https://discord.gg/DHnjcW96an
    BY RX Scripts © rxscripts.xyz
--]]

Config = {}

Config.Locale = 'en'
Config.ToggleNotifications = true -- 新規レポート/担当チケットのチャットなどの通知切替を許可（デフォルトは無効）
Config.MaxReports = 3 -- 1人のプレイヤーが同時に開けるレポートの最大数
Config.HideAdminName = true -- チャット内でプレイヤーに管理者名を非表示にする

Config.Commands = {
    reportPanel = 'report', -- /report | プレイヤー/バグ/その他を報告し、自分のレポートを確認
    staffPanel = 'reports', -- /reports | スタッフ用レポートパネルを開く
    toggleNotifications = 'reportnotify', -- /reportnotify | レポート通知のオン/オフを切り替え
}

Config.Categories = {
    'プレイヤーを報告',
    'バグを報告',
    'その他を報告'
}

--[[
    ACE権限で特定のプレイヤー/グループにレポートパネルのアクセスを付与できます
    例:
        add_ace group.admin reports allow
        add_ace identifier.fivem:1432744 reports allow #Rejox

    もしくは下記のスタッフグループを使用できます
--]]
Config.StaffGroups = {
    'superadmin',
    'admin',
    'god',
    'mod',
}

--[[
    フレームワーク/ターゲット/インベントリ等のスクリプト名を変更した場合のみ
    ここのスクリプト名を新しい名前に書き換えてください
--]]
---@type table リソース名を変更した場合のみ編集
Resources = {
    FM = { name = 'fmLib', export = 'new' },
}
IgnoreScriptFoundLogs = false
