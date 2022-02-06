<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<link href="/styles.css" rel="stylesheet" type="text/css"/>
<script src="https://kit.fontawesome.com/7991c29e7f.js" crossorigin="anonymous"></script>

<header>
    <h1 style="text-align: center">Motorcycle Repair Workshop</h1>
    <span style="display: inline-block"><a href="/"><i class="fas fa-cog fa-5x fa-spin" style="color: #FFFFFF"></i></a></span>
    <span style="display: inline-block"> <ul class="nav">
            <li><a class="button_header" href="/order/closed">Orders history</a></li>
            <li><a class="button_header" href="/parts/list">Parts</a></li>
            <li><a class="button_header" href="/service/list">Services</a></li>
        </ul>
    </span>
</header>