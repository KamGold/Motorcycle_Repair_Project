<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="/header.css" rel="stylesheet"/>
<script src="https://kit.fontawesome.com/7991c29e7f.js" crossorigin="anonymous"></script>


<div class="navbar">
    <a href="/" title="Index"><i class="fas fa-cog fa-5x fa-spin" style="color: #FFFFFF"></i></a>
    <div class="dropdown">
        <button class="dropbtn">Orders Menu<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content">
            <a href="/order/open">Active Orders</a>
            <a href="/order/add">Add New Orders</a>
            <sec:authorize access="hasRole('ADMIN')">
                <a href="/order/closed">Closed Orders History</a>
            </sec:authorize>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Services Menu<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content">
            <a href="/service/list">Available Services</a>
            <sec:authorize access="hasRole('SU')">
                <a href="/service/add">Add New Service</a>
            </sec:authorize>
        </div>
    </div>
    <div class="dropdown">
        <button class="dropbtn">Parts Menu<i class="fa fa-caret-down"></i></button>
        <div class="dropdown-content">
            <a href="/parts/list">Parts</a>
            <sec:authorize access="hasAnyRole('SU','ADMIN')">
                <a href="/parts/add">Add New Part to Stock</a>
            </sec:authorize>
        </div>
    </div>
    <sec:authorize access="hasRole('ADMIN')">
        <div class="dropdown">
            <button class="dropbtn">Admin Control Menu<i class="fa fa-caret-down"></i></button>
            <div class="dropdown-content">
                <a href="/admin/users">Users</a>
            </div>
        </div>
    </sec:authorize>
    <a href="/logout" title="Logout" style="position: absolute;right: 25px;"><i
            class="fas fa-solid fa-door-open fa-3x"></i></a>
   <a style="position: absolute;right: 150px;" title="${user.name}"> <i class="fas fa-solid fa-user fa-3x"></i></a>
</div>

