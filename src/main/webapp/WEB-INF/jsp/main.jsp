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
                    <img src="img/배너.png" alt="슬라이드 이미지">
                </div>
                <div class="swiper-slide">
                    <img src="img/img02.png" alt="슬라이드 이미지">
                </div>
                <div class="swiper-slide">
                    <img src="img/img03.png" alt="배너슬라이드 이미지">
                </div>

            </div>
        </div>
    </div>
</div>
<div class="wrap">
    <div class="main_contents">
        <div class="notice section">
            <div class="main_title_wrap">
                <p>공지사항</p>
                <div class="more_btn"><a href="#">MORE+</a></div>
            </div>
            <div class="conts_list">
                <ul>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="board section">
            <div class="main_title_wrap">
                <p>게시판</p>
                <div class="more_btn"><a href="sub01.html">MORE+</a></div>
            </div>
            <div class="conts_list">
                <ul>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                    <li>
                        <p><span>-</span> 이벤트 기간 안내 </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="login section">
            <div class="login_logo">
                <img src="img/로고.png" alt="로고">
            </div>
            <c:if test="${LOGIN_MEMBER eq null}">
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
            <c:if test="${LOGIN_MEMBER ne null}">
                <div class="login2_wrap">
                    <div class="login2_text">
                        <p><span>${LOGIN_MEMBER.name}</span> 님 어서오세요.</p>
                        <span>현재동접 : 1</span>
                    </div>

                </div>
                <div class="logout_btn">
                    <button onclick="location.href='/logout'">로그아웃</button>
                </div>
            </c:if>
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