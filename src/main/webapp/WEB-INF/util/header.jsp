<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="row">
    <div class="col-xs-2">
    <c:set var="locale" value="${pageContext.response.locale}"/>
    <c:set var="new_locale" value="${locale eq 'ru' ? 'en' : 'ru'}"/>
    <span class="dropdown">
        <button class="btn btn-default btn-sm dropdown-toggle" type="button" data-toggle="dropdown">
            <s:message code="lang.${locale}"/>
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu">
            <li><a href="?lang=${new_locale}"><s:message code="lang.${new_locale}"/></a></li>
        </ul>
    </span>
    </div>

    <div class="col-xs-2"></div>
    <div class="col-xs-8">
    <a href="<c:url value="/logout"/>"><s:message code="logout"/></a>
     |
    <c:set value="${sessionScope.logged_user}" var="user"/>
    <c:if test="${not empty user}">
        login: <b>${user.login}</b>; name: <b>${user.name}</b>; roles: <b>[
        <c:forEach var="r" items="${user.roles}" varStatus="status">
            <c:if test="${!status.first}">
                ,&nbsp;
            </c:if>
            ${r.value}
        </c:forEach></b>]
    </c:if>
    </div>
</div>
