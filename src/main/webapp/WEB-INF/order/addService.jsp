<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet"/>
    <title>Edit Order ID ${order.id}</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
    <%--@elvariable id="order" type="pl.KamilGolda.Workshop.model.Order"--%>
    <%--@elvariable id="service" type="pl.KamilGolda.Workshop.model.Service"--%>
    <form:form action="/order/addService" method="post" modelAttribute="service">
        <form:hidden path="id"/>
        <form:hidden path="type"/>
        <form:hidden path="price"/>
        <form:select path="name" items="${services}" itemLabel="name" itemValue="id"/>
        <form:errors path="name" cssClass="error"/>
        <div style="margin-top: 20px">
            <button type="submit" formaction="/order/addService" value="Update">Update</button>
        </div>
    </form:form>
    <table>
        <thead>
        <th scope="col"> Service Type</th>
        <th scope="col"> Service Name</th>
        <th scope="col"> price</th>
        </thead>
        <tbody>
        <c:forEach items="${order.services}" var="service">
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
</div>
</body>