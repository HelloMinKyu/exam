<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>

<div class="sign_up_wrap">
    <div class="sign_up">
        <div class="title">
            <p>회원가입</p>
        </div>
        <form action="/register/write" method="post">
        <div class="form_box">
            <div class="input_wrap">
                <label>아이디</label>
                <input type="text" name="id" placeholder="아이디를 입력해주세요.">
                <span class="fail">중복된 아이디 입니다.</span>
                <span class="fail">중복된 아이디 입니다.</span>
            </div>
            <div class="input_wrap">
                <label>비밀번호</label>
                <input type="password" placeholder="비밀번호를 입력해주세요.">

            </div>
            <div class="input_wrap">
                <label>비밀번호 확인</label>
                <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                <span class="fail">비밀번호를 확인해주세요</span>
            </div>
            <div class="input_wrap">
                <label>성별</label>
                <select name="sex">
                    <option value="0" selected>남자</option>
                    <option value="1">여자</option>
                </select>
<%--                <input type="radio" name="sex" value="0">남자--%>
<%--                <input type="radio" name="sex" value="1">여자--%>
            </div>
<%--
            <div class="input_wrap">
                <label>생년월일</label>
                <input type="text" placeholder="8자리를 입력해주세요.">

            </div>
--%>
            <div class="check_wrap">
                <input type="checkbox" id="check1">
                <label for="check1"></label>
                <label>이용약관 동의</label>
            </div>
            <div class="form_check_text">
                <p>
                    국무총리는 대통령을 보좌하며, 행정에 관하여 대통령의 명을 받아 행정각부를 통할한다. 외국인은 국제법과 조약이 정하는 바에 의하여 그 지위가 보장된다. 모든 국민은 근로의
                    의무를 진다. 국가는 근로의 의무의 내용과 조건을 민주주의원칙에 따라 법률로 정한다. 감사원은 원장을 포함한 5인 이상 11인 이하의 감사위원으로 구성한다.
                    국회는 정부의 동의없이 정부가 제출한 지출예산 각항의 금액을 증가하거나 새 비목을 설치할 수 없다. 대한민국의 영토는 한반도와 그 부속도서로 한다.
                    저작자·발명가·과학기술자와 예술가의 권리는 법률로써 보호한다. 국정감사 및 조사에 관한 절차 기타 필요한 사항은 법률로 정한다. 계엄을 선포한 때에는 대통령은 지체없이
                    국회에 통고하여야 한다.

                    국회의 정기회는 법률이 정하는 바에 의하여 매년 1회 집회되며, 국회의 임시회는 대통령 또는 국회재적의원 4분의 1 이상의 요구에 의하여 집회된다. 국가는 대외무역을
                    육성하며, 이를 규제·조정할 수 있다. 모든 국민은 학문과 예술의 자유를 가진다. 대법원은 법률에 저촉되지 아니하는 범위안에서 소송에 관한 절차, 법원의 내부규율과
                    사무처리에 관한 규칙을 제정할 수 있다.

                    대통령은 내란 또는 외환의 죄를 범한 경우를 제외하고는 재직중 형사상의 소추를 받지 아니한다. 국회의원은 국회에서 직무상 행한 발언과 표결에 관하여 국회외에서 책임을 지지
                    아니한다. 대법원장의 임기는 6년으로 하며, 중임할 수 없다. 법률이 정하는 주요방위산업체에 종사하는 근로자의 단체행동권은 법률이 정하는 바에 의하여 이를 제한하거나
                    인정하지 아니할 수 있다.

                    국가는 균형있는 국민경제의 성장 및 안정과 적정한 소득의 분배를 유지하고, 시장의 지배와 경제력의 남용을 방지하며, 경제주체간의 조화를 통한 경제의 민주화를 위하여 경제에
                    관한 규제와 조정을 할 수 있다. 이 헌법중 공무원의 임기 또는 중임제한에 관한 규정은 이 헌법에 의하여 그 공무원이 최초로 선출 또는 임명된 때로부터 적용한다.

                    국군은 국가의 안전보장과 국토방위의 신성한 의무를 수행함을 사명으로 하며, 그 정치적 중립성은 준수된다. 국회는 의장 1인과 부의장 2인을 선출한다. 모든 국민은
                    언론·출판의 자유와 집회·결사의 자유를 가진다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다. 국회가 재적의원 과반수의 찬성으로 계엄의 해제를 요구한 때에는
                    대통령은 이를 해제하여야 한다.
                </p>
            </div>
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
</style>