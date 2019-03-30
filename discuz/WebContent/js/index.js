//检查用户名的正则表达式
var reg = /^[a-z0-9_-]{3,16}$/;
window.onload = function () {
    //提交时检查登录
    document.getElementById("loginsubmit").onclick = function () {
        var loginusername = document.getElementById("loginusername").value;
        var loginpassword = document.getElementById("loginpassword").value
        var code = document.getElementById("code").value;
        if (loginusername == "" || loginpassword == "" || code == "") {
            document.getElementById("checkusername").innerHTML = "用户名不能为空";
            document.getElementById("checkusername").style.backgroundColor = "red";
            document.getElementById("checkpassword").innerHTML = "密码不能为空";
            document.getElementById("checkpassword").style.backgroundColor = "red";
            document.getElementById("checkcode").innerHTML = "验证码不能为空";
            document.getElementById("checkcode").style.backgroundColor = "red";
            return false;
        }
    };
    //输入时检查用户名
    document.getElementById("loginusername").onfocus = function () {
        var loginusername = document.getElementById("loginusername").value;
        if (loginusername == "") {
            document.getElementById("checkusername").innerHTML = "请输入用户名";
            document.getElementById("checkusername").style.backgroundColor = "red";
        }
    };
    document.getElementById("loginusername").onblur = function () {
        var loginusername = document.getElementById("loginusername").value;
        if (loginusername == "") {
            document.getElementById("checkusername").innerHTML = "用户名不能为空";
            document.getElementById("checkusername").style.backgroundColor = "red";
        } else {
            document.getElementById("checkusername").innerHTML = "ok";
            document.getElementById("checkusername").style.backgroundColor = "green";
        }
    };
    //输入时检查密码
    document.getElementById("loginpassword").onfocus = function () {
        var loginpassword = document.getElementById("loginpassword").value;
        if (loginpassword == "") {
            document.getElementById("checkpassword").innerHTML = "请输入密码";
            document.getElementById("checkpassword").style.backgroundColor = "red";
        }
    };
    document.getElementById("loginpassword").onblur = function () {
        var loginpassword = document.getElementById("loginpassword").value;
        if (loginpassword == "") {
            document.getElementById("checkpassword").innerHTML = "密码不能为空";
            document.getElementById("checkpassword").style.backgroundColor = "red";
        } else {
            document.getElementById("checkpassword").innerHTML = "ok";
            document.getElementById("checkpassword").style.backgroundColor = "green";
        }
    };
    /*=======================检测注册======================*/
    //提交时检查注册
    document.getElementById("submit").onclick = function () {
        var username = document.getElementById("username").value;
        var password = document.getElementById("password").value
        if (username == "" || password == "") {
            document.getElementById("checkreguser").innerHTML = "用户名不能为空";
            document.getElementById("checkreguser").style.backgroundColor = "red";
            document.getElementById("checkregpass").innerHTML = "密码不能为空";
            document.getElementById("checkregpass").style.backgroundColor = "red";
            return false;
        }
    };
    //输入时检查用户名
    document.getElementById("username").onfocus = function () {
        var username = document.getElementById("username").value;
        if (username == "") {
            document.getElementById("checkreguser").innerHTML = "请输入用户名";
            document.getElementById("checkreguser").style.backgroundColor = "red";
        }
    };
    document.getElementById("username").onblur = function () {
        var username = document.getElementById("username").value;
        if (username == "") {
            document.getElementById("checkreguser").innerHTML = "用户名不能为空";
            document.getElementById("checkreguser").style.backgroundColor = "red";
        } else {
            document.getElementById("checkreguser").innerHTML = "ok";
            document.getElementById("checkreguser").style.backgroundColor = "green";
        }
    };
    //输入时检查密码
    document.getElementById("password").onfocus = function () {
        var password = document.getElementById("password").value;
        if (password == "") {
            document.getElementById("checkregpass").innerHTML = "请输入密码";
            document.getElementById("checkregpass").style.backgroundColor = "red";
        }
    };
    document.getElementById("password").onblur = function () {
        var password = document.getElementById("password").value;
        if (password == "") {
            document.getElementById("checkregpass").innerHTML = "密码不能为空";
            document.getElementById("checkregpass").style.backgroundColor = "red";
        } else {
            document.getElementById("checkregpass").innerHTML = "ok";
            document.getElementById("checkregpass").style.backgroundColor = "green";
        }
    };
    /*=======================登录验证码======================*/
    document.getElementById("changeImg").onclick = function () {
        document.getElementById("imgId").src = "ProduceCodeServlet?=" + new Date().getTime();
    };
    document.getElementById("changeImgViaWord").onclick = function () {
        document.getElementById("imgId").src = "ProduceCodeServlet?=" + new Date().getTime();
    };

    //验证码有误时，点击再次输入去掉验证码有误四个字
    document.getElementById("code").onfocus = function () {
        document.getElementById("msg").innerHTML = "";
    };

    /*=======================注册验证码======================*/
    document.getElementById("regImgId").onclick = function () {
        document.getElementById("regImgId").src = "ProduceCodeServlet?=" + new Date().getTime();
    };
    document.getElementById("changeregcode").onclick = function () {
        document.getElementById("regImgId").src = "ProduceCodeServlet?=" + new Date().getTime();
    };
    document.getElementById("button").onclick = function () {
        document.getElementById("regImgId").src = "ProduceCodeServlet?=" + new Date().getTime();
    };
};