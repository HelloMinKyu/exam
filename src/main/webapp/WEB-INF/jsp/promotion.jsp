<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="//code.jquery.com/jquery-3.5.1.min.js" ></script>
<jsp:include page="/header"/>
<jsp:include page="/head"/>

<div class="sign_up_wrap">
    <div class="sign_up">
        <div class="title">
            <p>도네이션</p>
        </div>
        <form action="/pr/write" method="post" onsubmit="return confirm('정말로 전송하시겠습니까?')">
        <div class="form_box">
            <div class="input_wrap">
                <label>닉네임</label>
                <input type="text" name="gainName" id="id" placeholder="지급받으실 캐릭터명을 작성해주세요." oninput="checkId()" required>
                <input type="hidden" value="${user.id}" name="userID">
            </div>
            <div class="input_wrap">
                <label>링크</label>
                <textarea name="content" placeholder="url과 총 횟수를 꼭 입력해주셔야 합니다.
 예) http:플로나1
    http:플로나2
    http:플로나3
    http:플로나4
 최종 04회

--홍보가능 주소 --
투데이프리 - https://oraksil.cc/
우아미넷 - https://uami1.net/
프리넥스 - https://freenex.net/
프리블루 - https://freeblue02.xyz/
랭크프리 - https://rankfree01.xyz/
투데이시즌2 - https://todaync.com/
게임존 - http://gamezone.live/
빅데이터 - https://bigdt114.com/
리니지갤러리 - https://lingal.net/
홍보킹 - https://hb-king.xyz/
팝린 - https://poplin1.xyz/
린투데이 - https://android-dev.org/public/

 !! 어느 사이트를 홍보하시던 토탈 하루 10회만 가능합니다.
 1회당 400캐시로 환산하여 지급해드립니다.
 5회당 경쿠,드쿠 1장씩 보내드립니다.
 감사합니다."></textarea>

            </div>
        </div>
        <button type="submit" class="login_btn2">전송</button>
        </form>
    </div>



</div>



</body>


</html>
<style>
    select {
        width: 200px;
        padding: .8em .5em;
        border: 1px solid #999;
        font-family: inherit;
        border-radius: 8px;
        -moz-appearance: none;
    }

    textarea {
        width: 100%;
        height: 41.25em;
        /*border: none;*/
        resize: none;
    }
</style>
<script>

</script>