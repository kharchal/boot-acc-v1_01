<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html lang="en">
<head>
<script>
    var socket = new WebSocket("ws://localhost:8080/acc/app");
    socket.onopen = function () {
        alert("connected!");
    };

    socket.onclose = function (ev) {
        if (ev.wasClean) {
            alert("Closed!");
        } else {
            alert("Error!");
        }
    };

    socket.onmessage  =function (ev) {
        var message = ev.data;
        var text = document.getElementById("output");
        text += text + message;
        document.getElementById("output").value = text;
    }


    function send() {
        var inp = document.getElementById("input").value;
        socket.send(inp);
    };

</script>

</head>
<body>
<div class="container">
    <textarea id="output" ></textarea>
    <input id="input"/>
    <input type="button" onclick="send();" value="Send"/>
</div>
</body>
</html>