<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Parts List</title>
</head>
<body>
<%--@elvariable id="service" type="pl.KamilGolda.Workshop.model.Service"--%>
<%@include file="../fragments/header.jsp" %>
<div class="default">
    <table>
        <thead>
        <th scope="col"> Service Type</th>
        <th scope="col"> Service Name</th>
        <th scope="col"> price</th>
        </thead>
        <tbody>
        <c:forEach items="${service}" var="service">
            <tr>
                <th scope="row" align="center">${service.serviceType.type}</th>
                <td align="center">${service.name}</td>
                <td align="center">${service.price}</td>
                <sec:authorize access="hasRole('ADMIN')">
                <td>
                    <a class="button1" href="/service/edit/${service.id}">Edit</a>
                    <a class="button1" href="/service/remove/${service.id}">Remove</a>
                </td>
                </sec:authorize>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <sec:authorize access="hasAnyRole('ADMIN','SU')">
        <a class="button1" href="/service/add">Add Service</a>
    </sec:authorize>
    <a class="button1" style="background-color: red" href="/">Go Back</a>
</div>
</body>
</html>
