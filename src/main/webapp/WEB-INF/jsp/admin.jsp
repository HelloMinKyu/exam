<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-13
  Time: 오후 7:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>관리자페이지</title>
</head>
<body>
<c:if test="${user.gm eq 1}">
<a href="/ming339696/Inquiry/list">
    문의사항
</a>
    <br>
    <br>
<a href="/ming339696/pr/list">
    홍보
</a>
    <br>
    <br>
<a href="/ming339696/dn/list">
    후원
</a>
</c:if>
</body>
</html>
