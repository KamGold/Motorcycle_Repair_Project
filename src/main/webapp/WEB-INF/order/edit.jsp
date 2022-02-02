<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet"/>
    <title>Edit Order ID ${order.id}</title>
</head>
<body>
<div class="default">
    <%--@elvariable id="order" type="pl.KamilGolda.Workshop.model.Order"--%>
    <%--@elvariable id="mechanics" type="pl.KamilGolda.Workshop.model.Mechanic"--%>
    <%--@elvariable id="parts" type="pl.KamilGolda.Workshop.model.Parts"--%>
    <%--@elvariable id="services" type="pl.KamilGolda.Workshop.model.Service"--%>
    <form:form action="/order/edit" method="post" modelAttribute="order">
        <form:hidden path="id"/>
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
            <small>Format: 123-456-789</small>
            <form:errors path="ownerPhone" cssClass="error"/>
        </div>
        <div>
            <label>Assign Mechanic: </label>
            <form:select path="mechanic.id" items="${mechanics}" itemLabel="Name" itemValue="id"/>
            <form:errors path="mechanic" cssClass="error"/>
        </div>
        <div>
            <label>Active: </label>
            <form:checkbox path="active" item="${order.active}"/>
            <form:errors path="active" cssClass="error"/>
        </div>
        <div>
            <c:if test="${order.active == true}">
                <div>
                    <label>Add Parts : </label>
                    <form:select path="parts" items="${parts}" itemLabel="partName" itemValue="id" multiple="true"/>
                    <form:errors path="parts" cssClass="error"/>
                </div>
                <div>
                    <label>Add Service: </label>
                    <form:select path="services" items="${services}" itemLabel="name" itemValue="id" multiple="true"/>
                    <form:errors path="services" cssClass="error"/>
                </div>
            </c:if>
        </div>
        <div style="margin-top: 20px">
            <button type="submit" formaction="/order/edit" value="Update">Update</button>
            <span style="margin-left: 10%"><button type="submit" formaction="/order/summary/${order.id}"
                                                   value="Summary order">Summary Order</button></span>
        </div>
    </form:form>
    <div style="margin-top: 40px">
        <form action="/">
            <button style="background-color: red;" type="submit">Back to Main Page</button>
        </form>
    </div>
</div>
</body>
</html>
