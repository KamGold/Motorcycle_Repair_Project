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
    <title>Add part</title>
</head>
<body>
<%--@elvariable id="parts" type="pl.KamilGolda.Workshop.model.Parts"--%>
<form:form method="post" modelAttribute="parts">
    <div>
        <label>Part Name: </label>
        <form:input path="partName" type="text"/>
        <form:errors path="partName" cssClass="error"/>
    </div>
    <div>
        <label>Manufacturer: </label>
        <form:input path="manufacturer" type="text"/>
        <form:errors path="manufacturer" cssClass="error"/>
    </div>
    <div>
        <label>Price: </label>
        <form:input path="price" type="number" step="0.01"/>
        <form:errors path="price" cssClass="error"/>
    </div>
    <div>
        <label>Quantity: </label>
        <form:input path="stock" type="text"/>
        <form:errors path="stock" cssClass="error"/>
    </div>
    <div>
        <input type="submit" value="Save">
    </div>
</form:form>
<form action="/">
    <button type="submit">Back to Main Page</button>
</form>
</body>
</html>
