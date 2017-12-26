<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
</head>
<body>
    <jsp:include page="util/header.jsp"/>
    <h2><s:message code="user.list"/></h2>
    <table cellpadding="5">
        <tr>
            <th><s:message code="id"/></th>
            <th><s:message code="name"/></th>
            <th><s:message code="age"/></th>
            <th></th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.age}"/></td>
                <td>
                    <a href="<c:url value='/users/${user.id}'/>"><s:message code="edit"/></a>
                    <a href="<c:url value='/users/delete/${user.id}'/>"><s:message code="delete"/></a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <jsp:include page="util/footer.jsp"/>
</body>
</html>