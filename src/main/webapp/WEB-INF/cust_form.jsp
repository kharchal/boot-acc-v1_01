<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <jsp:include page="util/imports.jsp"/>
    <script src="/acc/static/js/md5.min.js"></script>
    <c:set var="pass_error"><s:message code="password.form.error"/></c:set>
    <script>

    </script>
</head>
<body>
<div class="container">

    <h2><s:message code="customer.form"/></h2>
    <c:set var="action"><c:url value="/customer/save"/></c:set>
    <f:form modelAttribute="customer" action="${action}" id="form">
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
                <label for="number">
                    <s:message code="number"/>
                </label>
            </td>
            <td>
                <f:input path="number" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="number" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="active">
                    <s:message code="active"/>
                </label>
            </td>
            <td>
                <input type="checkbox" name="active" ${customer.active ? "checked" : ""} id="active"/>
            </td>
            <td>
                <f:errors path="active" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="balance">
                    <s:message code="balance"/>
                </label>
            </td>
            <td>
                <f:input path="balance" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="balance" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="serv">
                    <s:message code="service.list"/>
                </label>
            </td>
            <td>
                <table class="table table-condenced">
                    <c:forEach items="${servList}" var="serv">
                        <tr>
                            <td>
                                <input type="checkbox" name="serv" value="${serv.id}" ${customer.serviceList.contains(serv) ? "checked" : ""}/>
                            </td>
                            <td>
                                ${serv.cost}
                            </td>
                            <td>
                                ${serv.name}
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2" align="right">
                <input class="btn btn-info" type="submit" value="<s:message code="form.save"/>"/>
            </td>
            <td></td>
        </tr>
    </table>
    </f:form>
    <jsp:include page="util/footer.jsp"/>
</div>
</body>
</html>