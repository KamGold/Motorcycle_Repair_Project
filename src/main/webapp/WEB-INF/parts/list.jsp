<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="/styles.css" rel="stylesheet" type="text/css"/>
    <title>Parts List</title>
</head>
<body>
<div class="default">
    <div>
        <a class="button1" href="/">Back to Main Page</a>
        <a class="button1" href="/parts/add">Add new Parts</a>
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
                    <a class="button1" href="/parts/edit/${parts.id}">Edit</a>
                    <a class="button1" href="/parts/remove/${parts.id}">Remove</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
