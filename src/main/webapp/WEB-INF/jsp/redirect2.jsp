<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<jsp:include page="/head"/>
<!--E:sub-vs-->

<script type="text/javascript">
    var message = '${fn:replace(message, "<br>", "\\n")}';
    alert(message);
</script>