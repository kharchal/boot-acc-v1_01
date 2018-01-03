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
    <style>
        #out {
            color: darkblue;
            border: 1px solid gray;
            border-radius: 5px;
            padding: 10px;
            background-color: beige;
            /*width: 200px;*/
            position: absolute;
            /*top: 200px;*/
            /*left: 220px;*/
            z-index: 1000;
            display: none;
        }
    </style>
    <script>
        var x = [1, 2, 3, 6, 7, 8, 10, 11, 13, 14, 15];

        function foo(id, numb) {
            $(".cust_id").val(id);
            $("#out").hide();
            $("#cust").val(numb);
        }
        $(document).ready(function () {
            var pos = $("#cust").position();
            var hth = $("#cust").height();
//            console.log("y = " + pos.bottom);
//            var x = $("#cust").offsetLeft();
//            console.log("height = " + hth);
            $("#out").css({
                top: pos.top + 34,
                left: pos.left + 15
            });
            $("#unporcess").click(function () {
                console.log("unprocess...");
                $.post("ajax/unprocess", {id: ${not empty payment.id ? paynebt.id : 0}}, function (data, status) {
                    console.log("data: " + data);
                    console.log("status: " + status);
                    location.reload(true);
                })
            });
            $("#out").hide();
            $("#cust").keyup(function () {
                var input = $("#cust").val();
//                console.log("read: " + input);
                $("#out").hide();
                if (input.length >= 2) {
//                    console.log("send: " + input);
                    $.post("ajax/find", {number: input}, function (data) {
//                        console.log(data);
                        data = JSON.parse(data);
                        var out = "";
                        for (var i = 0; i < data.length; i++) {
                            var fnum = data[i].formattedNumber;
                            var num = data[i].number;
                            var ind = num.indexOf(input);
                            var ind2 = ind + input.length;
//                            console.log("ind = " + ind + "; x[ind] = " + x[ind]);
//                            console.log("ind2 = " + ind2 + "; x[ind2] = " + x[ind2]);
                            var pre = fnum.substring(0, x[ind]);
                            var mid = fnum.substring(x[ind], x[ind2]);
                            var post = fnum.substring(x[ind2], x[fnum.length]);
//                            console.log("num = " + num);
//                            console.log("fnum = " + fnum);
//                            console.log("pre = " + pre);
//                            console.log("mid = " + mid);
//                            console.log("post = " + post);
                            var fxnum = pre + "<span style='font-weight: bold; color: indigo;'>" + mid + "</span>" + post;
                            out += "<p><a onclick='foo(" + data[i].id + ", \"" + fnum + "\");'>" + fxnum + "</a></p>";
                        }
//                        console.log("out:" + out);
                        if (out.length > 0) {
                            $("#out").html(out);
                            $("#out").show();
                        } else {
                            $("#out").hide();
                        }
                    });
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
                <label for="cust">
                    <s:message code="customer"/>
                </label>
            </td>
            <td>
                <input id="cust" class="form-control" value="${payment.customer.formattedNumber}"/>
                <input type="hidden" name="cust_id" readonly="true" class="cust_id" value="${payment.customer.id}"/>
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
    <button id="unporcess" class="btn btn-danger">Unprocess</button>
    <jsp:include page="util/footer.jsp"/>
</div>
<div id="out"></div>
</body>
</html>