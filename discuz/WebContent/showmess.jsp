<%@ page import="com.dao.MessDao" %>
<%@ page import="com.user.Mess" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <a class="navbar-brand" href="javascript:void(0)">欢迎${username}登录</a>
        </div>
        <div class="navbar-header">
            <a class="navbar-brand" href="MemberCenterServlet?username=${username}">个人中心</a>
        </div>
        <div class="navbar-header">
            <a class="navbar-brand" href="FindByPageServlet?pageNumber=1">留言板</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="ShowTitleServlet?username=${username}" class="navbar-brand">发布留言</a></li>
            </ul>
            <%--个人中心下拉菜单开始（待开发）--%>

            <%--个人中心下拉菜单结束（待开发）--%>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="LogoutServlet" class="navbar-brand">退出登录</a></li>
            </ul>
        </div><!--/.navbar-collapse-->
    </nav>

    <div class="row">
        <div class="col-md-3">
            <div class="panel panel-primary">

                <div class="panel-heading">
                    最新回帖标题
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


            <c:forEach items="${messFindByPage}" var="mess">
            <div class="panel panel-primary">
                <!--这里显示标题-->

                <div class="panel heading" style="background:#337AB7;height:30px">
                    <span class="glyphicon glyphicon-star">
                            ${mess.title}
                    </span>
                </div>

                <!--这里显示内容-->

                <div class="panel-body" style="height:120px;">
                        ${mess.content}
                </div>

                <!--这里显示时间-->

                <div class="panel-footer">
                  发布时间：${mess.addtime}
                </div>

            </div>
            </c:forEach>
            <ul class="pager">
                <%--当前页是首页--%>
                <c:if test="${pageNumber==1}">
                <li class="previous disabled">
                    <a href="FindByPageServlet?pageNumber=1">&larr;首页</a>
                </li>
                </c:if>

                 <%--当前页不是首页--%>
                 <c:if test="${pageNumber>1}">
                     <li class="previous">
                         <a href="FindByPageServlet?pageNumber=1">&larr;首页</a>
                     </li>
                 </c:if>

                <%--当前页是第一页--%>
                <c:if test="${pageNumber==1}">
                <li class="disabled">
                    <a href="FindByPageServlet?pageNumber=1">上一页</a>
                </li>
                </c:if>
                <%--当前页不是第一页--%>
                <c:if test="${pageNumber>1}">
                    <li>
                        <a href="FindByPageServlet?pageNumber=${pageNumber-1}">上一页</a>
                    </li>
                </c:if>

               <%--当前页等于总页数--%>
               <c:if test="${pageNumber==totalPage}">
                <li class="disabled">
                    <a href="FindByPageServlet?pageNumber=${totalPage}">下一页</a>
                </li>
               </c:if>

                <%--当前页小于总页数--%>
                <c:if test="${pageNumber<totalPage}">
                    <li>
                        <a href="FindByPageServlet?pageNumber=${pageNumber+1}">下一页</a>
                    </li>
                </c:if>
                <%--提示信息--%>
                <li class="disabled">
                    <a href="">总页数：${totalPage}</a><a href="">当前页：第${pageNumber}页</a>
                </li>

                 <%--当前页是尾页--%>
                <c:if test="${pageNumber==totalPage}">
                <li class="next disabled">
                    <a href="FindByPageServlet?pageNumber=${totalPage}">末页&larr;</a>
                </li>
                </c:if>
                <%--当前页不是尾页--%>
                <c:if test="${pageNumber<totalPage}">
                    <li class="next">
                        <a href="FindByPageServlet?pageNumber=${totalPage}">末页&larr;</a>
                    </li>
                </c:if>
            </ul>

        </div>
        <%--快速跳转--%>
        <div style="float: right">
        <form action="FindByPageServlet">
          <span>跳转：</span><input type="text" name="pageNumber" size="1" title="按回车键快速跳转"/>
           <input type="submit" value="GO">
         </form>
        </div>
    </div>
</div>
</body>
</html>