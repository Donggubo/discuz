<%@ page import="com.dao.MessDao" %>
<%@ page import="com.user.Mess" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>留言板</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/add.js"></script>
</head>
<body>
<%--安全判断--%>
<%
    String username = (String)session.getAttribute("username");
    String password = (String)session.getAttribute("password");

    if( username == null && password == null){
        response.sendRedirect("./template/failedlogintransfer.html");
    }
%>

<div class="container">
    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:void(0)">欢迎${username}发言</a>
        </div>
        <div class="navbar-header">
            <a class="navbar-brand" href="MemberCenterServlet?username=${username}">个人中心</a>
        </div>
        <div class="navbar-header">
            <a class="navbar-brand" href="FindByPageServlet?pageNumber=1">留言板</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="javascript:void(0)" class="navbar-brand">发布留言</a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="LogoutServlet" class="navbar-brand">退出登录</a></li>
            </ul>
        </div>
    </nav>
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    排行
                </div>

                <!--这里显示标题-->

                <c:forEach items="${messFindByPage}" var="mess">
                <div class="panel-body">
                    <ul>
                        <li>${mess.title}</li>
                    </ul>
                </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-9">

            <form role="form" action="AddMessServlet" method="post">
                <div class="form-group">
                    <label>留言主题</label>
                    <input type="text" class="form-control" name="title" placeholder="请输入标题" id="title"><span id="checktitle"></span>
                </div>
                <div class="form-group">
                    <label>留言内容</label>
                    <textarea class="form-control" rows="10" name="content" placeholder="欢迎吐槽，请文明用语" id="content"></textarea><span id="checkcontent"></span>
                </div>
                <input type="submit" class="btn btn-default" value="发表" id="submit">
            </form>
        </div>
    </div>
</div>
</body>
</html>