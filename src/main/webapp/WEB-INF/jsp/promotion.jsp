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
        <form action="/dn/write" method="post" onsubmit="return check()">
        <div class="form_box">
            <div class="input_wrap">
                <label>닉네임</label>
                <input type="text" name="gainName" id="id" placeholder="지급받으실 캐릭터명을 작성해주세요." oninput="checkId()" required>
                <input type="hidden" value="${user.id}" name="userID">
            </div>
            <div class="input_wrap">
                <label>종류</label>
                <select name="type2" required>
                    <option value="문화상품권" selected>문화상품권</option>
                    <option value="해피머니">해피머니</option>
                </select>
            </div>
            <div class="input_wrap">
                <label>핀코드</label>
                <textarea name="content" placeholder="핀코드를 입력해주세요.
예) 1111-1111-1111111 = 10,000"></textarea>

            </div>
            <div class="check_wrap">
                <input type="checkbox" id="check1" name="checkAgree" value="동의">
                <label for="check1"></label>
                <label>도네이션 동의</label>
            </div>
            <div class="form_check_text">
                <p>
                    유저분들의 도네이션은 호스팅비, 유지보수, 개발비에 사용되며
                    절대로 강제적으로 하는것이 아닌 자발적으로 참여해주시는 것 입니다.
                </p>
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
        height: 11.25em;
        /*border: none;*/
        resize: none;
    }
</style>
<script>
    function check() {
        var confirmAlert = confirm('정말로 승인하시겠습니까?');
        if($("input:checkbox[name='checkAgree']").is(":checked") == false) {
            alert("도네이션 동의를 체크해주세요.");
            return false;
        }
        if(!confirmAlert) {
            return false;
        }
    }
</script>