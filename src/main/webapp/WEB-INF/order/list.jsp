<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Orders</title>
</head>
<body>
<div>
    <a href="/">Back to index</a>
    <a href="/order/add">Add new Order</a>
</div>
<table>
    <thead>
    <th scope="col"> Brand</th>
    <th scope="col"> Model</th>
    <th scope="col"> Year</th>
    <th scope="col"> License Plate</th>
    <th scope="col"> Owner Name</th>
    <th scope="col"> Owner Surname</th>
    <th scope="col"> Owner Phone</th>
    </thead>
    <tbody>
    <c:forEach items="${orders}" var="orders">
        <tr>
            <th scope="row" align="center">${orders.brand}</th>
            <td align="center">${orders.model}</td>
            <td align="center">${orders.year}</td>
            <td align="center">${orders.licensePlate}</td>
            <td align="center">${orders.ownerName}</td>
            <td align="center">${orders.ownerSurname}</td>
            <td align="center">${orders.ownerPhone}</td>
            <td>
                <a href="/order/edit/${orders.id}">Edit</a>
                <c:if test="${orders.active == true}">
                    <a href="/order/close/${orders.id}">Close order</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
