Config = {}

Config.isAllowed = function(source)
    if IsPlayerAceAllowed(source, 'admin') or IsPlayerAceAllowed(source, 'command') then
        return true
    end
    return false
end

Config.Precision = 10000.0

Config.Values = {
    -- トランスミッション（最上位に移動）
    fDriveBiasFront = {
        name = "駆動方式",
        type = "float",
        change = 0.05,
        min = 0.0,
        max = 1.0,
        description = "駆動方式：0.0 = 後輪駆動(RWD)、1.0 = 前輪駆動(FWD)、0.5 = 均等4WD"
    },
    nInitialDriveGears = { name = "ギア段数", type = "int", change = 1, min = 1, max = 8, description = "前進ギアの段数" },
    fInitialDriveForce = { name = "エンジンパワー", type = "float", change = 0.1, min = 0.01, max = 2.0, description = "エンジン出力倍率。高くすると加速が強くなる" },
    fDriveInertia = { name = "エンジン回転立ち上がり", type = "float", change = 1, min = 0.01, max = 2.0, description = "エンジン回転の上昇速度。高くするとレッドラインまで速く回る" },
    fClutchChangeRateScaleUpShift = { name = "シフトアップ速度", type = "float", change = 0.5, min = 0.1, max = 10.0, description = "シフトアップの速さ。高くすると変速が速くなる" },
    fClutchChangeRateScaleDownShift = { name = "シフトダウン速度", type = "float", change = 0.5, min = 0.1, max = 10.0, description = "シフトダウンの速さ。高くすると変速が速くなる" },
    fInitialDriveMaxFlatVel = { name = "最高速度", type = "float", change = 5.0, min = 0.0, max = 500.0, description = "最高ギアでの最高速度（この値を0.82倍するとMPH）" },

    -- トラクション（2番目に移動）
    fTractionCurveMax = { name = "コーナリンググリップ", type = "float", change = 0.1, min = 0.1, max = 4.0, description = "コーナーでの最大グリップ倍率" },
    fTractionCurveMin = { name = "直線グリップ", type = "float", change = 0.1, min = 0.1, max = 4.0, description = "加速・減速時のグリップ倍率" },
    fTractionCurveLateral = { name = "横方向グリップ形状", type = "float", change = 1.0, min = 0.0, max = 30.0, description = "横滑りのしやすさ" },
    fTractionSpringDeltaMax = { name = "グリップロス高さ", type = "float", change = 0.01, min = 0.0, max = 0.3, description = "この高さ以上でグリップが落ちる" },
    fLowSpeedTractionLossMult = { name = "低速バーンナウト", type = "float", change = 0.1, min = 0.0, max = 2.0, description = "低速時のグリップロス。高くするとタイヤが空転しやすくなる" },
    fCamberStiffnesss = { name = "ドリフト制御", type = "float", change = 0.01, min = -1.0, max = 1.0, description = "ドリフト角度維持。正＝維持しやすくなる、負＝オーバーステア" },
    fTractionBiasFront = { name = "前後グリップ配分", type = "float", change = 0.01, min = 0.01, max = 0.99, description = "0.01 = リア寄り、0.99 = フロント寄り、0.5 = 均等" },
    fTractionLossMult = { name = "全路面グリップロス", type = "float", change = 1.0, min = 0.0, max = 2.0, description = "全路面でのグリップ減少倍率" },

    -- ブレーキ（3番目に移動）
    fBrakeForce = { name = "ブレーキ強度", type = "float", change = 0.2, min = 0.01, max = 2.0, description = "ブレーキの効き倍率。高くすると止まりやすくなる" },
    fBrakeBiasFront = { name = "ブレーキバランス", type = "float", change = 0.1, min = 0.0, max = 1.0, description = "前後ブレーキ配分：0.0 = 後輪のみ、1.0 = 前輪のみ、0.5 = 均等" },
    fHandBrakeForce = { name = "サイドブレーキ強度", type = "float", change = 0.2, min = 0.0, max = 5.0, description = "サイドブレーキの効き。高くするとドリフトしやすくなる" },

    -- 以下は従来の順番（物理 → ステアリング → サスペンション → ダメージ → その他）
    fMass = { name = "車両重量", type = "float", change = 100.0, min = 100.0, max = 5000.0, description = "車両の重量（kg）。衝突物理に影響します。" },
    fInitialDragCoeff = { name = "空気抵抗係数", type = "float", change = 1, min = 10.0, max = 120.0, description = "空気抵抗の強さ。数値が高いほど空気抵抗が強くなります。" },
    fPercentSubmerged = { name = "水没判定パーセント", type = "float", change = 5.0, min = 0.0, max = 100.0, description = "この割合以上水に沈むと沈没します（デフォルト85%）" },
    vecCentreOfMassOffset = { name = "重心オフセット", type = "vector", change = 0.1, min = -2.0, max = 2.0, description = "車両の重心位置を原点からずらす値", components = { x = {name = "左右"}, y = {name = "前後"}, z = {name = "上下"} } },
    vecInertiaMultiplier = { name = "慣性倍率", type = "vector", change = 0.1, min = 0.0, max = 3.0, description = "各軸の回転慣性", components = { x = {name = "横転慣性"}, y = {name = "前後傾き慣性"}, z = {name = "回転慣性"} } },

    fSteeringLock = { name = "最大舵角", type = "float", change = 5.0, min = 10.0, max = 70.0, description = "ハンドルの切れ角。高くすると小回りが効く" },

    fSuspensionForce = { name = "サス硬さ", type = "float", change = 0.1, min = 0.0, max = 5.0, description = "サスペンションのバネ強度" },
    fSuspensionCompDamp = { name = "圧縮ダンピング", type = "float", change = 0.1, min = 0.0, max = 5.0, description = "サスが縮む時の抵抗" },
    fSuspensionReboundDamp = { name = "伸びダンピング", type = "float", change = 0.1, min = 0.0, max = 5.0, description = "サスが伸びる時の抵抗" },
    fSuspensionUpperLimit = { name = "サス上限", type = "float", change = 0.01, min = 0.0, max = 0.5, description = "サスペンションの最大伸び" },
    fSuspensionLowerLimit = { name = "サス下限", type = "float", change = 0.01, min = -0.5, max = 0.0, description = "サスペンションの最大縮み" },
    fSuspensionRaise = { name = "車高調整", type = "float", change = 0.01, min = -0.2, max = 0.2, description = "車高を上げる(+)/下げる(-)" },
    fSuspensionBiasFront = { name = "サス前後配分", type = "float", change = 0.01, min = 0.0, max = 1.0, description = "サスペンション強度の前後配分" },
    fAntiRollBarForce = { name = "スタビライザー強度", type = "float", change = 0.1, min = 0.0, max = 2.0, description = "ロール抑制力" },
    fAntiRollBarBiasFront = { name = "スタビ前後配分", type = "float", change = 0.01, min = 0.0, max = 1.0, description = "スタビライザーの前後配分" },
    fRollCentreHeightFront = { name = "フロントロールセンター高さ", type = "float", change = 0.01, min = 0.0, max = 1.0, description = "フロントのロール中心高さ" },
    fRollCentreHeightRear = { name = "リアロールセンター高さ", type = "float", change = 0.01, min = 0.0, max = 1.0, description = "リアのロール中心高さ" },

    fCollisionDamageMult = { name = "衝突ダメージ倍率", type = "float", change = 1.0, min = 0.0, max = 2.0, description = "衝突時のダメージ倍率" },
    fWeaponDamageMult = { name = "銃撃ダメージ倍率", type = "float", change = 1.0, min = 0.0, max = 2.0, description = "銃撃によるダメージ倍率" },
    fDeformationDamageMult = { name = "変形ダメージ倍率", type = "float", change = 1.0, min = 0.0, max = 2.0, description = "見た目の変形しやすさ" },
    fEngineDamageMult = { name = "エンジンダメージ倍率", type = "float", change = 1.0, min = 0.0, max = 2.0, description = "エンジンへのダメージ倍率" },

    fPetrolTankVolume = { name = "燃料タンク容量", type = "float", change = 1.0, min = 0.0, max = 100.0, description = "燃料タンクの容量" },
    fOilVolume = { name = "オイル容量", type = "float", change = 1.0, min = 0.0, max = 10.0, description = "エンジンオイルの容量" },
    nMonetaryValue = { name = "車両価格", type = "int", change = 1.0, min = 0, max = 1000000, description = "車両の金額" },
    strModelFlags = { name = "モデルフラグ", type = "string", description = "車両モデルフラグ" },
    strHandlingFlags = { name = "ハンドリングフラグ", type = "string", description = "ハンドリング関連フラグ" },
    strDamageFlags = { name = "ダメージフラグ", type = "string", description = "ダメージ関連フラグ" }
}
