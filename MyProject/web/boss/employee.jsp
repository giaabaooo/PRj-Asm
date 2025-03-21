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
                <li><a href="welcomeBoss">Welcome</a></li>
                <li><a href="dashboard">Dashboard</a></li>
                <li><a href="employee">Employees</a></li>                
                <li><a href="historyRequest">Leave Management</a></li>               
                <li><a href="<c:url value='/admin/logout'/>" >Sign Out</a></li>
            </ul>
        </div>
        <div class="content">
            <!--        <form id="search" method="get" action="employee">
                        <select name="dname" onchange="document.getElementById('search').submit();">
                            <option value="-1">---All Department---</option>
            <c:forEach items="${requestScope.depts}" var="d">
                <option value="${d.name}"
                <c:if test="${d.name eq param.dname}">
                    selected="selected"
                </c:if>
                value="${d.dname}">${d.dname}</option>
            </c:forEach>
        </select>
    </form>-->
            <table border="1" cellpadding="10" cellspacing="0">
                <thead>
                    <tr>

                        <th>ID</th>
                        <th>Employee</th>                   
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

