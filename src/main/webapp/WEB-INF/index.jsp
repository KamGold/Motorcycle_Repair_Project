<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <script src="https://kit.fontawesome.com/7991c29e7f.js" crossorigin="anonymous"></script>
    <title>Motorcycle Repair Workshop</title>
</head>
<body>
<%@include file="fragments/header.jsp" %>
<div class="default">
    <h1 style="text-align: center">Main Page</h1>
    <div style="margin: auto">
        <h2>Active orders</h2>
        <table>
            <thead>
            <th scope="col"> Brand</th>
            <th scope="col"> Model</th>
            <th scope="col"> Year</th>
            <th scope="col"> License Plate</th>
            <th scope="col"> Owner Name</th>
            <th scope="col"> Owner Surname</th>
            <th scope="col"> Owner Phone</th>
            <th scope="col"> Assigned Mechanic</th>
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
                    <td align="center">${orders.mechanic.name}</td>
                    <td>
                        <div>
                            <a class="button1" href="/order/edit/${orders.id}">Edit</a>
                            <c:if test="${orders.active == true}">
                                <a class="button1" href="/order/addService/${orders.id}">Add Services</a>
                            </c:if>
                            <c:if test="${orders.active == true}">
                                <a class="button1" href="/order/addParts/${orders.id}">Add Parts</a>
                            </c:if>
                            <c:if test="${orders.active == true}">
                                <a class="button1" href="/order/close/${orders.id}">Close order</a>
                            </c:if>
                        </div>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>