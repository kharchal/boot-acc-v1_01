<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Payments list</title>
    <jsp:include page="util/imports.jsp"/>
    <script>
        <%--var order = ${sort_order};--%>
        <%--var sort = "${sort_col}";--%>
        <%--var begining = "glyphicon glyphicon-";--%>
        <%--var symbol = "arrow";--%>
        <%--var up = "-up";--%>
        <%--var down = "-down";--%>
        <%--function reloadPageSorted() {--%>
            <%--order = !order;--%>
            <%--$.post("sort", {order: order, sort: sort}, function () {--%>
                <%--location.reload(true);--%>
            <%--});--%>
        <%--}--%>
        $(document).ready(function () {
//            var txt = $("#sort_" + sort).text();
//            $("#sort_" + sort).html(txt + ":&nbsp;<span style='font-size: smaller; color: cornflowerblue;' class='" + begining + symbol + (order ? up : down) +"'></span>");
//            $("#sort_id").click(function () {
//                sort = "id";
//                reloadPageSorted()
//            });
//            $("#sort_name").click(function () {
//                sort = "date";
//                reloadPageSorted()
//            });
//            $("#sort_cost").click(function () {
//                sort = "sum";
//                reloadPageSorted()
//            });
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
            $("#mass_process").click(function () {
                console.log("mass process...");
                var arr = [];
                $(".chk:checked").each(function () {
                    console.log("val=" + $(this).val());
                    arr.push($(this).val());
                });
                console.log("arr=" + arr);
                $.post("massprocess", {ids: arr}, function (resp, status) {
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
    <h2><s:message code="payment.list"/></h2>
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
                        <li class="divider"></li>
                        <li><a id="mass_process"><span style="color: blue; font-weight: bold"><s:message code="mass.process"/></span></a></li>
                    </ul>
                </span>
            </th>
            <th id="sort_id" onclick="sort('id');"><s:message code="id"/></th>
            <th id="sort_date"><s:message code="date"/></th>
            <th id="sort_sum"><s:message code="sum"/></th>
            <th id="sort_processed"><s:message code="processed"/></th>
            <th></th>
        </tr>
        <c:forEach var="paym" items="${list}">
            <tr>
                <td><input type="checkbox" class="chk" value="${paym.id}"/></td>
                <td><c:out value="${paym.id}"/></td>
                <td><c:out value="${paym.date}"/></td>
                <td><c:out value="${paym.sum}"/></td>
                <td><c:out value="${paym.processed}"/></td>
                <td>
                    <nobr>
                    <a href="<c:url value='/admin/payment/${paym.id}'/>" class="btn btn-info btn-sm"><s:message code="edit"/></a>&nbsp;
                    <span class="dropdown">
                        <button class="btn btn-danger btn-sm dropdown-toggle" type="button" data-toggle="dropdown"><s:message code="delete"/>
                            <span class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li><a href="#" class="btn btn-default btn-sm"><s:message code="cancel"/></a></li>
                            <li><a href="<c:url value='/admin/payment/delete/${paym.id}'/>" class="btn btn-danger btn-sm"><s:message code="confirm"/></a></li>
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