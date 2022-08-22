<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 박민규
  Date: 2022-08-22
  Time: 오전 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exam</title>
</head>
<body>
    <table>
        <thead>
        <tr>
            <th>게시글</th>
            <th>등록일</th>
            <th>작성자</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pagingInfo.items}" var="board" varStatus="status">
            <tr>
                <td>
                    <a href="/board/read/${board.id}">
                            ${board.title}
                    </a>
                </td>
                <td>${board.writer}</td>
                <td>
                    <fmt:parseDate value="${board.createdAt}" var="parsedDate" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
                    <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:forEach begin="${pagingInfo.beginPage}" end="${pagingInfo.endPage}" varStatus="status">
        <a class="${status.index == pagingInfo.curPage ? "on" : ""}"
           href="/board/list/${status.index}">${status.index + 1}</a>
    </c:forEach>
</body>
</html>
