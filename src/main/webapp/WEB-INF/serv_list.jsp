<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <jsp:include page="util/imports.jsp"/>
    <script>

    </script>
</head>
<body>
<div class="container">
    <jsp:include page="util/header.jsp"/>
    <h2><s:message code="user.list"/></h2>
    <table class="table table-hover">
        <tr>
            <th></th>
            <th><s:message code="id"/></th>
            <th><s:message code="name"/></th>
            <th><s:message code="cost"/></th>
            <th></th>
        </tr>
        <c:forEach var="serv" items="${list}">
            <tr>
                <td></td>
                <td><c:out value="${serv.id}"/></td>
                <td><c:out value="${serv.name}"/></td>
                <td><c:out value="${serv.cost}"/></td>
                <td>
                    <nobr>
                    <a href="<c:url value='/service/${serv.id}'/>" class="btn btn-info btn-sm"><s:message code="edit"/></a>&nbsp;
                    <span class="dropdown">
                        <button class="btn btn-danger btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><s:message code="delete"/>
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="btn btn-default btn-sm"><s:message code="cancel"/></a></li>
                            <li><a href="<c:url value='/service/delete/${serv.id}'/>" class="btn btn-danger btn-sm"><s:message code="confirm"/></a></li>
                        </ul>
                    </span>
                    </nobr>
                </td>
            </tr>
        </c:forEach>
    </table>

    <jsp:include page="util/footer.jsp"/>
</div>
</body>
</html>