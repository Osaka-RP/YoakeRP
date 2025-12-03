let meterStarted = false;

const updateMeter = (meterData) => {
    $("#total-price").html("$ " + meterData.currentFare.toFixed(2));
    $("#total-distance").html(meterData.distanceTraveled.toFixed(1) + " km");  // km表示に変更
};

const resetMeter = () => {
    $("#total-price").html("$ 0.00");
    $("#total-distance").html("0.0 km");
};

const toggleMeter = (enabled) => {
    if (enabled) {
        $(".toggle-meter-btn").html("<p>稼働中</p>");
        $(".toggle-meter-btn p").css({ color: "#33a025" });  // 緑
    } else {
        $(".toggle-meter-btn").html("<p>停止中</p>");
        $(".toggle-meter-btn p").css({ color: "#e71e25" });  // 赤
    }
};

const meterToggle = () => {
    if (!meterStarted) {
        $.post("https://qb-taxijob/enableMeter", JSON.stringify({ enabled: true }));
        toggleMeter(true);
        meterStarted = true;
    } else {
        $.post("https://qb-taxijob/enableMeter", JSON.stringify({ enabled: false }));
        toggleMeter(false);
        meterStarted = false;
    }
};

const openMeter = (meterData) => {
    $(".container").fadeIn(150);
    $("#total-price-per-100m").html("$ " + meterData.defaultPrice.toFixed(2));
};

const closeMeter = () => {
    $(".container").fadeOut(150);
    resetMeter();
    meterStarted = false;
    toggleMeter(false);
};

$(document).ready(function () {
    window.addEventListener("message", (event) => {
        const data = event.data;
        switch (data.action) {
            case "openMeter":
                data.toggle ? openMeter(data.meterData) : closeMeter();
                break;
            case "toggleMeter":
                meterToggle();
                break;
            case "updateMeter":
                updateMeter(data.meterData);
                break;
            case "resetMeter":
                resetMeter();
                break;
            case "closeMeter":
                closeMeter();
                break;
        }
    });

    // ESCキーでメーター閉じる（便利）
    $(document).on('keyup', function(e) {
        if (e.key === "Escape") {
            closeMeter();
        }
    });
});