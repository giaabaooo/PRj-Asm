<%-- 
    Document   : adminManagement
    Created on : Mar 17, 2025, 2:52:43 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Leave Request</title>
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
            <li><a href="#">Change Password</a></li>
            <li><a href="logout">Sign Out</a></li>
        </ul>
    </div>
    <div class="content">
        <div class="card">
            <h4>History</h4>
            <!-- Search Form -->
            <div class="department-info">
                <label>Department:</label>
                <span>${sessionScope.user.dept.name}</span>
            </div>

            <!-- Table -->
            <table>
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>Title</th>
                        <th>Reason</th>
                        <th>From</th>
                        <th>To</th>
                        <th>Created By</th>
                        <th>Created Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${requestScope.leaves}" var="l" varStatus="status">
                    <tr>
                       
                    <td><c:out value="${l.id}" /></td>
                    <td><c:out value="${l.title}" /></td>
                    <td><c:out value="${l.reason}" /></td>
                    <td><c:out value="${l.from}" /></td>
                    <td><c:out value="${l.to}" /></td>
                    <td><c:out value="${l.createdby.displayname}" /></td>
                    <td><c:out value="${l.createddate}" /></td>
                    <td>
                    <c:out value="${r.status eq 0 ? 'In Progress' : (r.status eq 1 ? 'Rejected' : 'Accepted')}" />
                    </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty requestScope.requests}">
                    <tr>
                        <td colspan="8" style="text-align: center;">No leave requests available.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
