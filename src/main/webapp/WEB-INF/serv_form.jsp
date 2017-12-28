<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <title>Service form</title>
    <jsp:include page="util/imports.jsp"/>
    <script src="/acc/static/js/md5.min.js"></script>
    <%--<c:set var="pass_error"><s:message code="password.form.error"/></c:set>--%>
    <script>
        <%--function encode() {--%>
            <%--if ($("#psw_change").is(":checked")) {--%>
                <%--var pass = $("#pass_value").val();--%>
                <%--var conf = $("#pass_conf").val();--%>
                <%--if (pass != conf) {--%>
                    <%--console.log("passwords do not match!");--%>
                    <%--$("#pass_error").text("match error");--%>
                    <%--return false;--%>
                <%--}--%>
                <%--if (pass == '' || !pass.match("^[A-Za-z]{1}[A-Za-z0-9!@#$%^&*]{2,9}$")) {--%>
                    <%--console.log("pass is empty or wrong");--%>
                    <%--$("#pass_error").text("${pass_error}");--%>
                    <%--return false;--%>
                <%--} else {--%>
                    <%--console.log("password is being encoded...");--%>
                    <%--var hash = md5(pass);--%>
                    <%--console.log("hash=" + hash);--%>
                    <%--$("#password").val(hash);--%>
    <%--//                alert("ok?");--%>
                <%--}--%>
            <%--}--%>
        <%--}--%>
//        $(document).ready(function () {
//            $("#psw_change").change(function () {
//                console.log("0");
//                if ($("#psw_change").is(":checked")) {
//                    $("#pass_value").prop("disabled", false);
//                    $("#pass_conf").prop("disabled", false);
//                    console.log("+");
//                } else {
//                    $("#pass_value").prop("disabled", true);
//                    $("#pass_conf").prop("disabled", true);
//                    console.log("-");
//                }
//            });
//        });
    </script>
</head>
<body>
<div class="container">

    <h2><s:message code="user.list"/></h2>
    <c:set var="action"><c:url value="/service/save"/></c:set>
    <f:form modelAttribute="service" action="${action}" id="form">
        <%--<input type="hidden" name="lang" id="lang" value="${locale}"/>--%>
        <%--<input type="hidden" name="cmd" id="cmd" value="save"/>--%>
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
                <label for="cost">
                    <s:message code="cost"/>
                </label>
            </td>
            <td>
                <f:input path="cost" cssClass="form-control"/>
            </td>
            <td>
                <f:errors path="cost" cssClass="form-error"/>
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