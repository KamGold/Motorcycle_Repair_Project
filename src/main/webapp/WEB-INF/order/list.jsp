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
    <a href="/order/add">Add new Order</a>
    <a href="/">Back to index</a>
</div>
<ul>
    <c:forEach items="${orders}" var="order">
        <li>
                ${order.brand}, ${order.model}, ${order.year}, ${order.registrationNumber},${order.ownerName},${order.ownerSurname},${order.ownerPhone}
            <a href="/form/order/edit/${order.id}">Edit</a>
            <a href="/form/order/remove/${order.id}">Remove</a>
        </li>
    </c:forEach>
</ul>
</body>
</html>
