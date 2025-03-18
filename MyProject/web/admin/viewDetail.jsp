<%-- 
    Document   : viewDetail
    Created on : Mar 18, 2025, 7:25:27 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Detail</title>
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
        <!-- Content -->
        <div class="content">
            <h2>Request Detail</h2>
            <div class="card">
                <p><strong>Title:</strong> <c:out value="${requestDetail.title}" /></p>
                <p><strong>Reason:</strong> <c:out value="${requestDetail.reason}" /></p>
                <p><strong>From:</strong> <c:out value="${requestDetail.from}" /></p>
                <p><strong>To:</strong> <c:out value="${requestDetail.to}" /></p>
                <p><strong>Created By:</strong> <c:out value="${requestDetail.createdby.displayname}" /></p>
                <p><strong>Created Date:</strong> <c:out value="${requestDetail.createddate}" /></p>
                <p><strong>Status:</strong>
                    <c:choose>
                        <c:when test="${requestDetail.status == 0}">In Progress</c:when>
                        <c:when test="${requestDetail.status == 1}">Rejected</c:when>
                        <c:otherwise>Accepted</c:otherwise>
                    </c:choose>
                </p>
                <form action="/admin/ApproveRejectRequest" method="POST">
                    <input type="hidden" name="rid" value="${requestDetail.id}">
                    <button type="submit" name="status" value="2" class="btn btn-success">Accept</button>
                    <button type="submit" name="status" value="1" class="btn btn-danger">Reject</button>
                </form>

                <c:if test="${param.success == 'true'}">
                    <div class="alert alert-success">
                        Request has been successfully updated!
                    </div>
                </c:if>

            </div>
        </div>
    </div>
</body>
</html>
