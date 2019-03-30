
window.onload = function () {
    //提交时检查登录
    document.getElementById("formId").onsubmit = function () {
        var prepwd = document.getElementById("prepwd").value;
        var newpwd = document.getElementById("newpwd").value;
        var renewpwd = document.getElementById("renewpwd").value;

        if (prepwd == "") {
            document.getElementById("checkprepwd").innerHTML = "旧密码不能为空";
            document.getElementById("checkprepwd").style.backgroundColor = "red";
            return false;
        }
        if(newpwd == "") {
            document.getElementById("checknewpwd").innerHTML = "新密码不能为空";
            document.getElementById("checknewpwd").style.backgroundColor = "red";
            return false;
        }
        if(renewpwd == ""){
            document.getElementById("checkrenewpwd").innerHTML = "确认密码不能为空";
            document.getElementById("checkrenewpwd").style.backgroundColor = "red";
            return false;
        }
        //检查新旧密码是否一致
        if(newpwd == prepwd){
            document.getElementById("checksame").innerHTML = "原密码和新密码一致，请修改";
            document.getElementById("checksame").style.backgroundColor = "red";
            return false;
        }
        //检查两次输入的密码是否一致
        if(newpwd != renewpwd){
            document.getElementById("checkrenewpwd").innerHTML = "新密码和确认密码不一致!";
            document.getElementById("checkrenewpwd").style.backgroundColor = "red";
            return false;
        }
    };
    //输入时检查原密码
    document.getElementById("prepwd").onfocus = function () {
        var prepwd = document.getElementById("prepwd").value;
        if (prepwd == "") {
            document.getElementById("checkprepwd").innerHTML = "请输入原密码";
            document.getElementById("checkprepwd").style.backgroundColor = "red";
        }
    };
    document.getElementById("prepwd").onblur = function () {
        var prepwd = document.getElementById("prepwd").value;
        if (prepwd == "") {
            document.getElementById("checkprepwd").innerHTML = "原密码不能为空";
            document.getElementById("checkprepwd").style.backgroundColor = "red";
        } else {
            document.getElementById("checkprepwd").innerHTML = "ok";
            document.getElementById("checkprepwd").style.backgroundColor = "green";
        }
    };
    //输入时检查新密码
    document.getElementById("newpwd").onfocus = function () {
        var newpwd = document.getElementById("newpwd").value;
        if (newpwd == "") {
            document.getElementById("checknewpwd").innerHTML = "请输入新密码";
            document.getElementById("checknewpwd").style.backgroundColor = "red";
        }
    };
    document.getElementById("newpwd").onblur = function () {
        var newpwd = document.getElementById("newpwd").value;
        if (newpwd == "") {
            document.getElementById("checknewpwd").innerHTML = "新密码不能为空";
            document.getElementById("checknewpwd").style.backgroundColor = "red";
        } else {
            document.getElementById("checknewpwd").innerHTML = "ok";
            document.getElementById("checknewpwd").style.backgroundColor = "green";
        }
    };
    //输入时检查确认密码
    document.getElementById("renewpwd").onfocus = function () {
        var renewpwd = document.getElementById("renewpwd").value;
        if (renewpwd == "") {
            document.getElementById("checkrenewpwd").innerHTML = "请输入确认密码";
            document.getElementById("checkrenewpwd").style.backgroundColor = "red";
        }
    };
    document.getElementById("renewpwd").onblur = function () {
        var renewpwd = document.getElementById("renewpwd").value;
        if (renewpwd == "") {
            document.getElementById("checkrenewpwd").innerHTML = "确认密码不能为空";
            document.getElementById("checkrenewpwd").style.backgroundColor = "red";
        } else {
            document.getElementById("checkrenewpwd").innerHTML = "ok";
            document.getElementById("checkrenewpwd").style.backgroundColor = "green";
        }
    };
    //当原密码和新密码一致时提示的错误，点击原密码输入框时该提示消失
    document.getElementById("prepwd").onfocus = function () {
        document.getElementById("checksame").innerHTML="";
    };
};