<%@ page import="com.dao.MessDao" %>
<%@ page import="com.user.Mess" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>主页面</title>
    <meta charset="UTF-8">
    <title>留言板</title>
    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="css/bootstrap-theme.css"/>
    <link rel="stylesheet" href="css/index.css"/>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>

<%--安全判断--%>
<%--获取用户名和密码--%>
<%
    String username = (String)session.getAttribute("username");
    String password = (String)session.getAttribute("password");

   if( username == null && password == null){
       response.sendRedirect("./template/failedlogintransfer.html");
   }else{
       response.sendRedirect("showmess.jsp");
   }
%>

<div class="container">

    <nav class="navbar navbar-default">
        <div class="navbar-header">
            <a class="navbar-brand" href="showmess.jsp">留言板</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="add.jsp" class="navbar-brand">发布留言</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="LogoutServlet" class="navbar-brand">退出登录</a></li><%--点击退出登录，也是请求servlet--%>
            </ul>
        </div><!--/.navbar-collapse-->
    </nav>
    <%--<%
        //创建messDao对象
        MessDao messDao = new MessDao();
        //获取所有信息
        List<Mess> messes = messDao.queryMess();
    %>--%>
    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    最新回帖标题
                </div>

                <!--这里显示标题-->
               <%-- <% for (Mess mess : messes) { %>--%>
                <div class="panel-body">
                    <ul>
                        <li><%--<%=mess.getTitle()%>--%></li>
                    </ul>
                </div>
               <%-- <% }%>--%>
            </div>
        </div>

        <div class="col-md-9">

            <%--<% for (Mess mess : messes) { %>--%>
            <div class="panel panel-primary">
                <!--这里显示标题-->
                <div class="panel heading" style="background:#337AB7;height:30px">
                    <span class="glyphicon glyphicon-star">
                       <%-- <%=mess.getTitle()%>--%>
                    </span>
                </div>
                <!--这里显示内容-->
                <div class="panel-body" style="height:120px;">
                    <%--<%=mess.getContent()%>--%>
                </div>
                <!--这里显示时间-->
                <div class="panel-footer">
                    发布时间：<%--<%=mess.getAddtime()%>--%>
                </div>

            </div>
            <%--<%}%>--%>
            <ul class="pager">
                <li class="previous">
                    <a href="">&larr;首页</a>
                </li>
                <li>
                    <a href="">上一页</a>
                </li>
                <li>
                    <a href="">下一页</a>
                </li>
                <li class="next">
                    <a href="">末页&larr;</a>
                </li>
            </ul>
        </div>

    </div>
</div>
</body>
</html>