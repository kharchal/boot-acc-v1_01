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
            // alert("ok?");
        }
    </script>


</head>
<body>
    <div class="container">
        <jsp:include page="util/header.jsp"/>

        <h2><s:message code="login.page"/></h2>
    <%--<div class="row"><div class="col-xs-12">--%>
        <c:if test="${not empty pageContext.request.getParameter('error')}">
            <div class="alert alert-warning">
                <s:message code="login.error"/>
            </div>
        </c:if>
        <c:if test="${not empty pageContext.request.getParameter('logout')}">
            <div class="alert alert-info">
                <s:message code="logout.success"/>
            </div>
        </c:if>
    <%--</div></div>--%>
    <c:set var="action"><c:url value="/login"/></c:set>
    <form method="post" action="${action}" class="form-inline">
        <%--<div class="row">--%>
            <%--<div class="col-xs-4">--%>
                <label for="log"><s:message code="login"/></label>
                <input type="text" id="log" name="username" value="admin" class="form-control" placeholder="<s:message code="login"/>"/>
            <%--</div>--%>
            <%--<div class="col-xs-4">--%>
                <label for="psw"><s:message code="password"/></label>
                <input type="text" id="psw" name="psw" value="q333" class="form-control" placeholder="<s:message code="password"/>"/>
            <%--</div>--%>
                <input type="hidden" id="password" name="password" readonly="readonly"/>
        <!--<p th:text="${_csrf.parameterName}"/>-->
        <!--<p th:text="${_csrf.token}"/>-->
        <!--<input type="hidden" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>-->
            <%--<div class="col-xs-4">--%>
                <button onclick="encode();" class="btn btn-info"><s:message code="form.send"/></button>
            <%--</div>--%>
        <%--</div>--%>
    </form>

    <a onclick="set();">set</a>
    </div>
</body>
</html>