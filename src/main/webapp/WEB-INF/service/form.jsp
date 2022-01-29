<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="/css/styles.css" rel="stylesheet"/>
    <title>Add Service</title>
</head>
<body>
<div class="default">
    <%--@elvariable id="service" type="pl.KamilGolda.Workshop.model.Service"--%>
    <form:form method="post" modelAttribute="service">
        <div>
            <label>Service Type: </label>
            <form:select path="type" type="text">
                <form:option value="Engine and gearbox">Engine and gearbox</form:option>
                <form:option value="Braking system">Braking system</form:option>
                <form:option value="Wheels and suspension">Wheels and suspension</form:option>
                <form:option value="Drive">Drive</form:option>
            </form:select>
            <form:errors path="type" cssClass="error"/>
        </div>
        <div>
            <label>Service Name: </label>
            <form:input path="name" type="text"/>
            <form:errors path="name" cssClass="error"/>
        </div>
        <div>
            <label>Price: </label>
            <form:input path="price" type="number"/>
            <form:errors path="price" cssClass="error"/>
        </div>

        <div>
            <input type="submit" value="Save">
        </div>
    </form:form>
    <form action="/">
        <button type="submit">Back to Main Page</button>
    </form>
</div>
</body>
</html>
