<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>    <title>Add order</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
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
            <form:input path="ownerPhone" type="tel" pattern="[0-9]{3}?-[0-9]{3}?-[0-9]{3}"/>
            <form:errors path="ownerPhone" cssClass="error"/>
        </div>
        <div>
            <label>Assign Mechanic: </label>
            <form:select path="mechanic.id" items="${mechanics}" itemLabel="Name" itemValue="id"/>
            <form:errors path="mechanic" cssClass="error"/>
        </div>
        <div>
            <button type="submit" formaction="/order/add" value="Save">Save</button>
        </div>
    </form:form>
    <form action="/order/list">
        <button class="button1" type="submit">Back to Main Page</button>
    </form>
</div>
</body>
</html>
