local Translations = {
    error = {
        already_driving_bus = 'あなたはすでにバスを運転しています',
        not_in_bus = 'あなたはバスに乗っていません',
        one_bus_active = '同時にアクティブにできるバスは1台のみです',
        drop_off_passengers = '仕事を終える前に乗客を降ろしてください',
        exploit = "不正行為の試みが検出されました"
    },
    success = {
        dropped_off = '乗客を降ろしました',
    },
    info = {
        bus = '標準バス',
        goto_busstop = 'バス停へ向かってください',
        busstop_text = '[E] バス停',
        bus_plate = 'BUS', -- 3〜4文字の英字（後ろにランダムな4桁の数字が付きます）
        bus_depot = 'バス車庫',
        bus_stop_work = '[E] 仕事を終了する',
        bus_job_vehicles = '[E] 仕事用車両'
    },
    menu = {
        bus_header = 'バス車両',
        bus_close = '⬅ メニューを閉じる'
    }
}

if GetConvar('qb_locale', 'en') == 'ja' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end