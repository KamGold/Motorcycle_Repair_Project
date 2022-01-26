<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <style>
        .error {
            color: orangered;
        }
    </style>
    <title>Add order</title>
</head>
<body>
<%--@elvariable id="order" type="pl.KamilGolda.Workshop.model.Order"--%>
<form:form method="post" modelAttribute="order">
    <div>
        <label>Brand: </label>
        <form:input path="brand" type="text"/>
        <form:errors path="brand" cssClass="error"/>
    </div>
    <div>
        <label>Model: </label>
        <form:input path="model" type="text"/>
        <form:errors path="model" cssClass="error"/>
    </div>
    <div>
        <label>Year: </label>
        <form:input path="year" type="number"/>
        <form:errors path="year" cssClass="error"/>
    </div>
    <div>
        <label>Registration number: </label>
        <form:input path="licensePlate" type="text"/>
        <form:errors path="licensePlate" cssClass="error"/>
    </div>
    <div>
        <label>Owner Name: </label>
        <form:input path="ownerName" type="text"/>
        <form:errors path="ownerName" cssClass="error"/>
    </div>
    <div>
        <label>Owner Surname: </label>
        <form:input path="ownerSurname" type="text"/>
        <form:errors path="ownerSurname" cssClass="error"/>
    </div>
    <div>
        <label>Owner Phone: </label>
        <form:input path="ownerPhone" type="tel" pattern="[0-9]{9}"/>
        <small>Format: 123456789</small>
        <form:errors path="ownerPhone" cssClass="error"/>
    </div>
    <div>
        <label>Assign Mechanic: </label>
        <form:select path="mechanic.id" items="${mechanics}" itemLabel="Name" itemValue="id"/>
        <form:errors path="mechanic" cssClass="error"/>
    </div>
    <div>
        <input type="submit" value="Save">
    </div>
</form:form>
<form action="/order/list">
    <button type="submit">Click me</button>
</form>
</body>
</html>
