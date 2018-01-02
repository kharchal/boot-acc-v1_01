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
                $(".chk:not(:checked)").each(function () {
                    $(this).prop("checked", true);
                });
            });
            $("#unselect_all").click(function () {
                $(".chk:checked").each(function () {
                    $(this).prop("checked", false);
                });
            });
            $("#reverse").click(function () {
                $(".chk").each(function () {
                    var x = $(this).prop("checked");
                    console.log(x);
                    $(this).prop("checked", !x);
                });
            });
            $("#mass_delete").click(function () {
                console.log("mass delete...");
                var arr = [];
                $(".chk:checked").each(function () {
                    console.log("val=" + $(this).val());
                    arr.push($(this).val());
                });
                console.log("arr=" + arr);
                $.post("massdelete", {ids: arr}, function (resp, status) {
                    console.log("resp = " + resp);
                    console.log("status = " + status);
                    if (status == 'success') {
                        location.reload(true);
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="container">
    <jsp:include page="util/header.jsp"/>
    <h2><s:message code="customer.list"/></h2>
    <table class="table table-hover">
        <tr>
            <th>
                <span class="dropdown">
                    <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-check"></span>&nbsp;
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a><s:message code="cancel"/></a></li>
                        <li><a id="select_all"><s:message code="select.all"/></a></li>
                        <li><a id="unselect_all"><s:message code="unselect.all"/></a></li>
                        <li><a id="reverse"><s:message code="reverse"/></a></li>
                        <li class="divider"></li>
                        <li><a id="mass_delete"><span style="color: red; font-weight: bold"><s:message code="mass.delete"/></span></a></li>
                    </ul>
                </span>
            </th>
            <th><s:message code="id"/></th>
            <th><s:message code="number"/></th>
            <th><s:message code="balance"/></th>
            <th><s:message code="active"/></th>
            <th><s:message code="user.login"/></th>
            <th><s:message code="service.list"/></th>
            <th></th>
        </tr>
        <c:forEach var="cust" items="${list}">
            <tr>
                <td><input type="checkbox" class="chk" value="${cust.id}"/></td>
                <td><c:out value="${cust.id}"/></td>
                <td><c:out value="${cust.formattedNumber}"/></td>
                <td><c:out value="${cust.balance}"/></td>
                <td><input type="checkbox" disabled ${cust.active ? "checked" : ""}/></td>
                <td><c:out value="${cust.user.login}"/></td>
                <td>
                    <c:forEach var="serv" items="${cust.serviceList}">
                        <c:out value="${serv.period.value}/${serv.name} : ${serv.cost}"/><br>
                    </c:forEach>
                </td>
                <td>
                    <nobr>
                    <a href="<c:url value='/customer/${cust.id}'/>" class="btn btn-info btn-sm"><s:message code="edit"/></a>&nbsp;
                    <span class="dropdown">
                        <button class="btn btn-danger btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><s:message code="delete"/>
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="btn btn-default btn-sm"><s:message code="cancel"/></a></li>
                            <li><a href="<c:url value='/customer/delete/${cust.id}'/>" class="btn btn-danger btn-sm"><s:message code="confirm"/></a></li>
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