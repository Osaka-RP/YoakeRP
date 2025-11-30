Config.Vehicleshops = {
    {
        Manageable = false, -- true にすると会社として購入可能になる
        Type = 'car', -- 種類: 'car' => 車両, 'boat' => 船, 'aircraft' => 飛行機 / ヘリ
        Jobs = {'all'}, -- ここに書いたジョブのみショップメニューにアクセス可能。会社として運用するなら 'all' 推奨。
        Price = 150000, -- 会社購入金額
        Marker = "~INPUT_PICKUP~ - 車両ショップを開く", -- ドロー表示テキスト

        Owner = "", -- 触らないこと
        CompanyName = "Real カーディーラー", -- 初期の会社名
        CompanyDescriptionText = "高品質な車両を取り扱うディーラーです。新車から高級車まで幅広くご用意しています。ご希望の1台をぜひお探しください。", -- 会社説明文
        CompanyMoney = 10000, -- 会社口座の初期残高
        Rating = 0, -- 触らないこと
        Vehicles = {}, -- 触らないこと
        Categories = {}, -- 触らないこと
        Feedbacks = {}, -- 触らないこと
        Complaints = {}, -- 触らないこと
        Preorders = {}, -- 触らないこと
        Employees = {}, -- 触らないこと
        SoldVehicles = {}, -- 触らないこと
        Transactions = {}, -- 触らないこと
        Perms = {}, -- 触らないこと
        Discount = 0, -- 触らないこと

        BlipSettings = { -- マップ上のブリップ設定
            Enable = true,
            Sprite = 227,
            Scale = 0.8,
            Color = 0
        },
        SpawnCoords = vector4(-13.99, -1093.8, 26.05, 160.17), -- 購入した車両のスポーン位置
        ShopOpenCoords = vector3(-33.21, -1103.69, 26.42), -- 車両ショップメニューを開く座標
        BossmenuCoords = vector3(-32.04, -1114.23, 26.42), -- ボスメニューを開く座標
        CamSettings = {
            VehiclePos = vector4(797.25, -3000.18, -69.63, 242.65), -- プレビュー表示時の車両位置
            PlayerPos = vector3(806.75, -3000.08, -69.0), -- プレビュー時のプレイヤー位置（車両の正面）
            Coords = vector3(806.75, -3000.08, -69.0), -- プレビューカメラの基準座標
        },
        TestDriveLocation = vector4(-1331.59, -2202.41, 13.32, 149.94), -- 試乗開始位置
        ComplaintForm = vector3(-57.09, -1097.23, 26.42), -- クレームフォーム提出位置
    },
    {
        Manageable = true, 
        Type = 'boat',
        Jobs = {'all'},
        Price = 150000,
        Marker = "~INPUT_PICKUP~ - ボートショップを開く",

        Owner = "",
        CompanyName = "Real ボートショップ",
        CompanyDescriptionText = "レジャー用からビジネス用まで、さまざまなボートを取り扱っています。海での一日をより快適に過ごせる1隻をご提案します。",
        CompanyMoney = 10000,
        Rating = 0,
        Vehicles = {},
        Categories = {},
        Feedbacks = {},
        Complaints = {},
        Preorders = {},
        Employees = {},
        SoldVehicles = {},
        Transactions = {},
        Perms = {},
        Discount = 0, 

        BlipSettings = {
            Enable = true,
            Sprite = 410,
            Scale = 0.8,
            Color = 2
        },
        SpawnCoords = vector4(-727.55, -1367.86, 0.52, 136.62),
        ShopOpenCoords = vector3(-718.53, -1326.79, 1.6),
        BossmenuCoords = vector3(-696.65, -1320.73, 5.1),
        CamSettings = {
            VehiclePos = vector4(-706.67, -1338.55, -0.1, 353.3),
            PlayerPos = vector3(-710.27, -1336.03, 1.46),
            Coords = vector3(-710.27, -1336.03, 1.46),
        },
        TestDriveLocation = vector4(-727.55, -1367.86, 0.52, 136.62),
        ComplaintForm = vector3(1, 1, 1),
    },
    {
        Manageable = false, 
        Type = 'aircraft',
        Jobs = {'all'},
        Price = 150000,
        Marker = "~INPUT_PICKUP~ - 航空機ショップを開く",

        Owner = "",
        CompanyName = "Real エアクラフト",
        CompanyDescriptionText = "ヘリコプターや小型機など、空の移動手段をご提供します。ビジネスからプライベートまで、用途に合わせた機体をお選びいただけます。",
        CompanyMoney = 10000,
        Rating = 0,
        Vehicles = {},
        Categories = {},
        Feedbacks = {},
        Complaints = {},
        Preorders = {},
        Employees = {},
        SoldVehicles = {},
        Transactions = {},
        Perms = {},
        Discount = 0,

        BlipSettings = {
            Enable = true,
            Sprite = 64,
            Scale = 0.8,
            Color = 3
        },
        SpawnCoords = vector4(-763.14, -1452.73, 5.0, 53.69),
        ShopOpenCoords = vector3(-753.48, -1512.23, 5.02),
        BossmenuCoords = vector3(-759.47, -1515.31, 4.98),
        CamSettings = {
            VehiclePos = vector4(-734.18, -1457.19, 5.66, 47.75), 
            PlayerPos = vector3(-739.79, -1435.5, 5.0),
            Coords = vector3(-739.79, -1435.5, 5.0),
        },
        TestDriveLocation = vector4(-734.18, -1457.19, 5.66, 47.75),
        ComplaintForm = vector3(1, 1, 1),
    }
}
