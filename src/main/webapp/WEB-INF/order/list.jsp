<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Orders</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
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
                        <c:choose>
                            <c:when test="${orders.mechanic.id == user.id || user.roles.contains(roleAdmin) }">
                                <a class="button1" href="/order/edit/${orders.id}">Edit</a>
                            </c:when>
                            <c:when test="${orders.mechanic.id != user.id}">
                                <a class="button1" style="pointer-events: none"
                                   href="/order/edit/${orders.id}">Edit</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <%--@elvariable id="user" type="pl.KamilGolda.Workshop.model.Mechanic"--%>
                            <c:when test="${orders.mechanic.id == user.id || user.roles.contains(roleAdmin) }">
                                <c:if test="${orders.active == true}">
                                    <a class="button1" href="/order/addService/${orders.id}">Add Services</a>
                                </c:if>
                            </c:when>
                            <c:when test="${orders.mechanic.id != user.id}">
                                <a class="button1" style="pointer-events: none"
                                   href="/order/addService/${orders.id}">Add Services</a>
                            </c:when>
                        </c:choose>
                        <c:choose>
                            <c:when test="${orders.mechanic.id == user.id || user.roles.contains(roleAdmin)}">
                                <c:if test="${orders.active == true}">
                                    <a class="button1" href="/order/addParts/${orders.id}">Add Parts</a>
                                </c:if>
                            </c:when>
                            <c:when test="${orders.mechanic.id != user.id}">
                                <a class="button1" style="pointer-events: none" href="/order/addParts/${orders.id}">Add
                                    Parts</a>
                            </c:when>
                        </c:choose>
                            <c:if test="${orders.active == true}">
                                <a class="button1" href="/order/summary/${orders.id}">Summary</a>
                            </c:if>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
