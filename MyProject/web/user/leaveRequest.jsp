<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Leave Request</title>
        <link href="../css/adminRequest.css" rel="stylesheet" type="text/css"/>
        
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
                <h4>Create a Leave Request</h4>
                <form action="leaveRequest" method="POST">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="Enter the title" required>


                    <label for="startDate" class="form-label">Start Date</label>
                    <input type="date" class="form-control" id="startDate" name="from" required>

                    <label for="endDate" class="form-label">End Date</label>
                    <input type="date" class="form-control" id="endDate" name="to" required>

                    <label for="reason" class="form-label">Reason</label>
                    <textarea class="form-control" id="reason" name="reason" rows="4" placeholder="Enter the reason for leave..." required></textarea>
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
