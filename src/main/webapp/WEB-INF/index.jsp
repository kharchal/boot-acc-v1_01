<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Hello page</title>
</head>
<body>
    <jsp:include page="util/header.jsp"/>
    <h2><s:message code="hello"/></h2>
    <a href="<c:url value='/time'/>">time</a>
    <a href="<c:url value='/users/'/>">users</a>
</body>
</html>