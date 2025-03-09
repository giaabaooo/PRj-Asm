<%-- 
    Document   : welcome
    Created on : Mar 2, 2025, 7:57:38 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Employee Leave Management System</title>
        <style>
            /* Tổng quát */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f9;
            }

            /* Navbar */
            .navbar {
                background-color: #4CAF50; /* Màu xanh lá cây */
                color: white;
                padding: 15px;
                text-align: center;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            }

            .navbar h1 {
                margin: 0;
                font-size: 24px;
            }

            /* Sidebar */
            .sidebar {
                width: 250px;
                background-color: #333; /* Màu xám đậm */
                height: 100vh;
                position: fixed;
                top: 0;
                left: 0;
                overflow-y: auto;
                color: white;
                box-shadow: 2px 0px 5px rgba(0, 0, 0, 0.2);
            }

            .sidebar h3 {
                text-align: center;
                padding: 20px 0;
                background-color: #444; /* Màu xám tối hơn */
                margin: 0;
                font-size: 18px;
                border-bottom: 1px solid #555;
            }

            .user-displayname {
                text-align: center;
                margin: 10px 0;
                font-size: 16px;
                color: #fff; /* Màu trắng */
            }

            .sidebar ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .sidebar ul li {
                border-bottom: 1px solid #444;
            }

            .sidebar ul li a {
                display: block;
                padding: 15px;
                color: white;
                text-decoration: none;
                font-size: 16px;
                transition: background 0.3s, color 0.3s;
            }

            .sidebar ul li a:hover {
                background-color: #4CAF50; /* Màu xanh khi hover */
                color: white;
            }

            /* Nội dung chính */
            .content {
                margin-left: 250px; /* Đẩy nội dung chính sang phải để không bị che bởi sidebar */
                padding: 20px;
            }

            .dashboard {
                display: flex;
                gap: 20px;
            }
            .card {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                text-align: center;
                flex: 1;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .card h3 {
                margin: 0;
                font-size: 24px;
            }
            .card p {
                font-size: 18px;
                color: #555;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: white;
            }
            table th, table td {
                border: 1px solid #ddd;
                padding: 10px;
                text-align: left;
            }
            table th {
                background-color: #f2f2f2;
            }
            .btn {
                padding: 5px 10px;
                color: white;
                background-color: #007bff;
                border: none;
                border-radius: 4px;
                text-decoration: none;
            }
            .btn:hover {
                background-color: #0056b3;
            }
          

        </style>
    </head>
    <body>
        <div class="navbar">
            <h1>Employee Leave Management System</h1>
        </div>
        <div class="sidebar">
            <h3>Admin</h3>
            <p class="user-displayname"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <p class="user-displayname">
                <c:out value="${sessionScope.user.dept.name}" />
            </p>
            <ul>
                <li><a href="dashboard">Dashboard</a></li>
                <li><a href="employee">Employees</a></li> 
                <li><a href="adminRequest">Leave Request</a></li>
                <li><a href="#">Leave Management</a></li>
                <li><a href="#">Change Password</a></li>
                <li><a href="<c:url value='/admin/logout'/>" >Sign Out</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="dashboard">
                <div class="card">
                    <h3>5</h3>
                    <p>Total Registered Employees</p>
                </div>
                <div class="card" style="background-color: #007bff; color: white;">
                    <h3>9</h3>
                    <p>Listed Leave</p>
                </div>
                <div class="card" style="background-color: #28a745; color: white;">
                    <h3>3</h3>
                    <p>Listed Leave Type</p>
                </div>
            </div>
            <h2>Latest Leave Applications</h2>
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Employee Name</th>
                        <th>Leave Type</th>
                        <th>Posting Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>Nguyễn Thị Thu Hà (18001122)</td>
                        <td>Medical Leave Test</td>
                        <td>2020-08-25 12:45:29</td>
                        <td style="color: blue;">Waiting for Approval</td>
                        <td><a href="#" class="btn">View Details</a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Nguyễn Thị Thu Hà (18001122)</td>
                        <td>Restricted Holiday</td>
                        <td>2020-08-25 12:40:42</td>
                        <td style="color: blue;">Waiting for Approval</td>
                        <td><a href="#" class="btn">View Details</a></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>Nguyễn Thị Thu Hà (18001122)</td>
                        <td>Casual Leave</td>
                        <td>2020-08-25 11:16:27</td>
                        <td style="color: red;">Not Approved</td>
                        <td><a href="#" class="btn">View Details</a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>

