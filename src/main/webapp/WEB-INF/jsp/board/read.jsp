<%--
  Created by IntelliJ IDEA.
  User: 박민규
  Date: 2022-08-22
  Time: 오후 4:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Exam</title>
</head>
<body>
<div class="center">
    제목:${board.title}
    <br>
    부서:${board.writer}
    <br>
    등록일:<fmt:parseDate value="${board.createdAt}" var="parsedDate" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
    <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
    ${board.content}
</div>
</body>
</html>
<style>
    .center {
        text-align: center;
    }
</style>
