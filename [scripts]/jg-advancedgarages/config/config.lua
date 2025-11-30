-----------------------------------------------------------------------------------
-- 待ってください! このファイルを手動で編集する前に、新しい簡単設定ツールをお試しください! --
--            https://configurator.jgscripts.com/advanced-garages                --
-----------------------------------------------------------------------------------
Config = {}

-- ローカライゼーション
Config.Locale = "ja"
Config.NumberAndDateFormat = "en-US"
Config.Currency = "USD"

-- フレームワーク & 統合
Config.Framework = "auto" -- または "QBCore", "Qbox", "ESX"
Config.FuelSystem = "lc_fuel" -- または "lc_fuel", "ps-fuel", "lj-fuel", "ox_fuel", "cdn-fuel", "hyon_gas_station", "okokGasStation", "nd_fuel", "myFuel", "ti_fuel", "Renewed-Fuel", "rcore_fuel", "none"
Config.VehicleKeys = "qb-vehiclekeys" -- または "qb-vehiclekeys", "MrNewbVehicleKeys", "jaksam-vehicles-keys", "qs-vehiclekeys", "mk_vehiclekeys", "wasabi_carlock", "cd_garage", "okokGarage", "t1ger_keys", "Renewed", "tgiann-hotwire" "none"
Config.Notifications = "auto" -- または "default", "okokNotify", "ox_lib", "ps-ui"
Config.Banking = "Renewed-Banking" -- または "qb-banking", "qb-management", "esx_addonaccount", "Renewed-Banking", "okokBanking", "fd_banking"
Config.Gangs = "auto" -- "qb-gangs", "rcore_gangs"

-- テキストUI プロンプトの描画 (キーバインディング制御IDはこちら: https://docs.fivem.net/docs/game-references/controls/)
Config.DrawText = "auto" -- または "jg-textui", "qb-DrawText", "okokTextUI", "ox_lib", "ps-ui"
Config.OpenGarageKeyBind = 38
Config.OpenGaragePrompt = "[E] ガレージを開く"
Config.OpenImpoundKeyBind = 38
Config.OpenImpoundPrompt = "[E] 没収所を開く"
Config.InsertVehicleKeyBind = 38
Config.InsertVehiclePrompt = "[E] 車両を保管"
Config.ExitInteriorKeyBind = 38
Config.ExitInteriorPrompt = "[E] ガレージを出る"

-- ターゲット
Config.UseTarget = false
Config.Target = "ox_target" -- または "qb-target"
Config.TargetPed = "s_m_y_valet_01"

-- ラジアルメニュー
Config.UseRadialMenu = false
Config.RadialMenu = "ox_lib"


-- ガレージUIの小さな車両プレビュー画像 - 詳細を確認/カスタム画像を追加: https://docs.jgscripts.com/advanced-garages/vehicle-images
Config.ShowVehicleImages = true

-- 車両スポーン & 保管
Config.DoNotSpawnInsideVehicle = false
Config.SaveVehicleDamage = true -- ガレージから車を取り出すときに車体とエンジンのダメージを保存して適用
Config.AdvancedVehicleDamage = true -- Kiminaze's VehicleDeformationを使用
Config.SaveVehiclePropsOnInsert = true
Config.CheckVehicleModel = true -- 追加セキュリティ

-- これが何を意味するかわからない場合は、これに触れないでください
-- これが何を意味するかご存知でしたら、有効にすることをお勧めしますが、より多くのプレイヤーがいるサーバーで信頼性の問題が発生する可能性があることにご注意ください
-- 重大な問題が発生していますか? チケットを開く前に、これをfalseに戻すことを強く求めます
-- このオプションを有効にすることを決定した場合は、Config.DoNotSpawnInsideVehicle = false を強く推奨します
-- サーバースポーンされた車両についての私の不満を読みたいですか? https://docs.jgscripts.com/advanced-garages/misc/why-are-you-not-using-createvehicleserversetter-by-default
Config.SpawnVehiclesWithServerSetter = false

-- 車両の転送
Config.GarageVehicleTransferCost = 10000 -- ガレージ間転送コスト
Config.TransferHidePlayerNames = false
Config.EnableTransfers = {
  betweenGarages = true,
  betweenPlayers = true
}
Config.DisableTransfersToUnregisteredGarages = false -- 警戒心の強いサーバーの潜在的なハッキング対策 - 登録されていないガレージは、住宅スクリプトなどのサードパーティスクリプト統合でイベント経由で作成されたものであり、スクリプトキディー攻撃の対象になる可能性があります。

-- 車両の複製を防止
-- 詳細を確認: https://docs.jgscripts.com/advanced-garages/vehicle-duplication-prevention
Config.AllowInfiniteVehicleSpawns = false -- 公開 & プライベートガレージ
Config.JobGaragesAllowInfiniteVehicleSpawns = false -- ジョブガレージ
Config.GangGaragesAllowInfiniteVehicleSpawns = false -- ギャングガレージ
Config.GarageVehicleReturnCost = 100000 -- サーバー再起動後にガレージに戻されない場合、または破壊された、または水中に放置された場合の「牽引」税
Config.GarageVehicleReturnCostSocietyFund = false -- 返却手数料を支払うソサエティファンドのジョブ名 (オプション)

-- 公開ガレージ
Config.GarageShowBlips = true
Config.GarageUniqueBlips = false
Config.GarageUniqueLocations = true
Config.GarageEnableInteriors = true
Config.GarageLocations = { -- 重要 - すべてのガレージ名は一意である必要があります
  ["Legion Square"] = { -- このガレージの名前をLegion Squareから変更した場合は、SQLテーブル `players_vehicles` のデフォルト値 `garage_id` を同じ名前に変更する必要があります
    coords = vector3(215.09, -805.17, 30.81),
    spawn = {vector4(216.84, -802.02, 30.78, 69.82), vector4(218.09, -799.42, 30.76, 66.17), vector4(219.29, -797.23, 30.75, 65.4), vector4(219.59, -794.44, 30.75, 69.35), vector4(220.63, -792.03, 30.75, 63.76), vector4(206.81, -798.35, 30.99, 248.53)}, -- 複数のスポーン位置をテーブルに追加できます
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["ディーラーガレージ"] = {
    coords = vector3(-53, -1116.9, 26.0206),
    spawn = vector4(-53, -1116.9, 26.0206, 2.87227),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["LS Customガレージ"] = {
    coords = vector3(-386.28, -131.43, 38.09),
    spawn = vector4(-386.28, -131.43, 38.09, 298.18), vector4(-384.43, -134.35, 38.09, 298.06), vector4(-382.6, -137.58, 38.09, 298.77), vector4(-380.95, -140.55, 38.09, 299.95), vector4(-379.33, -143.68, 38.09, 298.83), vector4(-377.59, -146.84, 38.09, 298.1), vector4(-387.81, -128.36, 38.08, 298.67), vector4(-389.36, -125.09, 38.09, 298.16), vector4(-391.07, -122.07, 38.07, 297.61), vector4(-392.71, -118.99, 37.99, 298.44), vector4(-359.02, -123.81, 38.1, 70.15), vector4(-359.94, -127.26, 38.1, 68.84), vector4(-357.57, -120.56, 38.1, 70.14),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Islington South"] = {
    coords = vector3(273.0, -343.85, 44.91),
    spawn = vector4(270.75, -340.51, 44.92, 342.03),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grove Street"] = {
    coords = vector3(14.66, -1728.52, 29.3),
    spawn = vector4(23.93, -1722.9, 29.3, 310.58),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Mirror Park"] = {
    coords = vector3(1032.84, -765.1, 58.18),
    spawn = vector4(1023.2, -764.27, 57.96, 319.66),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Beach"] = {
    coords = vector3(-1248.69, -1425.71, 4.32),
    spawn = vector4(-1244.27, -1422.08, 4.32, 37.12),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Great Ocean Highway"] = {
    coords = vector3(-2961.58, 375.93, 15.02),
    spawn = vector4(-2964.96, 372.07, 14.78, 86.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy South"] = {
    coords = vector3(217.33, 2605.65, 46.04),
    spawn = vector4(216.94, 2608.44, 46.33, 14.07),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Sandy North"] = {
    coords = vector3(1878.44, 3760.1, 32.94),
    spawn = vector4(1880.14, 3757.73, 32.93, 215.54),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["North Vinewood Blvd"] = {
    coords = vector3(365.21, 295.65, 103.46),
    spawn = vector4(364.84, 289.73, 103.42, 164.23),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Grapeseed"] = {
    coords = vector3(1713.06, 4745.32, 41.96),
    spawn = vector4(1710.64, 4746.94, 41.95, 90.11),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Paleto Bay"] = {
    coords = vector3(107.32, 6611.77, 31.98),
    spawn = vector4(110.84, 6607.82, 31.86, 265.28),
    distance = 15,
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Boats"] = {
    coords = vector3(-795.15, -1510.79, 1.6),
    spawn = vector4(-798.66, -1507.73, -0.47, 102.23),
    distance = 20,
    type = "sea",
    hideBlip = false,
    blip = {
      id = 356,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Hangar"] = {
    coords = vector3(-1243.49, -3391.88, 13.94),
    spawn = vector4(-1258.4, -3394.56, 13.94, 328.23),
    distance = 20,
    type = "air",
    hideBlip = false,
    blip = {
      id = 359,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- プライベートガレージ
Config.PrivGarageCreateCommand = "privategarages"
Config.PrivGarageCreateJobRestriction = {"realestate"}
Config.PrivGarageEnableInteriors = true
Config.PrivGarageHideBlips = false
Config.PrivGarageBlip = {
  id = 357,
  color = 0,
  scale = 0.7
}

-- ジョブガレージ
Config.JobGarageShowBlips = true
Config.JobGarageSetVehicleCommand = "setjobvehicle" -- 管理者のみ
Config.JobGarageRemoveVehicleCommand = "removejobvehicle" -- 管理者のみ
Config.JobGarageUniqueBlips = false
Config.JobGarageUniqueLocations = true
Config.JobGarageEnableInteriors = true
Config.JobGarageLocations = { -- 重要 - すべてのガレージ名は一意である必要があります
  ["Mechanic"] = {
    coords = vector3(-356.89, -160.03, 38.82),
    spawn = vector4(-356.89, -160.03, 38.82, 30.3),
    distance = 15,
    job = {"mechanic"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", -- このソサエティの誰でもアクセスできる所有車両を使用 - 詳細: https://docs.jgscripts.com/advanced-garages/job-and-gang-garages
  },
  ["Police"] = {
    coords = vector3(434.48, -1016.97, 28.83),
    spawn = vector4(434.55, -1014.54, 28.49, 91.56),
    distance = 15,
    job = {"police"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "owned", -- リストから基本的な車両をスポーン
  }
}

-- ギャングガレージ (デフォルトではQBCore/Qboxのみ)
Config.GangEnableCustomESXIntegration = false -- cl/sv-functions.luaにカスタムシステムを追加した場合はtrueに設定
Config.GangGarageShowBlips = true
Config.GangGarageSetVehicleCommand = "setgangvehicle" -- 管理者のみ
Config.GangGarageRemoveVehicleCommand = "removegangvehicle" -- 管理者のみ
Config.GangGarageUniqueBlips = false
Config.GangGarageUniqueLocations = true
Config.GangGarageEnableInteriors = true
Config.GangGarageLocations = { -- 重要 - すべてのガレージ名は一意である必要があります
  ["The Lost MC"] = {
    coords = vector3(439.18, -1518.48, 29.28),
    spawn = vector4(439.18, -1518.48, 29.28, 139.06),
    distance = 15,
    gang = {"lostmc"},
    type = "car",
    hideBlip = false,
    blip = {
      id = 357,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
    vehiclesType = "personal", -- 個人車両を使用
  }
}

-- 没収所
Config.ImpoundCommand = "iv"
Config.ImpoundFeesSocietyFund = "police" -- 没収手数料を支払うソサエティファンドのジョブ名 (オプション)
Config.ImpoundShowBlips = true
Config.ImpoundUniqueBlips = false
Config.ImpoundTimeOptions = {0, 1, 4, 12, 24, 72, 168} -- 時間単位
Config.ImpoundLocations = { -- 重要 - すべての没収所名は一意である必要があります
  ["Impound A"] = {
    coords = vector3(410.8, -1626.26, 29.29),
    spawn = vector4(408.44, -1630.88, 29.29, 136.88),
    distance = 15,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  },
  ["Impound B"] = {
    coords = vector3(1649.71, 3789.61, 34.79),
    spawn = vector4(1643.66, 3798.36, 34.49, 216.16),
    distance = 15,
    type = "car",
    job = {"police"},
    hideBlip = false,
    blip = {
      id = 68,
      color = 0,
      scale = 0.7
    },
    hideMarkers = true,
    markers = { id = 21, size = { x = 0.3, y = 0.3, z = 0.3 }, color = { r = 255, g = 255, b = 255, a = 120 }, bobUpAndDown = 0, faceCamera = 0, rotate = 1, drawOnEnts = 0 },
  }
}

-- ガレージ内部
Config.GarageInteriorEntrance = vector4(227.96, -1003.06, -99.0, 0.0)
Config.GarageInteriorCameraCutscene = {
  vector4(227.96, -977.81, -98.99, 0.0), -- から
  vector4(227.96, -1006.96, -98.99, 0.0), -- へ (これは入口、または入口座標からわずかに奥にあることをお勧めします)
}
Config.GarageInteriorVehiclePositions = {
  vector4(233.000000, -984.000000, -99.410004, 118.000000),
  vector4(233.000000, -988.500000, -99.410004, 118.000000),
  vector4(233.000000, -993.000000, -99.410004, 118.000000),
  vector4(233.000000, -997.500000, -99.410004, 118.000000),
  vector4(233.000000, -1002.000000, -99.410004, 118.000000),
  vector4(223.600006, -979.000000, -99.410004, 235.199997),
  vector4(223.600006, -983.599976, -99.410004, 235.199997),
  vector4(223.600006, -988.200012, -99.410004, 235.199997),
  vector4(223.600006, -992.799988, -99.410004, 235.199997),
  vector4(223.600006, -997.400024, -99.410004, 235.199997),
  vector4(223.600006, -1002.000000, -99.410004, 235.199997),
}

-- スタッフコマンド
Config.ChangeVehiclePlate = "vplate" -- 管理者のみ
Config.DeleteVehicleFromDB = "dvdb" -- 管理者のみ
Config.ReturnVehicleToGarage = "vreturn" -- 管理者のみ

-- インポートされた車両のスポーン名と希望するラベルをここに追加して、ガレージの車両名を見やすくしてください
-- これは主にESX向けに設計されています - QBを使用している場合は、shared内でこれを行ってください!
Config.VehicleLabels = {
  ["spawnName"] = "見栄えの良い車両ラベル"
}

-- 特定の車両を他のプレイヤーへの転送をブロック
Config.PlayerTransferBlacklist = {
  "spawnName"
}

Config.AutoRunSQL = true
Config.ReturnToPreviousRoutingBucket = false
Config.HideWatermark = false
Config.__v3Config = true
Config.Debug = false