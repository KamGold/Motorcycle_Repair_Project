<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="option" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet"/>
    <title>Add Part to Order: ID - ${order.id}</title>
</head>
<body>
<%@include file="../fragments/header.jsp" %>
<div class="default">
    <%--@elvariable id="order" type="pl.KamilGolda.Workshop.model.Order"--%>
    <%--@elvariable id="parts" type="pl.KamilGolda.Workshop.model.Parts"--%>
    <form action="/order/addService" method="post">
        Add Part:
        <select name="pId">
            <c:forEach items="${parts}" var="part">
                <c:if test="${part.stock > 0}">
                    <option value="${part.id}">${part.partName} - ${part.manufacturer}</option>
                    <option:errors id="part" cssClass="error"/>
                </c:if>
            </c:forEach>
        </select>

        <div style="margin-top: 20px">
            <button type="submit" formaction="/order/addParts/${order.id}" value="save">Add to Order</button>
        </div>
    </form>
    <table>
        <thead>
        <th scope="col"> Part Name</th>
        <th scope="col"> Part Manufacturer</th>
        <th scope="col"> Price</th>
        <th scope="col"> Quantity</th>
        </thead>
        <tbody>
        <c:forEach items="${order.parts.stream().distinct().toArray()}" var="parts">
            <tr>
                <th scope="row" align="center">${parts.partName}</th>
                <td align="center">${parts.manufacturer}</td>
                <td align="center">${parts.price}</td>
                <td align="center">${order.parts.stream().filter(p -> p.partName.equals(parts.partName)).count()}</td>
                <td>
                    <a class="button1" href="/order/deletePart/${order.id}/${parts.id}">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a class="button1" style="background-color: red" href="/order/open">Go Back</a>
</div>

</body>