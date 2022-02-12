<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Add part</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
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
            <button type="submit" formaction="/parts/add" value="Save">Save</button>
        </div>
    </form:form>
        <a class="button1" style="background-color: red" href="/">Go Back</a>
</div>
</body>
</html>
