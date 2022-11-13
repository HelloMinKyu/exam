<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-13
  Time: 오후 8:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>문의사항</title>
</head>
<body>
<ul>
    <c:forEach items="${board}" var="board">
        <a href="/iBoard/inquiry/read/${board.id}">
        <li>${board.title}</li>
        </a>
    </c:forEach>
</ul>
<a href="/ming339696">목록으로</a>
</body>
</html>
