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
        <link href="../css/admin.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="navbar">
            <h1>Employee Leave Management System</h1>
        </div>
        <div class="sidebar">       
            <p class="user-displayname"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <p class="user-displayname"><c:out value="${sessionScope.user.dept.name}" /></p>
            <ul>
                <li><a href="welcome">Welcome</a></li>
                <li><a href="leaveRequest">Leave Request</a></li>
                <li><a href="history">History</a></li>
                <li><a href="<c:url value='/user/logout'/>" style="color: red;">Sign Out</a></li>
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
