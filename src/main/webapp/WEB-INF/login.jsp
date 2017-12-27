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
        function set() {
            $("#log").val("user");
            $("#psw").val("46bf36a7193438f81fccc9c4bcc8343e");
        }
        function encode() {
            console.log("encoding...");
            var psw = $("#psw").val();
            console.log("psw = " + psw);
            var hash = md5(psw);
            console.log("hash = " + hash);
            $("#password").val(hash);
            alert("ok?");
        }
    </script>


</head>
<body>
    <div class="container">
        <jsp:include page="util/header.jsp"/>

        <h2><s:message code="login.page"/></h2>

    <c:if test="${pageContext.request.getParameter('error') ne null}"><span class="form-error">Authentication Error!</span></c:if>
    <c:if test="${pageContext.request.getParameter('logout') ne null}"><span class="form-success">Logout is done!</span></c:if>
    <c:set var="action"><c:url value="/login"/></c:set>
    <form method="post" action="${action}">
        <input type="text" id="log" name="username" value="admin" class="form-control" placeholder="<s:message code="login"/>"/>
        <input type="text" id="psw" name="psw" value="123" class="form-control" placeholder="<s:message code="password"/>"/>
        <input type="text" id="password" name="password" readonly="readonly"/>
        <!--<p th:text="${_csrf.parameterName}"/>-->
        <!--<p th:text="${_csrf.token}"/>-->
        <!--<input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>-->
        <button onclick="encode();" class="btn btn-info"><s:message code="form.send"/></button>
    </form>

    <a onclick="set();">set</a>
    </div>
</body>
</html>