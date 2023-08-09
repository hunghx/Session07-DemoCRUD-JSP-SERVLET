<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 8/9/2023
  Time: 8:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>Danh sách công việc</h1>
    <a href="<%=request.getContextPath()%>/TaskServlet?action=ADD">Add New Task</a>
<table border="10" cellspacing="10" cellpadding="20">
    <thead>
    <tr>
        <th>STT</th>
        <th>Công việc</th>
        <th>Trạng thái</th>
        <th colspan="2">Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${tasks}" var="t" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${t.content}</td>
            <td>${t.getStatus()?"Đã hoàn thành":"Chưa hoàn thành"}</td>
            <td><a href="<%=request.getContextPath()%>/TaskServlet?id=${t.id}&action=EDIT">Sửa</a></td>
            <td><a onclick="return confirm('Bạn có chắc chắn muốn xóa không')" href="<%=request.getContextPath()%>/TaskServlet?id=${t.id}&action=DELETE">Xóa</a></td>
        </tr>
    </c:forEach>


    </tbody>
</table>
</body>
</html>
