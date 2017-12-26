<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <jsp:include page="util/imports.jsp"/>
</head>
<body>
<div class="container">

    <jsp:include page="util/header.jsp"/>
    <h2><s:message code="user.list"/></h2>
    <table class="table table-hover">
        <tr>
            <th><s:message code="id"/></th>
            <th><s:message code="name"/></th>
            <th><s:message code="age"/></th>
            <th><s:message code="login"/></th>
            <th><s:message code="password"/></th>
            <th><s:message code="email"/></th>
            <th><s:message code="address"/></th>
            <th></th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.age}"/></td>
                <td><c:out value="${user.login}"/></td>
                <td><c:out value="${user.password}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.address}"/></td>
                <td>
                    <a href="<c:url value='/users/${user.id}'/>" class="btn btn-info"><s:message code="edit"/></a>
                    <span class="dropdown">
                        <button class="btn btn-danger dropdown-toggle" type="button" data-toggle="dropdown"><s:message code="delete"/>
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="btn btn-default"><s:message code="cancel"/></a></li>
                            <li><a href="<c:url value='/users/delete/${user.id}'/>" class="btn btn-danger"><s:message code="confirm"/></a></li>
                        </ul>
                    </span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <jsp:include page="util/footer.jsp"/>
</div>
</body>
</html>