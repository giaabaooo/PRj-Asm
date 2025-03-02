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

        .sidebar p {
            margin-bottom: 20px;
            text-align: center;
            width: 100%;
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
            margin-left: 250px; /* Dành không gian cho sidebar */
            width: calc(100% - 250px);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* Chiều cao nội dung đầy màn hình */
            background-color: #f8f9fa;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 100%;
            max-width: 600px;
        }

        .card h4 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-label {
            font-size: 14px;
            margin-bottom: 8px;
            color: #555;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 15px;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .btn-submit {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 0 auto;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 200px;
            }

            .content {
                margin-left: 200px;
            }

            .card {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar">
        <h4>EMPLOYEE LEAVE MANAGEMENT SYSTEM</h4>
        <p class="mt-4"><strong>${sessionScope.user.displayname}</strong></p>
        <a href="welcome.jsp">My Profiles</a>
        <a href="leaveRequest.jsp">Leave Request</a>
        <a href="history.jsp">History</a>
        <a href="changePassword.jsp">Change Password</a>
        <a href="logout">Sign Out</a>
    </div>

    <div class="content">
        <div class="card">
            <h4>Create a Leave Request</h4>
            <form action="SubmitLeaveRequestServlet" method="POST">
                <label for="leaveType" class="form-label">Leave Type</label>
                <select class="form-control" id="leaveType" name="leaveType" required>
                    <option value="Sick Leave">Sick Leave</option>
                    <option value="Casual Leave">Casual Leave</option>
                    <option value="Annual Leave">Annual Leave</option>
                </select>

                <label for="startDate" class="form-label">Start Date</label>
                <input type="date" class="form-control" id="startDate" name="startDate" required>

                <label for="endDate" class="form-label">End Date</label>
                <input type="date" class="form-control" id="endDate" name="endDate" required>

                <label for="reason" class="form-label">Reason</label>
                <textarea class="form-control" id="reason" name="reason" rows="4" placeholder="Enter the reason for leave..." required></textarea>

                <button type="submit" class="btn-submit">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
