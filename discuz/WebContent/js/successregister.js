//获取上一个页面传来的数据
var myhref = window.location.href;
//解码
myhref = decodeURI(myhref);
//拆解URL
var nickname = myhref.split("=")[1];
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
            window.open("../loginsuccess.jsp?mynickname=" + document.getElementById("nickname").value, "_self");
        }

    }

    document.getElementById("nickname").innerHTML = "欢迎" + nickname + "注册";
    document.getElementById("nickname").value = nickname;
};
