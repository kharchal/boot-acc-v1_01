<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <%--<link rel="icon" type="image/png" href="/acc/favicon.ico"/>--%>
    <title>Hello page</title>
    <%--<link rel="stylesheet" href="./styles.css"/>--%>
    <jsp:include page="util/imports.jsp"/>

</head>
<body>
<div class="container">
    <jsp:include page="util/header.jsp"/>
    <h2><s:message code="hello"/></h2>
    <a href="<c:url value='/time'/>">time</a>
    <a href="<c:url value='/users/'/>">users</a>
</div>
</body>
</html>