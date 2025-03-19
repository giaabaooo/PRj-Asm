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
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Date;

/**
 *
 * @author admin
 */
public class UpdateRequest extends BaseRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        try {
            int rid = Integer.parseInt(req.getParameter("rid"));
            String title = req.getParameter("title");
            String reason = req.getParameter("reason");
            String from = req.getParameter("from");
            String to = req.getParameter("to");

            // Kiểm tra dữ liệu đầu vào
    if (title == null || reason == null || from == null || to == null ||
        title.isEmpty() || reason.isEmpty() || from.isEmpty() || to.isEmpty()) {
        throw new IllegalArgumentException("All fields are required.");
    }
            

            // Cập nhật yêu cầu
            LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
            leaveRequestDB.updateRequest(rid, title, reason, from, to);
//            leaveRequestDB.updateRequest(rid, title, reason, from, to);

            // Chuyển hướng về trang history
            resp.sendRedirect("history");
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Failed to update the request.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int rid = Integer.parseInt(req.getParameter("rid"));

        // Lấy thông tin yêu cầu từ DB
        LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
        LeaveRequest requestDetail = leaveRequestDB.getRequestById(rid);

        if (requestDetail == null) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Request not found.");
            return;
        }

        // Gửi dữ liệu đến JSP
        req.setAttribute("request", requestDetail);
        req.getRequestDispatcher("/user/updateRequest.jsp").forward(req, resp);
    }

}
