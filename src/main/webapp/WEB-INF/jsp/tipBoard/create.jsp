<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<div class="wrap02">
  <div class="sub03">
    <p class="sub02_title">글쓰기</p>
    <form action="/tBoard/tip/write" method="post" onsubmit="return confirm('정말로 작성하시겠습니까?')">
    <div class="sub03_wrap">
      <div class="sub03_title_input">
        <input type="text" name="title" placeholder="제목을 입력하세요">
        <input type="hidden" value="${user.id}" name="userID">
      </div>
      <div class="sub03_conts">
        <textarea id="boardContent" name="content" placeholder="내용을 입력해주세요"></textarea>
        <script>
          $(function () {
            CKEDITOR.replace('boardContent', {
              height: '500px',
              filebrowserUploadUrl: '${pageContext.request.contextPath}/file/upload.do'
            });
          });
        </script>
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