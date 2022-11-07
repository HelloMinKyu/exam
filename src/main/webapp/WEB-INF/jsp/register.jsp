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
            <p>회원가입</p>
        </div>
        <form action="/register/write" method="post" onsubmit="return confirm('정말로 가입하시겠습니까?')">
        <div class="form_box">
            <div class="input_wrap">
                <label>아이디</label>
                <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." oninput="checkId()" required>
                <span class="success">사용 가능한 아이디입니다.</span>
                <span class="fail">누군가 이 아이디를 사용하고 있어요.</span>
            </div>
            <div class="input_wrap">
                <label>비밀번호</label>
                <input type="password" id="pwd1" placeholder="비밀번호를 입력해주세요." class="pwd" required>

            </div>
            <div class="input_wrap">
                <label>비밀번호 확인</label>
                <input type="password" name="pwd" id="pwd2" placeholder="비밀번호를 입력해주세요." class="pwd" required>
                <span class="failPwd">비밀번호를 확인해주세요</span>
                <span class="successPwd">비밀번호가 일치합니다</span>
            </div>
            <div class="input_wrap">
                <label>성별</label>
                <select name="sex" required>
                    <option value="0" selected>남자</option>
                    <option value="1">여자</option>
                </select>
            </div>
<%--            <div class="check_wrap">--%>
<%--                <input type="checkbox" id="check1">--%>
<%--                <label for="check1"></label>--%>
<%--                <label>이용약관 동의</label>--%>
<%--            </div>--%>
<%--            <div class="form_check_text">--%>
<%--                <p>--%>
<%--                    플로나의 게임 필독 사항을 모두동의합니다.--%>
<%--                </p>--%>
<%--            </div>--%>
        </div>
        <button type="submit" class="login_btn2">가입</button>
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

    .success {
        display: none;
    }
    .fail {
        display: none;
    }

    .successPwd {
        display: none;
    }
    .failPwd {
        display: none;
    }
</style>
<script>
    function checkId() {
        var id = $('#id').val();
        $.ajax({
            url: '/idCheck',
            type: 'post',
            data: {id:id},
            success: function (cnt) {
                if(cnt == 0) {
                    $('.success').css("display", "inline-block");
                    $('.fail').css("display", "none");
                } else {
                    $('.success').css("display", "none");
                    alert("누군가 이 아이디를 사용하고 있어요");
                    $('#id').val('');
                }
            }
        })
    }

    $('.pwd').focusout(function () {
        var pwd1 = $('#pwd1').val();
        var pwd2 = $('#pwd2').val();

        if(pwd1 != '' && pwd2 == '') {
            null;
        } else if(pwd1 != '' || pwd2 != '') {
            if(pwd1 == pwd2) {
                $('.successPwd').css("display", "inline-block");
            } else {
                $('.successPwd').css("display", "none");
                alert("비밀번호가 일치하지 않습니다");
                $('#pwd2').val('');
                $('#pwd1').val('');
            }
        }
    })
</script>