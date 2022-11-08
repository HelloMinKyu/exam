<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>
<div class="wrap02">
  <div class="search_wrap">
    <input type="text" placeholder="게시글 제목을 입력해주세요">
    <div class="seacch_icon">
      <img src="/img/search.png" alt="검색">
    </div>
  </div>
  <div class="sub01_conts_wrap">
    <ul class="sub01_list">
      <c:forEach items="${pagingInfo.items}" var="board" varStatus="status">
      <li>
        <p>
          <span>(공지사항)</span>
          ${board.title}
        </p>
      </li>
      </c:forEach>
    </ul>
  </div>
  <div class=" writing">
    <c:if test="${user.gm eq 1}">
    <a href="/board/notice/create" class="w_btn">글쓰기</a>
    </c:if>
  </div>

  <div class="pageing">
    <ul>
      <li>
        <div><img src="/img/pre.png" alt="이전"></div>
      </li>

      <li class="active">
        <div>1</div>
      </li>
      <li>
        <div>2</div>
      </li>
      <li>
        <div>3</div>
      </li>
      <li>
        <div>4</div>
      </li>
      <li>
        <div>5</div>
      </li>
      <li>
        <div><img src="/img/next.png" alt="이전"></div>
      </li>
    </ul>
  </div>

</div>



</body>


</html>