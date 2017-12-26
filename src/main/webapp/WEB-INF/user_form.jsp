<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <style>
        .red {
            color: red;
            font-size: smaller;
        }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        function setLocale(locale) {
            $("#lang").val(locale);
            $("#form").submit();
        }
        $(document).ready(function () {
//            $("#");
        });
    </script>
</head>
<body>
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
    <table cellpadding="5">
        <tr>
            <td>
                <label for="id">
                    <s:message code="id"/>
                </label>
            </td>
            <td>
                <f:input path="id" readonly="true"/>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
                <label for="name">
                    <s:message code="name"/>
                </label>
            </td>
            <td>
                <f:input path="name"/>
            </td>
            <td>
                <f:errors path="name" cssClass="red"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="age">
                    <s:message code="age"/>
                </label>
            </td>
            <td>
                <f:input path="age"/>
            </td>
            <td>
                <f:errors path="age" cssClass="red"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" value="<s:message code="form.save"/>"/>
            </td>
        </tr>
    </table>
    </f:form>
    <jsp:include page="util/footer.jsp"/>
</body>
</html>