<%-- 
    Document   : welcome
    Created on : Feb 25, 2025, 4:39:57 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Welcome Page</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/user.css">
    </head>
    <body>
    <div class="sidebar">
        <h4>EMPLOYEE LEAVE MANAGEMENT SYSTEM</h4>
        <p><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
        <a href="welcome">Welcome</a>
        <a href="leaveRequest">Leave Request</a>
        <a href="history">History</a>
        
        <a href="<c:url value='/user/logout'/>" style="color: red;">Sign Out</a>
    </div>

    <div class="content">
        <div class="card">
            <h4>Hello,<strong><c:out value="${sessionScope.user.displayname}" /></strong>!</h4>
            <p>Welcome to the Employee Leave Management System. Please explore your options in the sidebar.</p>
        </div>
    </div>
</body>

</html>

<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.user.displayname}</h1>
        You need to report to ${sessionScope.user.e.manager.name}
        Your Direct Staffs: <br/>
<c:forEach items="${sessionScope.user.e.directstaffs}" var="s" >
    ${s.name} <br/>
</c:forEach>
   
Your All Staffs: <br/>
<c:forEach items="${sessionScope.user.e.staffs}" var="s" >
    ${s.name} <br/>
</c:forEach>    

</body>
</html>-->
