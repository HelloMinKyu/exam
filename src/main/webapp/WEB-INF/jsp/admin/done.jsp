<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-13
  Time: 오후 8:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>후원</title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<button type="button" onclick="goGive()">지급완료</button>
  <ul>
    <c:forEach items="${dn}" var="dn">
      <li><input type="checkbox" name="pidx1" id="${dn.id}" value="${dn.id}"> ${dn.account.name} ${dn.content}</li>
    </c:forEach>
  </ul>
<a href="/ming339696">목록으로</a>
</body>
</html>
<script>
  function goGive() {
    var IdxArray = [];
    $("input:checkbox[name=pidx1]:checked").each(function() {
      IdxArray.push($(this).val());
    });
    if(IdxArray == "") {
      alert("지급할 항목을 선택해주세요.");
      return false;
    }
    var confirmAlert = confirm("정말로 지급하시겠습니까?");
    if(confirmAlert) {
      $.ajax({
        type: 'post',
        url: '/ming339696/dn/give',
        dataType: 'json',
        data: JSON.stringify(IdxArray),
        contentType: 'application/json',
        success: function (result) {
          alert("정상지급되었습니다.");
          window.location.reload();
        }
      })
    }
  }
</script>