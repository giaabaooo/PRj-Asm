<%-- 
    Document   : welcome
    Created on : Feb 25, 2025, 4:39:57 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Welcome - Edit Profile</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: #f5f5f5;
                font-family: Arial, sans-serif;
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
                background-color: #f8f9fa;
                padding: 20px;
                overflow-y: auto;
            }
            .card {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                padding: 20px;
                max-width: 800px;
                margin: 0 auto;
            }
            .btn-update {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 15px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
            }
            .btn-update:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <!-- Sidebar -->
            <div class="sidebar">
                <h4>EMPLOYEE LEAVE MANAGEMENT SYSTEM</h4>
                <p class="mt-4"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
                <a href="#">My Profiles</a>
                <div>
                    <a href="#" class="dropdown-toggle">Leaves</a>
                    <ul class="submenu">
                        <li><a href="leaveRequest.jsp"><i class="fa fa-pencil-square-o"></i> Leave Request</a></li>
                        <li><a href="history.jsp"><i class="fa fa-history"></i> History</a></li>
                    </ul>
                </div>
                <a href="#">Change Password</a>
                <a href="logout" style="color: red; text-decoration: none;"><i class="fa fa-sign-out"></i> Sign Out</a>
            </div>

            <!-- Main Content -->
            <div class="content">
                <h2>MY PROFILE</h2>
                <div class="card">
                    <h4>Edit your profile</h4>
                    <form action="UpdateProfileServlet" method="POST">
                        <div class="mb-3">
                            <label for="employeeCode" class="form-label">Employee Code</label>
                            <input type="text" class="form-control" id="employeeCode" name="employeeCode" value="18001122" readonly>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="fullName" class="form-label">Full name</label>
                                <input type="text" class="form-control" id="fullName" name="fullName" value="${sessionScope.user.displayname}"}>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="gender" class="form-label">Gender</label>
                                <select class="form-control" id="gender" name="gender">
                                    <option value="Female" selected>Female</option>
                                    <option value="Male">Male</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" value="ha@gmail.com">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="mobileNumber" class="form-label">Mobile number</label>
                                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="853529612">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="Hai Duong">
                        </div>
                        <div class="mb-3">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" value="1990-11-10">
                        </div>
                        <button type="submit" class="btn btn-update">UPDATE</button>
                    </form>
                </div>
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
