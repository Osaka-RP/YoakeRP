local Translations = {
    error = {
        ['already_mission'] = 'すでにNPCミッション中です',
        ['not_in_taxi'] = 'タクシーに乗っていません',
        ['missing_meter'] = 'この車両にはタクシーメーターが付いていません',
        ['no_vehicle'] = '車両に乗っていません',
        ['not_active_meter'] = 'タクシーメーターが起動していません',
        ['ride_canceled'] = '衝突しすぎたため、お客様が降りてしまいました！',
        ['broken_taxi'] = 'タクシーが壊れているため、修理するまで仕事できません！',
        ['crash_warning'] = 'あと%d%s衝突するとお客様が降りてしまい、料金がもらえなくなります！',
        ['time'] = '回',
        ['times'] = '回',
    },
    success = {
        ['mission_cancelled'] = 'ミッションを正常にキャンセルしました',
    },
    info = {
        ['person_was_dropped_off'] = 'お客様を目的地に送り届けました！',
        ['npc_on_gps'] = 'お客様の位置をGPSに表示しました',
        ['go_to_location'] = 'お客様を指定の場所までお送りください',
        ['vehicle_parking'] = '[E] 車両を駐車',
        ['job_vehicles'] = '[E] 仕事用車両',
        ['drop_off_npc'] = '[E] お客様を降ろす',
        ['call_npc'] = '[E] お客様を呼ぶ',
        ['blip_name'] = 'ダウンタウンキャブ',
        ['taxi_label_1'] = 'スタンダードタクシー',
        ['no_spawn_point'] = 'タクシーを出す場所が見つかりません',
        ['taxi_returned'] = 'タクシーを駐車しました',
        ['on_duty'] = '[E] - 出勤する',
        ['off_duty'] = '[E] - 退勤する',
        ['tip_received'] = '安全運転ありがとう！チップで$%dもらいました',
        ['tip_not_received'] = '衝突が多かったので今回はチップなし…次は気をつけてね',
    },
    menu = {
        ['taxi_menu_header'] = 'タクシー車両選択',
        ['close_menu'] = '⬅ メニューを閉じる',
        ['boss_menu'] = 'ボスメニュー'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})