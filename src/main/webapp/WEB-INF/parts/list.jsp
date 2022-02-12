<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <script src="https://kit.fontawesome.com/7991c29e7f.js" crossorigin="anonymous"></script>
    <title>Parts List</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">

    <table>
        <thead>
        <th scope="col"> Part Name</th>
        <th scope="col"> Manufacturer</th>
        <th scope="col"> Price</th>
        <th scope="col"> Stock</th>
        </thead>
        <tbody>
        <c:forEach items="${parts}" var="parts">
            <tr>
                <th scope="row" align="center">${parts.partName}</th>
                <td align="center">${parts.manufacturer}</td>
                <td align="center">${parts.price}</td>
                <td align="center">${parts.stock}</td>
                <td>
                    <sec:authorize access="hasAnyRole('ADMIN','SU')">
                        <a class="button1" href="/parts/edit/${parts.id}">Edit</a>
                        <a class="button1" href="/parts/remove/${parts.id}">Remove</a>
                    </sec:authorize>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <sec:authorize access="hasAnyRole('ADMIN','SU')">
        <a class="button1" href="/parts/add">Add New Part</a>
    </sec:authorize>
    <a class="button1" style="background-color: red" href="/">Go Back</a>
</div>

</body>
</html>
