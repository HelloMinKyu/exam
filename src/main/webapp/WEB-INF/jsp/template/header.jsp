<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
<header>
    <div class="header_wrap">
        <div class="logo">
            <a href="/">
                <img src="/img/logo.png" alt="로고" height="80px">
            </a>

        </div>
        <div class="menu_wrap ">
            <ul>
                <li><a href="/nBoard/notice/list/0">공지사항</a></li>
                <li><a href="/uBoard/update/list/0">업데이트</a></li>
                <li><a href="/tBoard/tip/list/0">팁게시판</a></li>
                <c:if test="${user ne null}">
                <li><a href="/iBoard/inquiry/${user.id}/list/0">내 문의함</a></li>
                </c:if>
            </ul>
        </div>

        <div class="toggle_menu "></div>


    </div>
</header>