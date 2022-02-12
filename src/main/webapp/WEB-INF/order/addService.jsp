<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet"/>
    <title>Add Service to Order: ID - ${order.id}</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
    <%--@elvariable id="order" type="pl.KamilGolda.Workshop.model.Order"--%>
    <%--@elvariable id="service" type="pl.KamilGolda.Workshop.model.Service"--%>
    <form action="/order/addService" method="post">
        Add Service:
        <select name="sId">
            <c:forEach items="${services}" var="service">
                <option value="${service.id}">${service.name}</option>
            </c:forEach>
        </select>
        <div style="margin-top: 20px">
            <button type="submit" formaction="/order/addService/${order.id}" value="save">Add</button>
        </div>
    </form>
    <table>
        <thead>
        <th scope="col"> Service Type</th>
        <th scope="col"> Service Name</th>
        <th scope="col"> price</th>
        </thead>
        <tbody>
        <c:forEach items="${order.services}" var="service">
            <tr>
                <th scope="row" align="center">${service.serviceType.type}</th>
                <td align="center">${service.name}</td>
                <td align="center">${service.price}</td>
                <td>
                    <a class="button1" href="/order/deleteService/${order.id}/${service.id}">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
        <a class="button1" style="background-color: red" href="/">Go Back</a>
</div>
</body>