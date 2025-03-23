<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="../css/adminRequest.css" rel="stylesheet" type="text/css"/>
        <title>Leave Request</title>
        <style>
            

            

            .form-container {
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #f8f9fa;
    }

    .form-title {
        font-size: 24px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
    }

            .form-box {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    .form-box label {
        display: block;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .form-box input[type="text"],
    .form-box input[type="date"],
    .form-box textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ced4da;
        border-radius: 4px;
        font-size: 14px;
    }

    .form-box textarea {
        resize: none;
        height: 100px;
    }

    .form-box button {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        color: #ffffff;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .form-box button:hover {
        background-color: #0056b3;
    }
            @media (max-width: 768px) {
                .sidebar {
                    width: 200px;
                }

                .form-container {
                    margin-left: 200px;
                }

                .form-box  {
                    padding: 15px;
                }
            }
        </style>
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

        <div class="form-container">
            <h2 class="form-title">Update Leave Request</h2>
            <div class="form-box">
                <form action="updateRequest" method="POST">
                    <input type="hidden" name="rid" value="${requestScope.request.id}" />
                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" value="${requestScope.request.title}" required /><br>

                    <label for="reason">Reason:</label>
                    <textarea id="reason" name="reason" required>${requestScope.request.reason}</textarea><br>

                    <label for="from">From:</label>
                    <input type="date" id="from" name="from" value="${requestScope.request.from}" required /><br>

                    <label for="to">To:</label>
                    <input type="date" id="to" name="to" value="${requestScope.request.to}" required /><br>

                    <button type="submit" class="btn btn-primary">Update</button>
                </form>
            </div>

        </div>

    </body>
</html>
