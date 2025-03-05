/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.LeaveRequestDBContext;
import data.LeaveRequest;
import data.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;

/**
 *
 * @author admin
 */

public class CreateLeaveRequest extends BaseRequiredAuthenticationController {

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String title = req.getParameter("title");
        String reason = req.getParameter("reason");
        String from = req.getParameter("from");
        String to = req.getParameter("to");

        LeaveRequest lr = new LeaveRequest();
        lr.setTitle(title);
        lr.setReason(reason);
        lr.setFrom(Date.valueOf(from));
        lr.setTo(Date.valueOf(to));
        lr.setCreatedby(user);

        LeaveRequestDBContext db = new LeaveRequestDBContext();
        db.insert(lr);
        req.setAttribute("successMessage", "Your leave request has been submitted successfully!");

        // Forward lại trang leaveRequest.jsp với thông báo
        req.getRequestDispatcher("/user/leaveRequest.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        req.getRequestDispatcher("/user/leaveRequest.jsp").forward(req, resp);
    }

}
