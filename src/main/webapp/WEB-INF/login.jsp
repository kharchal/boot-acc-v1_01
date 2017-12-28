<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en" >
<head>
    <meta charset="UTF-8"/>
    <title>LOGIN PAGE</title>
    <jsp:include page="util/imports.jsp"/>
    <script src="/acc/static/js/md5.min.js"></script>
    <script>
        function setUser() {
            $("#log").val("user");
            $("#psw").val("q123");
        }
        function setGuest() {
            $("#log").val("guest");
            $("#psw").val("guest");
        }
        function setAdmin() {
            $("#log").val("admin");
            $("#psw").val("q333");
        }
        function encode() {
            console.log("encoding...");
            var psw = $("#psw").val();
            console.log("psw = " + psw);
            var hash = md5(psw);
            console.log("hash = " + hash);
            $("#password").val(hash);
//            alert("ok?");
        }
    </script>


</head>
<body>
    <div class="container">
        <jsp:include page="util/header.jsp"/>

        <h2><s:message code="login.page"/></h2>
        <c:if test="${null ne pageContext.request.getParameter('error')}">
            <div class="alert alert-danger">
                <s:message code="login.error"/>
            </div>
        </c:if>
        <c:if test="${null ne pageContext.request.getParameter('logout')}">
            <div class="alert alert-info">
                <s:message code="logout.success"/>
            </div>
        </c:if>
    <c:set var="action"><c:url value="/login"/></c:set>
    <form method="post" action="${action}" class="form-inline">
                <label for="log"><s:message code="login"/>:</label>
                <input type="text" id="log" name="username" class="form-control" placeholder="<s:message code="login"/>"/>
                <label for="psw"><s:message code="password"/>:</label>
                <input type="text" id="psw" name="psw" class="form-control" placeholder="<s:message code="password"/>"/>
                <input type="hidden" id="password" name="password" readonly="readonly"/>
        <!--<p th:text="${_csrf.parameterName}"/>-->
        <!--<p th:text="${_csrf.token}"/>-->
        <!--<input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>-->
                <button onclick="encode();" class="btn btn-info"><s:message code="form.send"/></button>
                <a href="<c:url value="/register"/>" class="btn btn-default"><s:message code="form.register"/></a>
    </form>
    <div>
        <hr>
        <a onclick="setUser();">as user</a> |
        <a onclick="setAdmin();">as admin</a> |
        <a onclick="setGuest();">as guest</a>
    </div>
    </div>
</body>
</html>