Config = {}

Config.Framework = 'qb' -- qb, oldqb, esx, oldesx or autodetect（自動判定）
Config.MySQL = 'oxmysql' -- oxmysql, ghamattimysql, mysql-async | fxmanifest.lua の修正を忘れずに
Config.Language = 'ja' -- 使用言語: en, tr, jp

Config.TestDriveTime = 60 -- 試乗時間（秒）
Config.TestDrivePrice = 5000 -- 試乗料金
Config.TestDrivePlate = 'TESTDRIVE' -- 試乗車のナンバー
Config.PlateChange = true -- true の場合、プレイヤーがナンバー変更可能
Config.PlateChangePrice = 10000 -- ナンバー変更費用

Config.DefaultGarage = 'pillboxgarage' -- 購入した車両の garage カラムに書き込むガレージ名
Config.PhoneMailOnline = 'qb-phone:server:sendNewMail' -- オンラインプレイヤーにメールを送るイベント。使用している電話スクリプトに合わせて変更してください。

Config.CheckSalaryStatus = { -- 毎日 12:00 に給与支払いチェックを行う設定
    Hour = 12,
    Minute = 00,
}

Config.GiveVehicleKey = true -- 購入・試乗後に車両キーを付与するかどうか
Config.VehicleKeySystem = 'qb-vehiclekeys' -- cd_garage | qs-vehiclekeys | wasabi-carlock | qb-vehiclekeys | custom
Config.GiveVehicleKeys = function(plate, model, vehicle)
    if Config.GiveVehicleKey then
        if Config.VehicleKeySystem == 'cd_garage' then
            TriggerEvent('cd_garage:AddKeys', exports['cd_garage']:GetPlate(vehicle))
        elseif Config.VehicleKeySystem == 'qs-vehiclekeys' then
            exports['qs-vehiclekeys']:GiveKeys(plate, model)
        elseif Config.VehicleKeySystem == 'wasabi-carlock' then
            exports.wasabi_carlock:GiveKey(plate)
        elseif Config.VehicleKeySystem == 'qb-vehiclekeys' then
            TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
        elseif Config.VehicleKeySystem == 'custom' then
            -- 独自キーシステムを使用する場合はここに処理を追加
        end
    end
end

Config.Notification = function(msg, type, server, src) -- 通知関数
    if server then
        if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            TriggerClientEvent('QBCore:Notify', src, msg, type, 3000) -- QBCore - クライアントイベント
        else
            TriggerClientEvent('esx:showNotification', src, msg) -- ESX - クライアントイベント
        end
    else
        if Config.Framework == 'qb' or Config.Framework == 'oldqb' then
            TriggerEvent('QBCore:Notify', msg, type, 3000) -- QBCore - サーバーイベント
        else
            TriggerEvent('esx:showNotification', msg) -- ESX - サーバーイベント
        end
    end
end

Config.CheckProfanities = true -- フィードバックやクレームに不適切な単語が含まれているかをチェックするか
Config.Profanities = { -- 不適切と判定する英単語の一覧
    "fuck",
    "shit",
    "bitch",
    "asshole",
    "bastard",
    "damn",
    "crap",
    "dick",
    "piss",
    "cock",
    "cunt",
    "prick",
    "twat",
    "slut",
    "whore",
    "motherfucker",
    "douchebag",
    "wanker",
    "bollocks",
    "arse"
}

Config.FeedbackCharacterCheck = { -- フィードバック入力時の最小・最大文字数
    MinimumCharacter = 50,
    MaximumCharacter = 150,
}

Config.ComplaintCharacterCheck = { -- クレームフォーム入力時の最小・最大文字数
    MinimumCharacter = 50,
    MaximumCharacter = 150,
}

Config.VehiclesData = {
    ['car'] = {
        { name = 't20', label = 'T20', model = 'Custom', price = 150000, stock = 1, img = 'https://docs.fivem.net/vehicles/t20.webp', category = 'sports', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'sultanrs', label = 'Sultan RS', model = '', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/sultanrs.webp', category = 'sedans', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'adder', label = 'Adder', model = '', price = 1000000, stock = 1, img = 'https://docs.fivem.net/vehicles/adder.webp', category = 'super', discount = 0, information = {TopSpeed = 250, Braking = 95, Acceleration = 90, Suspension = 95, Handling = 88} },
        { name = 'banshee', label = 'Banshee', model = '', price = 105000, stock = 1, img = 'https://docs.fivem.net/vehicles/banshee.webp', category = 'sports', discount = 0, information = {TopSpeed = 240, Braking = 92, Acceleration = 85, Suspension = 90, Handling = 87} },
        { name = 'carbonizzare', label = 'Carbonizzare', model = '', price = 195000, stock = 1, img = 'https://docs.fivem.net/vehicles/carbonizzare.webp', category = 'sports', discount = 0, information = {TopSpeed = 230, Braking = 93, Acceleration = 80, Suspension = 85, Handling = 84} },
        { name = 'cheetah', label = 'Cheetah', model = '', price = 650000, stock = 1, img = 'https://docs.fivem.net/vehicles/cheetah.webp', category = 'super', discount = 0, information = {TopSpeed = 250, Braking = 94, Acceleration = 85, Suspension = 90, Handling = 90} },
        { name = 'entityxf', label = 'Entity', model = 'XF Model', price = 795000, stock = 1, img = 'https://docs.fivem.net/vehicles/entityxf.webp', category = 'super', discount = 0, information = {TopSpeed = 245, Braking = 95, Acceleration = 88, Suspension = 92, Handling = 91} },
        { name = 'infernus', label = 'Infernus', model = '', price = 440000, stock = 1, img = 'https://docs.fivem.net/vehicles/infernus.webp', category = 'super', discount = 0, information = {TopSpeed = 245, Braking = 94, Acceleration = 87, Suspension = 91, Handling = 90} },
        { name = 'italigtb', label = 'Itali', model = 'GTB', price = 1189000, stock = 1, img = 'https://docs.fivem.net/vehicles/italigtb.webp', category = 'super', discount = 0, information = {TopSpeed = 250, Braking = 96, Acceleration = 89, Suspension = 94, Handling = 92} },
        { name = 'osiris', label = 'Osiris', model = '', price = 1950000, stock = 1, img = 'https://docs.fivem.net/vehicles/osiris.webp', category = 'super', discount = 0, information = {TopSpeed = 240, Braking = 95, Acceleration = 88, Suspension = 93, Handling = 89} },
        { name = 'reaper', label = 'Reaper', model = '', price = 1595000, stock = 1, img = 'https://docs.fivem.net/vehicles/reaper.webp', category = 'super', discount = 0, information = {TopSpeed = 245, Braking = 96, Acceleration = 90, Suspension = 92, Handling = 91} },
        { name = 'tempesta', label = 'Tempesta', model = '', price = 1329000, stock = 1, img = 'https://docs.fivem.net/vehicles/tempesta.webp', category = 'super', discount = 0, information = {TopSpeed = 250, Braking = 97, Acceleration = 91, Suspension = 95, Handling = 93} },
        { name = 'turismor', label = 'Turismo', model = 'R Model', price = 500000, stock = 1, img = 'https://docs.fivem.net/vehicles/turismor.webp', category = 'super', discount = 0, information = {TopSpeed = 240, Braking = 95, Acceleration = 86, Suspension = 89, Handling = 88} },
        { name = 'vacca', label = 'Vacca', model = '', price = 240000, stock = 1, img = 'https://docs.fivem.net/vehicles/vacca.webp', category = 'super', discount = 0, information = {TopSpeed = 235, Braking = 92, Acceleration = 85, Suspension = 87, Handling = 86} },
        { name = 'zentorno', label = 'Zentorno', model = '', price = 725000, stock = 1, img = 'https://docs.fivem.net/vehicles/zentorno.webp', category = 'super', discount = 0, information = {TopSpeed = 250, Braking = 96, Acceleration = 92, Suspension = 95, Handling = 94} },
        { name = 'coquette', label = 'Coquette', model = '', price = 138000, stock = 1, img = 'https://docs.fivem.net/vehicles/coquette.webp', category = 'sports', discount = 0, information = {TopSpeed = 230, Braking = 90, Acceleration = 83, Suspension = 84, Handling = 82} },
        { name = 'sabregt', label = 'Sabre', model = 'Turbo', price = 15000, stock = 1, img = 'https://docs.fivem.net/vehicles/sabregt.webp', category = 'muscle', discount = 0, information = {TopSpeed = 200, Braking = 85, Acceleration = 75, Suspension = 80, Handling = 78} },
        { name = 'dominator', label = 'Dominator', model = '', price = 35000, stock = 1, img = 'https://docs.fivem.net/vehicles/dominator.webp', category = 'muscle', discount = 0, information = {TopSpeed = 210, Braking = 87, Acceleration = 78, Suspension = 82, Handling = 80} },
        { name = 'f812', label = '812 Superfast', model = '', price = 30000000, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281040909340826/f812.png?ex=692fc65c&is=692e74dc&hm=fb7b2465315a99d713672bd08bfa514ea0c2b126cc221a551f56d2cafc95af73&', category = 'super', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} },
        { name = 'polbuffwb', label = 'Police Buffalo STX', model = '', price = 0, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281037188861952/polbuffwb.png?ex=692fc65b&is=692e74db&hm=24d0e22c51df1ae9cb03a892422acf13ba1ad10b46f8099a4a8686fe19f180bd&', category = 'sports', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} },
        { name = 'polrevent', label = 'Police Reventon', model = '', price = 0, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281037541314600/polrevent.png?ex=692fc65b&is=692e74db&hm=780b0c10472f344aac28083cdbd36d00a71c4cfce6d94e329260e01a45e9cbc9&', category = 'sports', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} },
        { name = 'adlc500', label = 'Lexus LC500', model = '', price = 15000000, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281037901889698/adlc500.png?ex=692fc65b&is=692e74db&hm=5e9ff63f0d4b48a1ecad0783e65a2757de96fc63cd0bb8e75423eb22b8546d61&', category = 'sports', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} },
        { name = 'al18', label = 'Toyota Alphard', model = '', price = 7000000, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281038321451058/al18.png?ex=692fc65b&is=692e74db&hm=43c43bd2d587277d52b3a6e91ee7a649fc8c0785b2aa2fae11e89799273f87c0&', category = 'all', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} },
        { name = 'nbmazda3', label = 'Mazda3 FastBack', model = '', price = 2500000, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281038799605912/nbmazda3.png?ex=692fc65b&is=692e74db&hm=95496993e3e26d920d029e18a9a5d65ca66722b00c2138fba4c21f57a3987f2d&', category = 'sports', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} },
        { name = 'gr86', label = 'Toyota GR86', model = '', price = 4500000, stock = 1, img = 'https://cdn.discordapp.com/attachments/1289131190996959244/1445281039478952096/gr86.png?ex=692fc65b&is=692e74db&hm=93e3861b8d78a6456fc527bf87fd46531f993214bf39e1fcdb11afe57f381d9f&', category = 'sports', discount = 0, information = {TopSpeed = 215, Braking = 88, Acceleration = 80, Suspension = 84, Handling = 82} }
    },

    ['boat'] = {
        { name = 'seashark2', label = 'Seashark2', model = 'Normal', price = 15000, stock = 1, img = 'https://docs.fivem.net/vehicles/seashark2.webp', category = 'all', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'seashark3', label = 'Seashark3', model = 'Turbo', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/seashark3.webp', category = 'all', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'toro2', label = 'Toro', model = 'Luxury', price = 100000, stock = 1, img = 'https://docs.fivem.net/vehicles/toro2.webp', category = 'all', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'dinghy', label = 'Dinghy', model = 'Standard', price = 20000, stock = 1, img = 'https://docs.fivem.net/vehicles/dinghy.webp', category = 'all', discount = 0, information = {TopSpeed = 230, Braking = 90, Acceleration = 85, Suspension = 90, Handling = 87} },
        { name = 'jetmax', label = 'Jetmax', model = 'High Performance', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/jetmax.webp', category = 'all', discount = 0, information = {TopSpeed = 260, Braking = 95, Acceleration = 90, Suspension = 95, Handling = 90} },
        { name = 'speeder', label = 'Speeder', model = 'Sport', price = 90000, stock = 1, img = 'https://docs.fivem.net/vehicles/speeder.webp', category = 'all', discount = 0, information = {TopSpeed = 250, Braking = 92, Acceleration = 88, Suspension = 90, Handling = 88} },
        { name = 'suntrap', label = 'Suntrap', model = 'Standard', price = 30000, stock = 1, img = 'https://docs.fivem.net/vehicles/suntrap.webp', category = 'all', discount = 0, information = {TopSpeed = 210, Braking = 80, Acceleration = 75, Suspension = 80, Handling = 78} },
        { name = 'squalo', label = 'Squalo', model = 'Sport', price = 80000, stock = 1, img = 'https://docs.fivem.net/vehicles/squalo.webp', category = 'all', discount = 0, information = {TopSpeed = 240, Braking = 90, Acceleration = 85, Suspension = 88, Handling = 86} },
        { name = 'tropic', label = 'Tropic', model = 'Luxury', price = 60000, stock = 1, img = 'https://docs.fivem.net/vehicles/tropic.webp', category = 'all', discount = 0, information = {TopSpeed = 230, Braking = 88, Acceleration = 82, Suspension = 85, Handling = 84} },
        { name = 'dinghy2', label = 'Dinghy 2', model = 'Standard', price = 22000, stock = 1, img = 'https://docs.fivem.net/vehicles/dinghy2.webp', category = 'all', discount = 0, information = {TopSpeed = 235, Braking = 91, Acceleration = 86, Suspension = 90, Handling = 88} },
        { name = 'speeder2', label = 'Speeder 2', model = 'Sport', price = 95000, stock = 1, img = 'https://docs.fivem.net/vehicles/speeder2.webp', category = 'all', discount = 0, information = {TopSpeed = 255, Braking = 93, Acceleration = 89, Suspension = 92, Handling = 90} },
        { name = 'tropic2', label = 'Tropic 2', model = 'Luxury', price = 65000, stock = 1, img = 'https://docs.fivem.net/vehicles/tropic2.webp', category = 'all', discount = 0, information = {TopSpeed = 235, Braking = 89, Acceleration = 83, Suspension = 86, Handling = 85} },
    },

    ['aircraft'] = {
        { name = 'volatus', label = 'Volatus', model = 'Luxury Helicopter', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/volatus.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'buzzard', label = 'Buzzard', model = 'Combat Helicopter', price = 750000, stock = 1, img = 'https://docs.fivem.net/vehicles/buzzard.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 250, Braking = 95, Acceleration = 90, Suspension = 95, Handling = 90} },
        { name = 'maverick', label = 'Maverick', model = 'Utility Helicopter', price = 780000, stock = 1, img = 'https://docs.fivem.net/vehicles/maverick.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 240, Braking = 93, Acceleration = 85, Suspension = 92, Handling = 88} },
        { name = 'cargobob', label = 'Cargobob', model = 'Heavy Lift Helicopter', price = 1850000, stock = 1, img = 'https://docs.fivem.net/vehicles/cargobob.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 200, Braking = 80, Acceleration = 75, Suspension = 85, Handling = 80} },
        { name = 'frogger', label = 'Frogger', model = 'Civilian Helicopter', price = 1300000, stock = 1, img = 'https://docs.fivem.net/vehicles/frogger.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 230, Braking = 85, Acceleration = 80, Suspension = 87, Handling = 84} },
        { name = 'luxor', label = 'Luxor', model = 'Private Jet', price = 1625000, stock = 1, img = 'https://docs.fivem.net/vehicles/luxor.webp', category = 'plane', discount = 0, information = {TopSpeed = 300, Braking = 100, Acceleration = 95, Suspension = 100, Handling = 95} },
        { name = 'shamal', label = 'Shamal', model = 'Business Jet', price = 1150000, stock = 1, img = 'https://docs.fivem.net/vehicles/shamal.webp', category = 'plane', discount = 0, information = {TopSpeed = 290, Braking = 98, Acceleration = 93, Suspension = 98, Handling = 93} },
        { name = 'vestra', label = 'Vestra', model = 'Light Aircraft', price = 950000, stock = 1, img = 'https://docs.fivem.net/vehicles/vestra.webp', category = 'plane', discount = 0, information = {TopSpeed = 280, Braking = 96, Acceleration = 91, Suspension = 96, Handling = 91} },
        { name = 'dodo', label = 'Dodo', model = 'Amphibious Aircraft', price = 500000, stock = 1, img = 'https://docs.fivem.net/vehicles/dodo.webp', category = 'plane', discount = 0, information = {TopSpeed = 270, Braking = 94, Acceleration = 89, Suspension = 94, Handling = 89} },
        { name = 'cuban800', label = 'Cuban 800', model = 'Cargo Aircraft', price = 220000, stock = 1, img = 'https://docs.fivem.net/vehicles/cuban800.webp', category = 'plane', discount = 0, information = {TopSpeed = 260, Braking = 92, Acceleration = 87, Suspension = 92, Handling = 87} }
    },    
}

Config.Categories = {
    ['car'] = {
        { -- この項目は削除しないでください
            name = 'all',
            label = 'すべて'
        },
        {
            name = 'sports',
            label = 'スポーツ'
        },
        {
            name = 'sedans',
            label = 'セダン'
        },
        {
            name = 'muscle',
            label = 'マッスル'
        },
        {
            name = 'super',
            label = 'スーパーカー'
        },
    },

    ['boat'] = {
        { -- この項目は削除しないでください
            name = 'all',
            label = 'すべて'
        },
    },

    ['aircraft'] = {
        { -- この項目は削除しないでください
            name = 'all',
            label = 'すべて'
        },
        {
            name = 'helicopter',
            label = 'ヘリコプター'
        },
        {
            name = 'plane',
            label = '飛行機'
        },
    },
}

Config.BossmenuCategories = { -- name は変更しないでください。label のみ編集可能。
    {name = 'dashboard',        label = 'ダッシュボード'}, 
    {name = 'company',          label = '会社'}, 
    {name = 'category',         label = 'カテゴリ'}, 
    {name = 'vehicles',         label = '車両'}, 
    {name = 'perms',            label = '権限'}, 
    {name = 'feedbackcomplains', label = 'フィードバック／クレーム'}, 
}

Config.BeginningVehicles = {  
    ['car'] = {
        { name = 't20', label = 'T20', model = 'Custom', price = 150000, stock = 1, img = 'https://docs.fivem.net/vehicles/t20.webp', category = 'sports', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'sultanrs', label = 'Sultan RS', model = '', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/sultanrs.webp', category = 'sedans', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
    },

    ['boat'] = {
        { name = 'seashark2', label = 'Seashark2', model = 'Normal', price = 15000, stock = 1, img = 'https://docs.fivem.net/vehicles/seashark2.webp', category = 'all', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'seashark3', label = 'Seashark3', model = 'Turbo', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/seashark3.webp', category = 'all', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
    },

    ['aircraft'] = {
        { name = 'volatus', label = 'Volatus', model = 'Luxury Helicopter', price = 50000, stock = 1, img = 'https://docs.fivem.net/vehicles/volatus.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 273, Braking = 100, Acceleration = 89, Suspension = 100, Handling = 89} },
        { name = 'buzzard', label = 'Buzzard', model = 'Combat Helicopter', price = 750000, stock = 1, img = 'https://docs.fivem.net/vehicles/buzzard.webp', category = 'helicopter', discount = 0, information = {TopSpeed = 250, Braking = 95, Acceleration = 90, Suspension = 95, Handling = 90} },
    },
}

Config.Colors = { -- ゲーム内の車両カラーインデックス（ほとんど登録済みのため、基本的に変更不要） | https://wiki.rage.mp/index.php?title=Vehicle_Colors
    ["0"] =   {name = "ブラック", hex = "#0d1116"},
    ["147"] = {name = "カーボンブラック", hex = "#11141a"},
    ["1"] =   {name = "グラファイト", hex = "#1c1d21"},
    ["11"] =  {name = "アンスラサイトブラック", hex = "#1d2129"},
    ["2"] =   {name = "ブラックスチール", hex = "#32383d"},
    ["3"] =   {name = "ダークスチール", hex = "#454b4f"},
    ["4"] =   {name = "シルバー", hex = "#999da0"},
    ["5"] =   {name = "ブルーイッシュシルバー", hex = "#c2c4c6"},
    ["6"] =   {name = "ロールドスチール", hex = "#979a97"},
    ["7"] =   {name = "シャドウシルバー", hex = "#637380"},
    ["8"] =   {name = "ストーンシルバー", hex = "#63625c"},
    ["9"] =   {name = "ミッドナイトシルバー", hex = "#3c3f47"},
    ["10"] =  {name = "キャストアイアンシルバー", hex = "#444e54"},
    ["27"] =  {name = "レッド", hex = "#c00e1a"},
    ["28"] =  {name = "トリノレッド", hex = "#da1918"},
    ["29"] =  {name = "フォーミュラレッド", hex = "#b6111b"},
    ["150"] = {name = "ラバレッド", hex = "#bc1917"},
    ["30"] =  {name = "ブレイズレッド", hex = "#a51e23"},
    ["31"] =  {name = "グレースレッド", hex = "#7b1a22"},
    ["32"] =  {name = "ガーネットレッド", hex = "#8e1b1f"},
    ["33"] =  {name = "サンセットレッド", hex = "#6f1818"},
    ["34"] =  {name = "カベルネレッド", hex = "#49111d"},
    ["143"] = {name = "ワインレッド", hex = "#0e0d14"},
    ["35"] =  {name = "キャンディレッド", hex = "#b60f25"},
    ["135"] = {name = "ホットピンク", hex = "#f21f99"},
    ["137"] = {name = "フィスター ピンク", hex = "#df5891"},
    ["136"] = {name = "サーモンピンク", hex = "#fdd6cd"},
    ["36"] =  {name = "サンライズオレンジ", hex = "#d44a17"},
    ["38"] =  {name = "オレンジ", hex = "#f78616"},
    ["138"] = {name = "ブライトオレンジ", hex = "#f6ae20"},
    ["99"] =  {name = "ゴールド", hex = "#ac9975"},
    ["90"] =  {name = "ブロンズ", hex = "#916532"},
    ["88"] =  {name = "イエロー", hex = "#ffcf20"},
    ["89"] =  {name = "レースイエロー", hex = "#fbe212"},
    ["91"] =  {name = "デューイエロー", hex = "#e0e13d"},
    ["49"] =  {name = "ダークグリーン", hex = "#132428"},
    ["50"] =  {name = "レーシンググリーン", hex = "#122e2b"},
    ["51"] =  {name = "シーグリーン", hex = "#12383c"},
    ["52"] =  {name = "オリーブグリーン", hex = "#31423f"},
    ["53"] =  {name = "ブライトグリーン", hex = "#155c2d"},
    ["54"] =  {name = "ガソリングリーン", hex = "#1b6770"},
    ["92"] =  {name = "ライムグリーン", hex = "#98d223"},
    ["141"] = {name = "ミッドナイトブルー", hex = "#0a0c17"},
    ["61"] =  {name = "ギャラクシーブルー", hex = "#222e46"},
    ["62"] =  {name = "ダークブルー", hex = "#233155"},
    ["63"] =  {name = "ザクソンブルー", hex = "#304c7e"},
    ["64"] =  {name = "ブルー", hex = "#47578f"},
    ["65"] =  {name = "マリナーブルー", hex = "#637ba7"},
    ["66"] =  {name = "ハーバーブルー", hex = "#394762"},
    ["67"] =  {name = "ダイヤモンドブルー", hex = "#d6e7f1"},
    ["68"] =  {name = "サーフブルー", hex = "#76afbe"},
    ["69"] =  {name = "ノーティカルブルー", hex = "#345e72"},
    ["73"] =  {name = "レーシングブルー", hex = "#2354a1"},
    ["70"] =  {name = "ウルトラブルー", hex = "#0b9cf1"},
    ["74"] =  {name = "ライトブルー", hex = "#6ea3c6"},
    ["96"] =  {name = "チョコレートブラウン", hex = "#221b19"},
    ["101"] = {name = "バイソンブラウン", hex = "#402e2b"},
    ["95"] =  {name = "グリーンブラウン", hex = "#473f2b"},
    ["94"] =  {name = "フェルツァーブラウン", hex = "#503218"},
    ["97"] =  {name = "メイプルブラウン", hex = "#653f23"},
    ["103"] = {name = "ビーチウッドブラウン", hex = "#46231a"},
    ["104"] = {name = "シエナブラウン", hex = "#752b19"},
    ["98"] =  {name = "サドルブラウン", hex = "#775c3e"},
    ["100"] = {name = "モスブラウン", hex = "#6c6b4b"},
    ["102"] = {name = "ウッドビーチブラウン", hex = "#a4965f"},
    ["105"] = {name = "サンディブラウン", hex = "#bfae7b"},
    ["106"] = {name = "ブリーチドブラウン", hex = "#dfd5b2"},
    ["71"] =  {name = "シャフターパープル", hex = "#2f2d52"},
    ["72"] =  {name = "スピニーカーパープル", hex = "#282c4d"},
    ["142"] = {name = "ミッドナイトパープル", hex = "#0c0d18"},
    ["145"] = {name = "ブライトパープル", hex = "#621276"},
    ["107"] = {name = "クリーム", hex = "#f7edd5"},
    ["111"] = {name = "アイスホワイト", hex = "#fffff6"},
    ["112"] = {name = "フロストホワイト", hex = "#eaeaea"}
}
