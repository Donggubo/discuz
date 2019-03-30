<%--import="java.util.*"导入java.util下的内容，给当前jsp使用--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户登录</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <!--js-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/index.js"></script>
    <style type="text/css"></style>

</head>

<body>
<!--登录-->
<div class="container col-xs-offset-4">
    <form action="UserLoginServlet" method="POST">
        <fieldset>
            <legend>用户登录</legend>
            <ul>
                <li>
                    <label for="loginusername">用户名:</label>
                    <input type="text" name="username" id="loginusername" placeholder="请输入用户名"/><span
                        id="checkusername"></span>
                </li>
                <li>
                    <label for="loginpassword">密码:</label>
                    <input type="password" name="password" id="loginpassword" placeholder="请输入密码"/><span
                        id="checkpassword"></span>
                </li>
                <li>
                    <label for="code">验证码:</label>

                    <input type="text" name="code" id="code" placeholder="请输入验证码" value=""/>
                    <a href="javascript:void(0)" id="changeImg"><img src="ProduceCodeServlet" id="imgId"></a>
                    <a href="javascript:void(0)" id="changeImgViaWord">看不清?换一张</a><span id="checkcode"></span>
                    <%--验证码有误时提示信息--%>
                    <span id="msg" style="background-color: red"><%=request.getAttribute("msg") == null ? "" : request.getAttribute("msg")%></span>
                </li>
                <li>
                    <label for="loginsubmit"> </label>
                    <input type="submit" name="login" value="登录" class="login_btn" id="loginsubmit"/>
                    <button type="button" id="button" class="login_btn" data-toggle="modal" data-target="#myModal">
                        注册
                    </button>
                </li>
            </ul>
        </fieldset>
    </form>
</div>
<!-- 注册 -->
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
</div>

</body>
</html>