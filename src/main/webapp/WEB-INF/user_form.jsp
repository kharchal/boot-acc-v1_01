<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>User list</title>
    <jsp:include page="util/imports.jsp"/>
    <script src="/acc/static/js/md5.min.js"></script>
    <script>
//        function setLocale(locale) {
//            $("#lang").val(locale);
//            console.log("locale changed.");
//            console.log("dirty=" + dirty);
//            console.log("new locale=" + locale);
//            if (dirty) {
//                console.log("do submit!");
//                alert("submit");
//                $("#cmd").val("change");
//                $("#form").submit();
//            } else {
////                old = document.location.href;
//                old = loc.split("?")[0];
//                var get = old + "?lang=" + locale;
//                console.log("do get @: " + get);
//                alert("get");
//                document.location.href = get;
//            }
//        }
//        var dirty = false;
//        var setDirty = function () {
//            dirty = true;
//            console.log("dirty=" + dirty);
//        }
        function encode() {
            var pass = $("#pass_value").val();
            if (pass == '' || !pass.match("^[A-Za-z]{1}[A-Za-z0-9!@#$%^&*]{2,9}$")) {
                console.log("pass is empty or wrong");
                $("#pass_error").text("pass is empty or wrong");
            } else {
                console.log("password is being encoded...");
                var hash = md5(pass);
                console.log("hash=" + hash);
                $("#password").val(hash);
                alert("ok?");
            }
        }
//        var loc;
        $(document).ready(function () {
//            dirty = false;
//            var curLoc = document.location.href;
//            console.log("href = " + curLoc);
//            if (!curLoc.indexOf('/save') < 0) {
//                loc = curLoc;
//            }
//            console.log("loc = " + curLoc);
//            $("#name").change(setDirty);
//            $("#age").change(setDirty);
//            $("#login").change(setDirty);
//            $("#email").change(setDirty);
//            $("#address").change(setDirty);
        });
    </script>
</head>
<body>
<div class="container">

    <div>
        <%--<c:set var="locale" value="${pageContext.response.locale}"/>--%>
        <%--<c:if test="${locale ne 'ru'}" var="not_ru">--%>
        <%--<a onclick="setLocale('ru')">--%>
            <%--</c:if>--%>
            <%--<s:message code="lang.ru"/>--%>
            <%--<c:if test="${not_ru}">--%>
        <%--</a>--%>
        <%--</c:if>--%>
        <%--|--%>
        <%--<c:if test="${locale ne 'en'}" var="not_en">--%>
        <%--<a onclick="setLocale('en');">--%>
            <%--</c:if>--%>
            <%--<s:message code="lang.en"/>--%>
            <%--<c:if test="${not_en}">--%>
        <%--</a>--%>
        <%--</c:if>--%>
    </div>
    <h2><s:message code="user.list"/></h2>
    <c:set var="action"><c:url value="/users/save"/></c:set>
    <f:form modelAttribute="user" action="${action}" id="form">
        <input type="hidden" name="lang" id="lang" value="${locale}"/>
        <input type="hidden" name="cmd" id="cmd" value="save"/>
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
                <input id="pass_value" class="form-control" pattern="^[A-Za-z]{1}[A-Za-z0-9!@#$%^&*]{2,9}$" required="required"
                       title="start with a letter (3 to 10 symbols long)" placeholder="Enter password"/>
                <input name="password" class="form-control" readonly="true" id="password"/>
            </td>
            <td>
                <f:errors path="password" cssClass="form-error"/>
                <span id="pass_error" class="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="role">
                    <s:message code="role"/>
                </label>
            </td>
            <td>
                <f:input path="role" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="role" cssClass="form-error"/>
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