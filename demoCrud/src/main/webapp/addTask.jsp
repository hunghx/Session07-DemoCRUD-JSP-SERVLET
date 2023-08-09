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
<h1>Thêm mới công việc</h1>
<form action="<%=request.getContextPath()%>/TaskServlet" method="post">
    <label for="content">Nội dung</label>
    <textarea name="content" id="content" cols="30" rows="10">...</textarea>
    <input type="submit" value="ADD" name="action">
</form>
</body>
</html>
