<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <link href="/styles.css" rel="stylesheet"/>
    <title>User List</title>
</head>
<body>
<div class="default">
    <sec:authorize access="isAuthenticated()"><%--@elvariable id="role" type="pl.KamilGolda.Workshop.security.Role"--%>
        <%--@elvariable id="user" type="pl.KamilGolda.Workshop.model.Mechanic"--%>
        <c:forEach items="${users}" var="user">
            <div>Name:${user.name} Login:${user.login}</div>
            </br>
        </c:forEach>
    </sec:authorize>
    <a class="button1" style="background-color: red" href="/">Go Back</a>
</div>
</body>