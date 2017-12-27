<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <c:set var="locale" value="${pageContext.response.locale}"/>
    <c:if test="${locale ne 'ru'}" var="not_ru">
        <a href="?lang=ru">
    </c:if>
        <s:message code="lang.ru"/>
    <c:if test="${not_ru}">
        </a>
    </c:if>
    |
    <c:if test="${locale ne 'en'}" var="not_en">
        <a href="?lang=en">
    </c:if>
        <s:message code="lang.en"/>
    <c:if test="${not_en}">
        </a>
    </c:if>
     |
    <a href="<c:url value="/logout"/>"><s:message code="logout"/></a>
     |
    <c:set value="${sessionScope.logged_user}" var="user"/>
    <c:if test="${not empty user}">
      login: ${user.login}; name: ${user.name}; role: ${user.role}
    </c:if>

</div>
