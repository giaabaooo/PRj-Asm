<%-- 
    Document   : welcomeAd
    Created on : Mar 11, 2025, 1:32:57 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome</title>
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar">
            <h1>Employee Leave Management System</h1>
        </div>
        <div class="sidebar">
            <h3>Boss</h3>
            <p class="user-displayname"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <p class="user-displayname"><c:out value="${sessionScope.user.dept.name}" /></p>
        <ul>
            <li><a href="welcomeBoss">Welcome</a></li>
            <li><a href="dashboard">Dashboard</a></li>
            <li><a href="employee">Employees</a></li>          
            <li><a href="historyRequest">Leave Management</a></li>
            <li><a href="#">Change Password</a></li>
            <li><a href="logout">Sign Out</a></li>
        </ul>
    </div>

    <div class="content">
        <div class="card">
            <h4>Hello,<strong><c:out value="${sessionScope.user.displayname}" /></strong>!</h4>
            <p>Welcome to the Employee Leave Management System. Please explore your options in the sidebar.</p>
        </div>
    </div>
</body>
</html>
