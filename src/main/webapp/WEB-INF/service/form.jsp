<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Add Service</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
    <%--@elvariable id="service" type="pl.KamilGolda.Workshop.model.Service"--%>
    <form:form method="post" modelAttribute="service">
        <div>
            <label>Service Type: </label>
            <form:select path="serviceType.id" items="${serviceType}" itemLabel="type" itemValue="id"/>
            <form:errors path="serviceType" cssClass="error"/>
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
            <button type="submit" formaction="/service/add" value="Save">Save</button>
        </div>
    </form:form>
        <a class="button1" style="background-color: red" href="/">Go Back</a>
</div>
</body>
</html>
