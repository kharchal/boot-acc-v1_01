<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <jsp:include page="util/imports.jsp"/>
    <script>
        $(document).ready(function () {
            $("#select_all").click(function () {
                $("#chk:not(:checked)").each(function () {
                    $(this).prop("checked", true);
                });
            });
            $("#unselect_all").click(function () {
                $("#chk:checked").each(function () {
                    $(this).prop("checked", false);
                });
            });
            $("#mass_delete").click(function () {
                console.log("mass delete...");
                var arr = [];
                $("#chk:checked").each(function () {
                    console.log("val=" + $(this).val());
                    arr.push($(this).val());
                });
                console.log("arr=" + arr);
                $.post("massdelete", {ids: arr}, function (resp, status) {
                    console.log("resp = " + resp);
                    console.log("status = " + status);
                    if (status == 'success') {
                        location.reload(true);
//                        document.location.href = document.location.href;
                    }
                });
            });
        });
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
            <th><s:message code="age"/></th>
            <th><s:message code="login"/></th>
            <th><s:message code="rolex"/></th>
            <th><s:message code="role"/></th>
            <th><s:message code="email"/></th>
            <th><s:message code="address"/></th>
            <th></th>
        </tr>
        <c:forEach var="user" items="${userList}">
            <tr>
                <td><input type="checkbox" id="chk" value="${user.id}"/></td>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.age}"/></td>
                <td><c:out value="${user.login}"/></td>
                <td><c:out value="${user.rolex.value}"/></td>
                <td><c:out value="${user.role}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.address}"/></td>
                <td>
                    <nobr>
                    <a href="<c:url value='/users/${user.id}'/>" class="btn btn-info btn-sm"><s:message code="edit"/></a>&nbsp;
                    <span class="dropdown">
                        <button class="btn btn-danger btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><s:message code="delete"/>
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="btn btn-default btn-sm"><s:message code="cancel"/></a></li>
                            <li><a href="<c:url value='/users/delete/${user.id}'/>" class="btn btn-danger btn-sm"><s:message code="confirm"/></a></li>
                        </ul>
                    </span>
                    </nobr>
                </td>
            </tr>
        </c:forEach>
    </table>
    <nobr>
    <button id="select_all" class="btn btn-warning btn-sm"><s:message code="select.all"/> <span class="glyphicon glyphicon-ok"></span></button>
    <button id="unselect_all" class="btn btn-success btn-sm"><s:message code="unselect.all"/> <span class="glyphicon glyphicon-remove"></span></button>
    <span class="dropdown">
        <button class="btn btn-danger btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><s:message code="mass.delete"/>
            <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><a class="btn btn-default btn-sm"><s:message code="cancel"/></a></li>
            <li><a id="mass_delete" class="btn btn-danger btn-sm"><s:message code="confirm"/></a></li>
        </ul>
    </span>
    </nobr>
    <jsp:include page="util/footer.jsp"/>
</div>
</body>
</html>