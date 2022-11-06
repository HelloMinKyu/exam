<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>
<div class="main_banner">
    <div class="wrap">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide">
                    <img src="img/img01.png" alt="슬라이드 이미지">
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
                <img src="img/logo.png" alt="로고">
            </div>
            <c:if test="${LOGIN_MEMBER eq null}">
            <form action="/login" enctype="multipart/form-data" method="post">
            <div class="form_box">
                <div class="input_wrap">
                    <div class="input_icon">
                        <img src="img/user.png" alt="사용자">
                    </div>
                    <input type="text" name="name" id="" placeholder="아이디를 입력해주세요.">
                </div>
                <div class="input_wrap">
                    <div class="input_icon">
                        <img src="img/lock.png" alt="자물쇠">
                    </div>
                    <input type="password" name="pwd" id="" placeholder="비밀번호를 입력해주세요.">
                </div>
                <button type="submit" class="login_btn">로그인</button>
                <a href="sub04.html" class="sing_page">회원가입</a>
            </div>
            </form>
            </c:if>
            <c:if test="${LOGIN_MEMBER ne null}">
                <div class="form_box">
                    <div class="input_wrap">
                        <div class="input_icon">
                                ${LOGIN_MEMBER.name}
                        </div>
                    </div>
                    <div class="input_wrap">
                        <div class="input_icon">
                            <img src="img/lock.png" alt="자물쇠">
                        </div>
                        <input type="password" name="pwd" id="" placeholder="비밀번호를 입력해주세요.">
                    </div>
                    <button type="submit" class="login_btn">로그인</button>
                    <a href="sub04.html" class="sing_page">회원가입></a>
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