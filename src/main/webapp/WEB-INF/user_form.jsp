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
        function encode() {
            if ($("#psw_change").is(":checked")) {
                var pass = $("#pass_value").val();
                var conf = $("#pass_conf").val();
                if (pass != conf) {
                    console.log("passwords do not match!");
                    $("#pass_error").text("match error");
                    return false;
                }
                if (pass == '' || !pass.match("^[A-Za-z]{1}[A-Za-z0-9!@#$%^&*]{2,9}$")) {
                    console.log("pass is empty or wrong");
                    $("#pass_error").text("${pass_error}");
                    return false;
                } else {
                    console.log("password is being encoded...");
                    var hash = md5(pass);
                    console.log("hash=" + hash);
                    $("#password").val(hash);
    //                alert("ok?");
                }
            }
        }
        $(document).ready(function () {
            $("#psw_change").change(function () {
                console.log("0");
                if ($("#psw_change").is(":checked")) {
                    $("#pass_value").prop("disabled", false);
                    $("#pass_conf").prop("disabled", false);
                    console.log("+");
                } else {
                    $("#pass_value").prop("disabled", true);
                    $("#pass_conf").prop("disabled", true);
                    console.log("-");
                }
            });
        });
    </script>
</head>
<body>
<div class="container">

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
                <label for="pass_value">
                    <nobr>
                        <s:message code="password"/>
                        <input type="checkbox" id="psw_change" name="psw_change"/>
                    </nobr>
                </label>
            </td>
            <td>
                <input id="pass_value" class="form-control" pattern="^[A-Za-z]{1}[A-Za-z0-9!@#$%^&*]{2,9}$" required="required"
                       title="start with a letter (3 to 10 symbols long)" placeholder="Enter password" disabled="disabled"/>
                <input id="pass_conf" class="form-control" pattern="^[A-Za-z]{1}[A-Za-z0-9!@#$%^&*]{2,9}$" required="required"
                       title="start with a letter (3 to 10 symbols long)" placeholder="Confirm password" disabled="disabled"/>
                <input type="hidden" name="password" class="form-control" readonly="true" id="password"/>
                <%--<f:input path="password" cssClass="form-control" readonly="true"/>--%>
            </td>
            <td>
                <f:errors path="password" cssClass="form-error"/>
                <span id="pass_error" class="form-error"/>
            </td>
        </tr>
        <tr>
            <td>
                <label for="roles">
                    <s:message code="role"/>
                </label>
            </td>
            <td>
                <%--<c:out value="${user.roles}"/><br>--%>
                <f:select path="roles" multiple="multiple" size="3" cssClass="form-control">
                        <c:forEach items="${rolesList}" var="r">
                            <option value="${r.id}" ${user.roles.contains(r) ? "selected" : ""}>
                                <c:out value="${r.value}"/>
                            </option>
                        </c:forEach>
                </f:select>
            </td>
            <td>
            </td>
        </tr>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<label for="rolex.id">--%>
                    <%--<s:message code="rolex"/>--%>
                <%--</label>--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<f:select path="rolex.id" items="${roles}" cssClass="form-control"/>--%>
            <%--</td>--%>
            <%--<td></td>--%>
        <%--</tr>--%>
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