return {
    timeScale = 1250, -- GTA時間では1分あたり何ミリ秒ですか（48分間1日を想定すると通常2000ミリ秒）

    useNightScale = false, -- If true, サーバーは夜間時間帯において時間変更を行うためにtimeScaleNightを使用する
    timeScaleNight = 8000, -- GTAの時間帯において、夜間中の1分あたりのミリ秒数はいくつですか？

    nightTime = {
        beginning = 22,
        ending = 6
    },

    useRealTime = false, -- If true, サーバーは他のすべての設定を上書きし、サーバーの実際の時刻を使用します。
    startUpTime = {
        hour = 12,
        minute = 0
    }
}

