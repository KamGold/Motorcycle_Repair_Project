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
                <th scope="row" align="center">${service.type}</th>
                <td align="center">${service.name}</td>
                <td align="center">${service.price}</td>
                <td>
                    <a class="button1" href="/service/edit/${service.id}">Edit</a>
                    <a class="button1" href="/service/remove/${service.id}">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <a class="button1" href="/service/add">Add Service</a>
    </div>
</div>
</body>
</html>
