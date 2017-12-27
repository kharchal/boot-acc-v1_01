<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <hr>
    <a href="<c:url value='/'/>"><s:message code="home"/></a> |
    <a href="<c:url value='/users/'/>"><s:message code="user.list"/></a> |
    <a href="<c:url value='new'/>"><s:message code="new"/></a> |
    <a href="<c:url value='/users/init'/>"><s:message code="init"/></a>
</div>
