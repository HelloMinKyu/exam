<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>

<div class="wrap02">
  <div class="sub02">
    <p class="sub02_title" onclick="location.href='/tBoard/tip/list/0'" style="cursor : pointer">팁게시판</p>
    <div class="sub02_title_wrap">
      <p class="sub02_cont_title">${board.title}</p>

      <div class="sub2_info">
        <ul>
          <li>
            <div class="day">
              <p>
                <fmt:parseDate value="${board.createdAt}" var="parsedDate" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
                <fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd"/>
              </p>
            </div>
          </li>
          <li>
            <div class="view">
              <p>조회수 <span>${board.view}</span></p>
            </div>

          </li>
          <li>
            <div>
              <p>플로나</p>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <div class="sub02_conts">

      <div class="sub02_conts_btnwrap">
        <ul>
          <c:if test="${user.gm eq 1}">
          <li><button class="edit_btn" onclick="location.href='/tBoard/tip/update/${board.id}'">수정</button></li>
          <li><button class="delete_btn" onclick="goDelete(${board.id})">삭제</button></li>
          </c:if>
        </ul>
      </div>
      ${board.content}
    </div>

  </div>
</div>
</body>
</html>
<script>
  function goDelete(id) {
    if(confirm("정말로 삭제하시겠습니까?")) {
      $.ajax({
        url: '/fBoard/delete',
        type: 'post',
        data: {id: id},
        success: function (data) {
          alert("정상적으로 삭제되었습니다.")
          location.href='/fBoard/free/list/0'
        },
        error: function () {
          alert("error");
        }
      })
    }
  }
</script>