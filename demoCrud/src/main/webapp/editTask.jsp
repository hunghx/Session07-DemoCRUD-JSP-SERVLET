<%--
  Created by IntelliJ IDEA.
  User: hung1
  Date: 8/9/2023
  Time: 8:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Chỉnh sửa công việc</h1>
<form action="<%=request.getContextPath()%>/TaskServlet" method="post">
    <label for="id">ID</label>
    <input type="text" id="id" name="id" readonly value="${taskEdit.id}">
    <br>
    <label for="content">Nội dung</label>
    <textarea name="content" id="content" cols="30" rows="5">${taskEdit.content}</textarea>
    <br>
    <label> Trạng thái</label>
    <select name="status">
        <option value="true" ${taskEdit.status==true?'selected':''}>Đã hoàn thành</option>
        <option value="false" ${taskEdit.status==true?'':'selected'}>Chưa hoàn thành</option>
    </select>
    <br>
    <input type="submit" value="UPDATE" name="action">
</form>
</body>
</html>
