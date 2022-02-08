<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="/header.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/7991c29e7f.js" crossorigin="anonymous"></script>


<div class="navbar">
    <a href="/"><i class="fas fa-cog fa-5x fa-spin" style="color: #FFFFFF"></i></a>
    <div class="dropdown">
        <button class="dropbtn">Orders Menu<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content">
            <a href="/order/open">Active Orders</a>
            <a href="/order/add">Add New Orders</a>
            <a href="/order/closed">Closed Orders History</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Services Menu<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content">
            <a href="/service/list">Available Services</a>
            <a href="/service/add">Add New Service</a>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Parts Menu<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content">
            <a href="/parts/list">Parts</a>
            <a href="/parts/add">Add New Part to Stock</a>
        </div>
    </div>

</div>
</div>
