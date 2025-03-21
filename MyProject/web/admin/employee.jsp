<%-- 
    Document   : employee
    Created on : Mar 8, 2025, 8:14:33 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Employee List</title>
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar">
            <h1>Employee Leave Management System</h1>
        </div>
        <div class="sidebar">
            <h3>Admin</h3>
            <p class="user-displayname"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <p class="user-displayname"><c:out value="${sessionScope.user.dept.name}" /></p>
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
            <h2>Employees in Department: <c:out value="${sessionScope.user.dept.name}" /></h2>
            <table border="1" cellpadding="10" cellspacing="0">
                <thead>
                    <tr>

                        <th>Employee ID</th>
                        <th>Employee Name</th>                   
                        <th>Department</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${requestScope.employees}" var="employee" varStatus="status">
                        <tr>                      
                            <td><c:out value="${employee.id}" /></td>
                            <td><c:out value="${employee.name}" /></td>
                            <td><c:out value="${employee.dname}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>

