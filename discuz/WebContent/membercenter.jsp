<%--import="java.util.*"导入java.util下的内容，给当前jsp使用--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>个人中心</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <!--js-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
   <%-- <script src="js/membercenter.js"></script>--%>
    <script>
        window.onload = function () {
            //提交时检查登录
            document.getElementById("formId").onsubmit = function () {
                /*
               * 使用循环完成光标的自动聚焦
               * */
                var arrId = new Array("prepwd", "newpwd", "renewpwd");
                for (var i = 0; i < arrId.length; i++) {
                    if (document.getElementById(arrId[i]).value == "") {
                        document.getElementById(arrId[i]).focus();
                        break;
                    }
                }

                var prepwd = document.getElementById("prepwd").value;
                var newpwd = document.getElementById("newpwd").value;
                var renewpwd = document.getElementById("renewpwd").value;

                if (prepwd == "" || newpwd == ""|| renewpwd == "") {
                    document.getElementById("checkprepwd").innerHTML = "旧密码不能为空";
                    document.getElementById("checkprepwd").style.backgroundColor = "red";

                    document.getElementById("checknewpwd").innerHTML = "新密码不能为空";
                    document.getElementById("checknewpwd").style.backgroundColor = "red";

                    document.getElementById("checkrenewpwd").innerHTML = "确认密码不能为空";
                    document.getElementById("checkrenewpwd").style.backgroundColor = "red";
                    return false;
                }
               /* if(newpwd == "") {
                    document.getElementById("checknewpwd").innerHTML = "新密码不能为空";
                    document.getElementById("checknewpwd").style.backgroundColor = "red";
                    return false;
                }
                if(renewpwd == ""){
                    document.getElementById("checkrenewpwd").innerHTML = "确认密码不能为空";
                    document.getElementById("checkrenewpwd").style.backgroundColor = "red";
                    return false;
                }*/
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
    </script>
    <style type="text/css"></style>
</head>

<body>
<!--登录-->
<div class="container col-xs-offset-4">
    <form action="ChangePasswordServlet" method="POST" id="formId">
        <fieldset>
            <legend>密码修改</legend>
            <ul>
                <li>
                    <label for="prepwd">原密码：</label>
                    <input type="password" name="prepwd" id="prepwd"/>
                    <span id="checkprepwd"></span>
                    <span id="checksame" style="background-color: red">${same}</span>
                    <span id="error" style="background-color: red">${error}</span>
                    <%--隐藏域，用于修改密码--%>
                    <input type="hidden" name="username" value="${username}">
                </li>
                <li>
                    <label for="newpwd">新密码：</label>
                    <input type="password" name="newpwd" id="newpwd"/>
                    <span id="checknewpwd"></span>
                </li>
                <li>
                    <label for="renewpwd">确认密码：</label>
                    <input type="password" name="renewpwd" id="renewpwd"/>
                    <span id="checkrenewpwd" style="background-color: red">${msg}</span>
                </li>
                <li>
                    <label for="changepwdsubmit"></label>
                    <input type="submit" name="login" value="保存" class="login_btn" id="changepwdsubmit"/>
                    <input type="reset" name="login" value="重置" class="login_btn" id="resetpassword"/>
                    <a href="FindByPageServlet">
                        <input type="button" name="login" value="返回" class="login_btn" id="return"/>
                    </a>
                </li>
            </ul>
        </fieldset>
    </form>
</div>
<%--<!-- 注册 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">注册</h4>
            </div>
            <div class="modal-body">
                <form action="UserRegServlet" method="post">
                    <div class="form-group">
                        <label for="username">用户名：</label>
                        <input type="text" class="form-control" name="username" id="username" placeholder="请输入用户名"><span
                            id="checkreguser"></span>
                    </div>
                    <div class="form-group">
                        <label for="password">密码：</label>
                        <input type="password" class="form-control" name="password" id="password"
                               placeholder="请输入密码"><span id="checkregpass"></span>
                    </div>
                    <div class="form-group">
                        <label for="regcode">验证码：</label>
                        <input type="text" class="form-control" name="regcode" id="regcode"
                               placeholder="请输入验证码"><img src="ProduceCodeServlet" id="regImgId" style="cursor: pointer;"><span id="checkregcode"></span><br/>
                        <a href="javascript:void(0)" id="changeregcode">看不清？换一换</a>
                    </div>
                    <div class="form-group text-center">
                        <input type="submit" class="btn btn-primary" value="注册" id="submit"/>
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>--%>

</body>
</html>
