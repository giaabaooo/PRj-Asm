<%-- 
    Document   : adminRequest
    Created on : Mar 9, 2025, 3:23:44 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Leave Request</title>
        <!-- Sử dụng Custom Tag để tạo đường dẫn CSS -->
        <link href="../css/adminRequest.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar">
            <h1>Employee Leave Management System</h1>
        </div>
        <div class="sidebar">
            <h3>Admin</h3>
            <p class="user-displayname"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <p class="user-displayname"> <c:out value="${sessionScope.user.dept.name}" /></p>
            <ul>
                <li><a href="welcomeAdmin">Welcome</a></li>
                <li><a href="dashboard">Dashboard</a></li>
                <li><a href="employee">Employees</a></li>
                <li><a href="adminRequest">Leave Request</a></li>
                <li><a href="adminManagement">Leave Management</a></li>                
                <li><a href="logout">Sign Out</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="card">
                <h2>Create a Leave Request</h2>
                <form action="adminRequest" method="POST" class="leave-request-form">
                    <div class="form-group">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="Enter the title" required>
                    </div>

                    <div class="form-group">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="from" required>
                    </div>

                    <div class="form-group">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="to" required>
                    </div>

                    <div class="form-group">
                        <label for="reason" class="form-label">Reason</label>
                        <textarea class="form-control" id="reason" name="reason" rows="4" placeholder="Enter the reason for leave..." required></textarea>
                    </div>

                    <c:if test="${not empty successMessage}">
                        <div class="alert alert-success" style="margin-top: 10px; font-size: 14px;">
                            ${successMessage}
                        </div>
                    </c:if>

                    <button type="submit" class="btn-submit">Submit</button>
                </form>
            </div>
        </div>
    </body>

</html>


