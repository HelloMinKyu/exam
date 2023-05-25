<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>
<div class="main_banner">
    <div class="wrap">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="img/리로고.png" alt="슬라이드 이미지">
                </div>
                <div class="swiper-slide">
                    <img src="img/배너.png" alt="슬라이드 이미지">
                </div>
                <%--                <div class="swiper-slide">--%>
                <%--                    <img src="img/img03.png" alt="배너슬라이드 이미지">--%>
                <%--                </div>--%>

            </div>
        </div>
    </div>
</div>
<div class="wrap">
    <div class="main_contents">
        <div class="login section">

            <%--            <div class="login_logo">--%>
            <%--                <img src="img/logo.png" alt="로고">--%>
            <%--            </div>--%>

            <c:if test="${user eq null}">
                <div class="form_box">
                    <form action="/login" enctype="multipart/form-data" method="post">
                        <div class="login_btn_wrap">
                            <div class="login_width">
                                <div class="input_wrap">
                                    <div class="input_icon">
                                        <img src="img/user.png" alt="사용자">
                                    </div>
                                    <input type="text" name="name" placeholder="아이디를 입력해주세요.">
                                </div>
                                <div class="input_wrap">
                                    <div class="input_icon">
                                        <img src="img/lock.png" alt="자물쇠">
                                    </div>
                                    <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                                </div>
                            </div>
                            <button type="submit" class="login_btn">로그인</button>
                        </div>
                    </form>
                    <div class="login_last_btn">
                        <ul>
                            <li><a href="/register">회원가입</a></li>
                            <li><a href="#">아이디 찾기</a></li>
                            <li><a href="#">비밀번호 찾기</a></li>
                        </ul>
                    </div>
                </div>
            </c:if>
            <c:if test="${user ne null}">
                <div class="login2_wrap">
                    <div class="login2_text">
                        <p><span>${user.name}</span> 님 어서오세요.</p>
                        <span>현재동접 : <c:if test="${cnt >= 20}">
                            ${cnt + 20}
                        </c:if>
<%--                                <c:if test="${cnt <= 20}">--%>
<%--                                    ${cnt}--%>
<%--                                </c:if>--%>
                                </span>
                    </div>

                </div>
                <div class="logout_btn">
                    <button onclick="location.href='/logout'">로그아웃</button>
                </div>
            </c:if>
        </div>
        <div class="login_wrap">
            <div class="logout_btn2">
                <a href="https://t.me/+mHnL11ekruozNzk1" target="_blank"><img src="img/디코.png" style="width: 222px" height="110" class="radius_img_2"></a>
                <a href="https://t.me/+mHnL11ekruozNzk1" target="_blank"><img src="img/고객샌터.png" style="width: 222px" height="110" class="radius_img_2"></a>
            </div>
            <div class="logout_btn3">
                <a href="http://flona.site/nBoard/notice/read/3"><img src="img/규정.png" style="width: 444px" height="110" class="radius_img_2"></a>
            </div>
        </div>
    </div>
    <div class="main_contents">
        <div class="noticeWrap">
            <div class="notice section">
                <div class="main_title_wrap">
                    <p>공지사항</p>
                    <div class="more_btn"><a href="/nBoard/notice/list/0">MORE+</a></div>
                </div>
                <div class="conts_list">
                    <ul>
                        <c:forEach items="${notice}" var="notice" begin="0" end="4">
                            <li>
                                <p><span>-</span> <a href="/nBoard/notice/read/${notice.id}">${notice.title}<a/></p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="board section">
                <div class="main_title_wrap">
                    <p>게시판</p>
                    <div class="more_btn"><a href="/uBoard/update/list/0">MORE+</a></div>
                </div>
                <div class="conts_list">
                    <ul>
                        <c:forEach items="${update}" var="update" begin="0" end="4">
                            <li>
                                <p><span>-</span> <a href="/uBoard/update/read/${update.id}">${update.title}</a></p>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>

        <div class="eventBanner">
            <div class="notice section">
                <div class="conts_list">
                    <a href="/pr/create">
                        <img src="/img/홍보.png" style="width: 447px" class="radius_img_2">
                    </a>
                </div>
            </div>
            <div class="board section">
                <div class="conts_list">
                    <a href="/dn/create">
                        <img src="/img/후원.png" style="width: 447px" class="radius_img_2">
                    </a>
                </div>
            </div>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
<script>
    var swiper = new Swiper(".mySwiper", {});
</script>
<!-- Initialize Swiper -->

</body>


</html>