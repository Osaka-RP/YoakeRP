return {

    -- 雨/雷の自動スケジュールはオフ
    useScheduledWeather = false,

    serverDuration = 14,          -- そのままでOK
    weatherCycletimer = 30,       -- 使われないけど放置でOK

    timeBetweenRain = 180,
    rainAfterRestart = 60,

    -- 12月でも雪を強制しない
    decemberSnow = false,

    -- これで確率ベースの固定
    useStaticWeather = true,
    staticWeather = {
        ['BLIZZARD']   = 0.0,
        ['CLEAR']      = 0.0,
        ['CLEARING']   = 0.0,
        ['CLOUDS']     = 0.0,
        ['EXTRASUNNY'] = 1.0, -- 100% EXTRASUNNY
        ['FOGGY']      = 0.0,
        ['NEUTRAL']    = 0.0,
        ['OVERCAST']   = 0.0,
        ['RAIN']       = 0.0,
        ['SMOG']       = 0.0,
        ['SNOW']       = 0.0,
        ['SNOWLIGHT']  = 0.0,
        ['THUNDER']    = 0.0,
        ['XMAS']       = 0.0
    },

    -- シーケンス（天気遷移のイベント）は完全に無効化
    useWeatherSequences = false,

    -- 中身は無視されるけど残してOK
    weatherSequences = {}
}
