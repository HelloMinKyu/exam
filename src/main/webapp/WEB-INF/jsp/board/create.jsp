<%--
  Created by IntelliJ IDEA.
  User: 박민규
  Date: 2022-08-22
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Exam</title>
<%-- 에디터 --%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<%--    제이쿼리--%>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form onsubmit="return confirm('정말로 작성하시겠습니까?')" method="post" enctype="multipart/form-data" action="/board/write">
    제목<input type="text" name="title">
    <br>
    작성자<input type="text" name="writer">
    <br>
    <textarea id="content_textarea" name="content" required></textarea>
    <script>
        $(function () {
            CKEDITOR.replace('content_textarea', {
                height: '500px',
                filebrowserUploadUrl: '${pageContext.request.contextPath}/board/fileupload.do'
            });
        });
    </script>
    <br>
    <button type="submit">작성</button>
</form>
</body>
</html>
