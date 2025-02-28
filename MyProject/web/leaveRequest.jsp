<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Request</title>
    <style>
        body {
            background-color: #f5f5f5;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            overflow: hidden;
        }
        .sidebar {
            background-color: #343a40;
            color: #fff;
            width: 250px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .sidebar h4 {
            margin-bottom: 20px;
            font-size: 18px;
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
        }
        .sidebar a:hover {
            background-color: #495057;
            color: #fff;
        }
        .content {
            flex: 1;
            padding: 30px;
            overflow-y: auto;
            background-color: #f8f9fa;
        }
        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 800px;
            margin: 0 auto;
        }
        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="d-flex">
        <!-- Sidebar -->
        <div class="sidebar">
            <h4>EMPLOYEE LEAVE MANAGEMENT SYSTEM</h4>
            <p class="mt-4"><strong>${sessionScope.user.displayname}</strong></p>
            <a href="welcome.jsp">My Profiles</a>
            <a href="leaveRequest.jsp">Leave Request</a>
            <a href="leaveHistory.jsp">History</a>
            <a href="changePassword.jsp">Change Password</a>
            <a href="logout">Sign Out</a>
        </div>

        <!-- Main Content -->
        <div class="content">
            <h2>Leave Request</h2>
            <div class="card">
                <h4>Create a Leave Request</h4>
                <form action="SubmitLeaveRequestServlet" method="POST">
                    <div class="mb-3">
                        <label for="leaveType" class="form-label">Leave Type</label>
                        <select class="form-control" id="leaveType" name="leaveType" required>
                            <option value="Sick Leave">Sick Leave</option>
                            <option value="Casual Leave">Casual Leave</option>
                            <option value="Annual Leave">Annual Leave</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="startDate" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="startDate" name="startDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="endDate" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="endDate" name="endDate" required>
                    </div>
                    <div class="mb-3">
                        <label for="reason" class="form-label">Reason</label>
                        <textarea class="form-control" id="reason" name="reason" rows="4" placeholder="Enter the reason for leave..." required></textarea>
                    </div>
                    <button type="submit" class="btn-submit">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
