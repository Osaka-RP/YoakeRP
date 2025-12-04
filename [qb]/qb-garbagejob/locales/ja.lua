local Translations = {
    error = {
        ["cancled"] = "キャンセルされました",
        ["no_truck"] = "トラックがありません！",
        ["not_enough"] = "お金が足りません（%{value} 必要）",
        ["too_far"] = "ドロップオフ地点から遠すぎます",
        ["early_finish"] = "早く仕事を終えたため（完了: %{completed} / 合計: %{total}）、デポジットは返金されません。",
        ["never_clocked_on"] = "作業を開始していません！",
        ["all_occupied"] = "すべての駐車スペースが埋まっています",
        ["job"] = "ジョブセンターで仕事を取得する必要があります",
    },
    success = {
        ["clear_routes"] = "保存されていたルートをクリアしました（%{value} ルート）",
        ["pay_slip"] = "あなたは $%{total} を受け取りました。給料 %{deposit} は銀行口座に振り込まれました！",
    },
    target = {
        ["talk"] = '清掃員と話す',
        ["grab_garbage"] = "ゴミ袋を拾う",
        ["dispose_garbage"] = "ゴミ袋を捨てる",
    },
    menu = {
        ["header"] = "ゴミ収集メニュー",
        ["collect"] = "給料を受け取る",
        ["return_collect"] = "トラックを返却して給料を受け取る",
        ["route"] = "ルートをリクエスト",
        ["request_route"] = "ゴミ収集ルートをリクエスト",
    },
    info = {
        ["payslip_collect"] = "[E] - 給料明細を受け取る",
        ["payslip"] = "給料明細",
        ["not_enough"] = "デポジットを払うお金が足りません.. 必要な金額: $%{value}",
        ["deposit_paid"] = "デポジットとして $%{value} を支払いました！",
        ["no_deposit"] = "この車両にはデポジットを支払っていません..",
        ["truck_returned"] = "トラックを返却しました。給料明細を受け取って、給料とデポジットを受け取りましょう！",
        ["bags_left"] = "残りのゴミ袋: %{value}",
        ["bags_still"] = "まだ %{value} 個のゴミ袋が残っています！",
        ["all_bags"] = "すべてのゴミ袋を回収しました。次の地点へ進んでください！",
        ["depot_issue"] = "デポに問題が発生しました。すぐに戻ってください！",
        ["done_working"] = "作業が完了しました！デポに戻ってください。",
        ["started"] = "作業を開始しました！GPSに位置がマークされました。",
        ["grab_garbage"] = "[E] ゴミ袋を拾う",
        ["stand_grab_garbage"] = "ここに立ってゴミ袋を拾う。",
        ["dispose_garbage"] = "[E] ゴミ袋を捨てる",
        ["progressbar"] = "ゴミ袋をトラッシュマスターに入れています..",
        ["garbage_in_truck"] = "ゴミ袋をトラックに入れる..",
        ["stand_here"] = "ここに立ってください..",
        ["found_crypto"] = "床に暗号スティックを見つけました！",
        ["payout_deposit"] = "(+ $%{value} デポジット)",
        ["store_truck"] =  "[E] - ゴミ収集車を保管",
        ["get_truck"] =  "[E] - ゴミ収集車を取得",
        ["picking_bag"] = "ゴミ袋を拾っています..",
        ["talk"] = "[E] 清掃員と話す",
    },
}

if GetConvar('qb_locale', 'en') == 'ja' then
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end