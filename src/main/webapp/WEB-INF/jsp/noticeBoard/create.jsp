<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>

<div class="wrap02">
  <div class="sub03">
    <p class="sub02_title">글쓰기</p>
    <form action="/board/notice/write" method="post">
    <div class="sub03_wrap">
      <div class="sub03_title_input">
        <input type="text" name="title" placeholder="제목을 입력하세요">
        <input type="hidden" value="${user.id}" name="userID">
      </div>
      <div class="sub03_conts">
        <textarea name="content" placeholder="내용을 입력해주세요"></textarea>
      </div>
      <div>
        <button type="submit" class="main_btn">등록</button>
      </div>
    </div>
    </form>
  </div>

</div>



</body>


</html>