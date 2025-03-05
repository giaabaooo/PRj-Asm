<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Leave Management</title>
        <style>
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                height: 100vh;
            }

            .sidebar {
                background-color: #343a40;
                color: #fff;
                width: 250px;
                padding: 20px;
                display: flex;
                flex-direction: column;
                align-items: center;
                height: 100vh;
                position: fixed;
                overflow-y: auto;
            }

            .sidebar h4 {
                margin-bottom: 20px;
                font-size: 18px;
                text-align: center;
            }

            .sidebar a {
                display: block;
                width: 100%;
                padding: 10px 15px;
                color: #ddd;
                text-decoration: none;
                border-radius: 5px;
                margin-bottom: 10px;
                text-align: center;
                font-size: 14px;
            }

            .sidebar a:hover {
                background-color: #495057;
                color: #fff;
            }

            .content {
                margin-left: 250px;
                width: calc(100% - 250px);
                padding: 20px;
                background-color: #f8f9fa;
                overflow-y: auto;
            }

            .card {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
                padding: 20px;
                max-width: 800px; /* Điều chỉnh chiều ngang tối đa của thẻ */
                margin: 0 auto; /* Căn giữa thẻ */
            }


            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            }

            table th, table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            table th {
                background-color: #343a40;
                color: #fff;
            }

            table tr:hover {
                background-color: #f1f1f1;
            }

            select {
                padding: 10px;
                font-size: 14px;
                border-radius: 5px;
                border: 1px solid #ddd;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Sidebar -->
        <div class="sidebar">
            <h4>EMPLOYEE LEAVE MANAGEMENT SYSTEM</h4>
            <p><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <a href="welcome">My Profiles</a>
            <a href="leaveRequest">Leave Request</a>
            <a href="history">History</a>
            <a href="changePassword.jsp">Change Password</a>
            <a href="logout" style="color: red;">Sign Out</a>
        </div>

        <!-- Content -->
        <div class="content">
            <div class="card">
                <h4>History</h4>
                <!-- Search Form -->
                <div class="department-info">
                    <label>Department:</label>
                    <span>${sessionScope.employees.did}</span>
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
                        <c:forEach items="${requestScope.leaves}" var="l">
                            <tr>
                                <td><c:out value="${l.id}" /></td>
                                <td><c:out value="${l.title}" /></td>
                                <td><c:out value="${l.reason}" /></td>
                                <td><c:out value="${l.from}" /></td>
                                <td><c:out value="${l.to}" /></td>
                                <td><c:out value="${l.createdby.displayname}" /></td>
                                <td><c:out value="${l.createddate}" /></td>
                                <td>
                                    <c:out value="${l.status eq 0 ? 'In Progress' : (l.status eq 1 ? 'Rejected' : 'Accepted')}" />
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty requestScope.leaves}">
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
