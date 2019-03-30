window.onload = function () {
    var time_no = window.setInterval(countdown, 1000);
    var index = 4;
    function countdown() {
        var span_obj = document.getElementById("myspan");
        var timeshow = document.getElementById("myspan").innerHTML;
        timeshow -= 1;
        span_obj.innerHTML = timeshow;

        if (timeshow == 0) {
            window.clearInterval(time_no);
            window.open("../index.jsp", "_self");
        }
    }
    document.getElementById("nickname").innerHTML = "退出成功";
};
