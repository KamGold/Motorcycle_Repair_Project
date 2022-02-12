<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Finalize Order ID ${order.id}</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<%--@elvariable id="order" type="pl.KamilGolda.Workshop.model.Order"--%>
<%--@elvariable id="parts" type="pl.KamilGolda.Workshop.model.Parts"--%>
<%--@elvariable id="services" type="pl.KamilGolda.Workshop.model.Service"--%>
<div class="default">
    <h2>Vehicle Details</h2>
    <table style="width: 75%">
        <thead>
        <tr>
            <th> Brand</th>
            <th> Model</th>
            <th> Year</th>
            <th> License Plate</th>
            <th> Owner Name</th>
            <th> Owner Surname</th>
            <th> Owner Phone</th>
            <th> Assigned Mechanic</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${order.brand}</td>
            <td>${order.model}</td>
            <td>${order.year}</td>
            <td>${order.licensePlate}</td>
            <td>${order.ownerName}</td>
            <td>${order.ownerSurname}</td>
            <td>${order.ownerPhone}</td>
            <td>${order.mechanic.name}</td>
        </tr>
        </tbody>
    </table>
    <div class="flex-container" style="display: flex">
        <div style="width: 35%">
            <h3>Used parts</h3>
            <table>
                <thead>
                <th scope="col">Part Name</th>
                <th scope="col">Manufacturer</th>
                <th scope="col">Price</th>
                </thead>
                <tbody>
                <c:forEach items="${order.parts}" var="parts">
                    <tr>
                        <td>${parts.partName}</td>
                        <td>${parts.manufacturer}</td>
                        <td>${parts.price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3> Cost of parts used : ${partsTotalCost}</h3>
        </div>
        <div style="flex-grow: 1">
            <h3>Services done</h3>
            <table>
                <thead>
                <th scope="col">Service type</th>
                <th scope="col">Service name</th>
                <th scope="col">Price</th>
                </thead>
                <tbody>
                <c:forEach items="${order.services}" var="service">
                    <tr>
                        <td>${service.serviceType.type}</td>
                        <td>${service.name}</td>
                        <td>${service.price}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <h3> Cost of parts used : ${servicesTotalCost}</h3>
        </div>
    </div>
    <div><h2>Order Total Cost : ${orderTotalCost}</h2></div>
    <div>
        <form:form modelAttribute="order" method="post">
            <form:hidden path="id"/>
            <form:hidden path="brand"/>
            <form:hidden path="model"/>
            <form:hidden path="year"/>
            <form:hidden path="licensePlate"/>
            <form:hidden path="ownerName"/>
            <form:hidden path="ownerSurname"/>
            <form:hidden path="ownerPhone"/>
            <form:hidden path="active"/>
            <form:hidden path="mechanic"/>
            <form:hidden path="services"/>
            <form:hidden path="parts"/>

        <a class="button1" style="display: inline-block;background-color: red" href="/">Back to Main Page</a>
<%--        <a class="button1" style="display: inline-block; margin-left: 5%" href="/order/summary">Close Order</a>--%>
        <button type="submit" formaction="/order/summary" style="display: inline-block; margin-left: 5%" value="Save">Close Order</button>
        </form:form>
    </div>
</div>
</body>
</html>
