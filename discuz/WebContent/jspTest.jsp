<%--import="java.util.*"导入java.util下的内容，给当前jsp使用--%>
<%@ page contentType="text/html;charset=UTF-8" import="java.util.*" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>

</script>
<body>
    <%--演示循环数组--%>
    <%
int[] arr = {666,888,999,1024};
request.setAttribute("arr", arr);
%>
    <%-- var在循环对象的时候，临时保存被循环到元素 --%>
<c:forEach items="${arr }" var="num">
    ${num }
</c:forEach>
    <hr>
    <%
        List list = new ArrayList();
        list.add("卡奴");
        list.add("兰恩");
        list.add("云娜");
        request.setAttribute("list", list);
    %>
    <c:forEach items="${list }" var="wind">
        <% out.print(list);%>
    </c:forEach>
    <hr>
    <%
        Map map = new HashMap();
        map.put("ms1", "简历");
        map.put("ms2", "身份证");
        map.put("ms3", "学历证明");
        map.put("ms4", "体检报告");
        request.setAttribute("map", map);
    %>
    <c:forEach items="${map }" var="entry">
        ${entry.key }
        ${entry.value }
    </c:forEach>

</body>
</html>
