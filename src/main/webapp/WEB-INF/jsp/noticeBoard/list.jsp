<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<jsp:include page="/header"/>
<jsp:include page="/head"/>
<div class="wrap02">
  <form name="searchReq" id="searchReq" method="get" action="/nBoard/notice/list/0">
  <div class="search_wrap">
    <input type="hidden" name="category" value="title">
    <input type="text" name="value" placeholder="게시글 제목을 입력해주세요" value="${searchReq.value}">
    <div class="seacch_icon">
      <img src="/img/search.png" alt="검색">
    </div>
  </div>
  </form>
  <div class="sub01_conts_wrap">
    <ul class="sub01_list">
      <c:forEach items="${pagingInfo.items}" var="board" varStatus="status">
      <li>
        <p>
          <span>(공지사항)</span>
          <a href="/nBoard/notice/read/${board.id}">${board.title}</a>
        </p>
      </li>
      </c:forEach>
    </ul>
  </div>
  <div class=" writing">
    <c:if test="${user.gm eq 1}">
    <a href="/nBoard/notice/create" class="w_btn">글쓰기</a>
    </c:if>
  </div>

  <div class="pageing">
    <ul>
      <li>
        <a href="/nBoard/notice/list/${0 > pagingInfo.curPage - 1 ? 0 : pagingInfo.curPage - 1}${pathParam}">
        <div><img src="/img/pre.png" alt="이전"></div>
        </a>
      </li>

<%--      <li class="active">--%>
<%--        <div>1</div>--%>
<%--      </li>--%>
      <c:forEach begin="${pagingInfo.beginPage}" end="${pagingInfo.endPage}" varStatus="status">
      <li>
        <div>
          <a class="${status.index == pagingInfo.curPage ? "active" : ""}"
          href="/nBoard/notice/list/${status.index}${pathParam}">${status.index + 1}
          </a>
        </div>
      </li>
      </c:forEach>
      <li>
        <a href="/nBoard/notice/list/${pagingInfo.totalPage < pagingInfo.curPage + 1 ? pagingInfo.endPage : pagingInfo.curPage + 1}${pathParam}">
        <div><img src="/img/next.png" alt="이전"></div>
        </a>
      </li>
    </ul>
  </div>

</div>



</body>


</html>