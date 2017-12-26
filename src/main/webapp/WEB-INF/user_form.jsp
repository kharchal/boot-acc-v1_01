<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <jsp:include page="util/imports.jsp"/>
    <script>
        function setLocale(locale) {
            $("#lang").val(locale);
            $("#form").submit();
        }
        $(document).ready(function () {

        });
    </script>
</head>
<body>
<div class="container">

    <div>
        <c:set var="locale" value="${pageContext.response.locale}"/>
        <c:if test="${locale ne 'ru'}" var="not_ru">
        <a href="#" onclick="setLocale('ru')">
            </c:if>
            <s:message code="lang.ru"/>
            <c:if test="${not_ru}">
        </a>
        </c:if>
        |
        <c:if test="${locale ne 'en'}" var="not_en">
        <a href="#" onclick="setLocale('en');">
            </c:if>
            <s:message code="lang.en"/>
            <c:if test="${not_en}">
        </a>
        </c:if>
    </div>
    <h2><s:message code="user.list"/></h2>
    <c:set var="action"><c:url value="/users/save"/></c:set>
    <f:form modelAttribute="user" action="${action}" id="form">
        <input type="hidden" name="lang" id="lang" value="${locale}"/>
    <table class="table">
        <tr>
            <td width="20%">
                <label for="id">
                    <s:message code="id"/>
                </label>
            </td>
            <td width="40%">
                <f:input path="id" readonly="true" cssClass="form-control"/>
            </td>
            <td width="40%">
            </td>
        </tr>
        <tr>
            <td>
                <label for="name">
                    <s:message code="name"/>
                </label>
            </td>
            <td>
                <f:input path="name" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="name" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="age">
                    <s:message code="age"/>
                </label>
            </td>
            <td>
                <f:input path="age" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="age" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="login">
                    <s:message code="login"/>
                </label>
            </td>
            <td>
                <f:input path="login" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="login" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="password">
                    <s:message code="password"/>
                </label>
            </td>
            <td>
                <f:input path="password" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="password" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="email">
                    <s:message code="email"/>
                </label>
            </td>
            <td>
                <f:input path="email" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="email" cssClass="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="address">
                    <s:message code="address"/>
                </label>
            </td>
            <td>
                <f:input path="address" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="address" cssClass="form-error"/>
            </td>
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