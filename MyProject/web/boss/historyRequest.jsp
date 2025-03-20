<%-- 
    Document   : adminManagement
    Created on : Mar 17, 2025, 2:52:43 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Leave History</title>
        <link href="../css/adminRequest.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
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
            max-width: 1100px; /* Điều chỉnh chiều ngang tối đa để khớp với bảng */
            width: 100%; /* Đảm bảo chiếm toàn bộ chiều rộng của container */
            margin: 20px auto; /* Căn giữa thẻ và tạo khoảng cách bên trên/dưới */
            border: 2px solid #ddd; /* Thêm viền để đồng bộ với bảng */
        }
        .container {
            width: 100%;
            max-width: 1300px; /* Chiều rộng tối đa */
            margin: 20px auto; /* Canh giữa bảng */
            padding: 20px;
            padding-top: 80px; /* Đẩy bảng xuống để tránh navbar che */
        }

        table {
            width: 100%; /* Chiều rộng bảng */
            max-width: 1200px; /* Giới hạn chiều rộng tối đa */
            margin: 0 auto; /* Canh giữa */
            border-collapse: collapse; /* Gộp các đường viền */
            font-size: 16px; /* Kích thước chữ */
            border: 2px solid #ddd; /* Viền bo ngoài bảng */
            border-radius: 8px; /* Bo góc bảng */
            overflow: hidden; /* Đảm bảo bo góc không bị lỗi */
        }

        th, td {
            padding: 12px 20px; /* Khoảng đệm giữa nội dung */
            border: 1px solid #ddd; /* Đường viền ngăn cách giữa các ô */
            text-align: center; /* Canh giữa nội dung */
        }

        th {
            background-color: #f4f4f4; /* Màu nền tiêu đề */
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Màu nền xen kẽ */
        }

        tr:hover {
            background-color: #f1f1f1; /* Hiệu ứng hover */
        }



        caption {
            font-size: 18px; /* Cỡ chữ lớn hơn một chút cho tiêu đề bảng */
            font-weight: bold;
            margin-bottom: 10px; /* Khoảng cách dưới tiêu đề bảng */
            color: #333; /* Màu chữ đậm */
            text-align: left; /* Căn lề trái */
        }

    </style>
    <body>
        <div class="navbar">
            <h1>Employee Leave Management System</h1>
        </div>
        <div class="sidebar">
            <h3>Admin</h3>
            <p class="user-displayname"><strong><c:out value="${sessionScope.user.displayname}" /></strong></p>
            <p class="user-displayname"> <c:out value="${sessionScope.user.dept.name}" /></p>
            <ul>
                <li><a href="welcomeBoss">Welcome</a></li>
                <li><a href="dashboard">Dashboard</a></li>
                <li><a href="employee">Employees</a></li>               
                <li><a href="historyRequest">Leave Management</a></li>
                <li><a href="#">Change Password</a></li>
                <li><a href="logout">Sign Out</a></li>
            </ul>
        </div>
        <div class="content">
            <div class="card">
                <caption><strong>History</strong></caption>
                <!-- Search Form -->
                <form id="search" action="historyRequest" method="GET">
            <select name="did" onchange="document.getElementById('search').submit();">
                <option value="-1">All Department</option>
                <c:forEach items="${requestScope.depts}" var="d">
                    <option
                        <c:if test="${d.id eq param.did}">
                            selected="selected"
                        </c:if>
                        value="${d.id}">${d.name}</option>
                </c:forEach>
            </select>
        </form>

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
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.leaves}" var="l" varStatus="status">
                            <tr>

                                <td><c:out value="${status.index + 1}"/></td>
                                <td><c:out value="${l.title}" /></td>
                                <td><c:out value="${l.reason}" /></td>
                                <td><c:out value="${l.from}" /></td>
                                <td><c:out value="${l.to}" /></td>
                                <td><c:out value="${l.createdby.displayname}" /></td>
                                <td><c:out value="${l.createddate}" /></td>
                                <td>
                                    <c:out value="${l.status eq 0 ? 'In Progress' : (r.status eq 1 ? 'Rejected' : 'Accepted')}" />
                                </td>
                                <td><a href="/MyProject/boss/view?action=view&rid=${l.id}" class="btn btn-primary">View</a></td>
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
