<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Payment form</title>
    <jsp:include page="util/imports.jsp"/>
    <script src="/acc/static/js/md5.min.js"></script>
    <c:set var="pass_error"><s:message code="password.form.error"/></c:set>
    <script>
        $(document).ready(function () {
            $("#cust").keyup(function () {
                var input = $("#cust").val();
                if (input.length >= 2) {
                    $.get("ajax/find");
                }
            })
        });
    </script>
</head>
<body>
<div class="container">

    <h2><s:message code="user.list"/></h2>
    <c:set var="action"><c:url value="/admin/payment/save"/></c:set>
    <f:form modelAttribute="payment" action="${action}" id="form">

    <table class="table">
        <tr>
            <td width="10%">
                <label for="id">
                    <s:message code="id"/>
                </label>
            </td>
            <td width="40%">
                <f:input path="id" readonly="true" cssClass="form-control"/>
            </td>
            <td width="50%">
            </td>
        </tr>
        <tr>
            <td>
                <label for="date">
                    <s:message code="date"/>
                </label>
            </td>
            <td>
                <f:input path="date" cssClass="form-control" readonly="true" />
                <%--formatDate="yyyy-MM-dd'T'hh:mm:ss'Z'"/>--%>
                <%--@DateTimeFormat(pattern="yyyy-MM-dd'T'hh:mm:ss'Z'") Date sessionEnd--%>
                <%--<input id="date" value="${payment.date}" class="form-control" readonly/>--%>
            </td>
            <td>
                <f:errors path="date" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="customer.id">
                    <s:message code="customer"/>
                </label>
            </td>
            <td>
                <input id="cust" class="form-control"/>
                <f:input path="customer.id" readonly="true"/>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <label for="sum">
                    <s:message code="sum"/>
                </label>
            </td>
            <td>
                <f:input path="sum" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="sum" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="processed">
                    <s:message code="processed"/>
                </label>
            </td>
            <td>
                <f:input path="processed" cssClass="form-control" readonly="true"/>
                <%--<input id="processed" value="${payment.processed}" class="form-control" readonly/>--%>
            </td>
            <td>
                <f:errors path="processed" cssClass="form-error"/>
            </td>
        </tr>

        <tr>
            <td colspan="2" align="right">
                <input class="btn btn-info" type="submit" value="<s:message code="form.save"/>" onclick="encode();"/>
            </td>
            <td></td>
        </tr>
    </table>
    </f:form>
    <jsp:include page="util/footer.jsp"/>
</div>
</body>
</html>