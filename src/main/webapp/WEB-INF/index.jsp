<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Motorcycle Repair Workshop</title>
</head>
<body>
<div class="default">
    <h1>Motorcycle Repair Workshop</h1>
    <h2>Main Page</h2>
    <div class="flex-container" style="display: flex">
        <div style="width: 25%">
            <div>
                <li><a href="/order/list">All orders list</a></li>

                <li><a href="/order/open">Active orders list</a></li>

            </div>
            <br/>
            <div>
                <li><a href="/parts/list">Parts list</a></li>
            </div>
            <br/>
            <div>
                <li><a href="/service/list">Services list</a></li>
            </div>
        </div>
        <div style="flex-grow: 1">
            <h2>Active orders list</h2>
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
                                <a href="/order/edit/${orders.id}">Edit</a>
                                <c:if test="${orders.active == true}">
                                    <a href="/order/close/${orders.id}">Close order</a>
                                </c:if>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>