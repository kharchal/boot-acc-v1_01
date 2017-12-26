<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Time</title>
</head>
<body>
<div class="container">

    <c:out value="${time}"/>
    <jsp:include page="util/footer.jsp"/>
</div>
</body>
</html>
