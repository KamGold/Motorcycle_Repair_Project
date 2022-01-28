<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/css/default.css" rel="stylesheet"/>
    <title>Parts List</title>
</head>
<body>
<div class="default">
    <div>
        <a href="/">Back to Main Page</a>
        <a href="/parts/add">Add new Parts</a>
    </div>
    <table>
        <thead>
        <th scope="col"> Part Name</th>
        <th scope="col"> Manufacturer</th>
        <th scope="col"> Price</th>
        <th scope="col"> Stock</th>
        </thead>
        <tbody>
        <c:forEach items="${parts}" var="parts">
            <tr>
                <th scope="row" align="center">${parts.partName}</th>
                <td align="center">${parts.manufacturer}</td>
                <td align="center">${parts.price}</td>
                <td align="center">${parts.stock}</td>
                <td>
                    <a href="/parts/edit/${parts.id}">Edit</a>
                    <a href="/parts/remove/${parts.id}">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
