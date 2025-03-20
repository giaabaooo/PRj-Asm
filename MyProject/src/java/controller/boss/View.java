/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.boss;

import controller.BaseRequiredAuthenticationController;
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

/**
 *
 * @author admin
 */
public class View extends BaseRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException {
//     // Lấy request ID từ URL
//        String ridParam = request.getParameter("rid");
//        
//        
//         // Kiểm tra nếu ridParam bị null hoặc trống
//    if (ridParam == null || ridParam.isEmpty()) {
//        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request ID is missing or invalid.");
//        return;
//    }
//     int rid;
//    try {
//        rid = Integer.parseInt(ridParam); // Chuyển đổi rid thành số nguyên
//    } catch (NumberFormatException e) {
//        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request ID must be a valid number.");
//        return;
//    }
//
//        // Lấy thông tin yêu cầu từ database
//        LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
//        LeaveRequest requestDetail = leaveRequestDB.getRequestById(rid);
//
//        // Gửi dữ liệu tới JSP
//        request.setAttribute("requestDetail", requestDetail);
//        request.getRequestDispatcher("/admin/viewDetail.jsp").forward(request, response);
//    } 
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
// Xét duyệt yêu cầu nghỉ phép
        try {
            int rid = Integer.parseInt(req.getParameter("rid"));
            int status = Integer.parseInt(req.getParameter("status"));

            LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
            int rowsAffected = leaveRequestDB.updateRequestStatus(rid, status);

        // Kiểm tra kết quả cập nhật
        if (rowsAffected > 0) {
            req.getSession().setAttribute("successMessage", "Request has been successfully updated.");
        } else {
            req.getSession().setAttribute("errorMessage", "Failed to update the request. Please try again.");
        }

        // Chuyển hướng về dashboard
        resp.sendRedirect("historyRequest");
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "An unexpected error occurred.");
            resp.sendRedirect("historyRequest");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("view".equalsIgnoreCase(action)) {
            // Xem chi tiết yêu cầu nghỉ phép
            int rid = Integer.parseInt(req.getParameter("rid"));
            LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
            LeaveRequest requestDetail = leaveRequestDB.getRequestById(rid);

            if (requestDetail != null) {
                req.setAttribute("requestDetail", requestDetail);
                req.getRequestDispatcher("/boss/view.jsp").forward(req, resp);
            } else {
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Request not found.");
            }
        }

    }

}
