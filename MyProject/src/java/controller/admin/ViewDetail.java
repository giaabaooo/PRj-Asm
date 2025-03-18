/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

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

public class ViewDetail extends BaseRequiredAuthenticationController {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
     // Lấy request ID từ URL
        String ridParam = request.getParameter("rid");
        
        
         // Kiểm tra nếu ridParam bị null hoặc trống
    if (ridParam == null || ridParam.isEmpty()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request ID is missing or invalid.");
        return;
    }
     int rid;
    try {
        rid = Integer.parseInt(ridParam); // Chuyển đổi rid thành số nguyên
    } catch (NumberFormatException e) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Request ID must be a valid number.");
        return;
    }

        // Lấy thông tin yêu cầu từ database
        LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
        LeaveRequest requestDetail = leaveRequestDB.getRequestById(rid);

        // Gửi dữ liệu tới JSP
        request.setAttribute("requestDetail", requestDetail);
        request.getRequestDispatcher("/admin/viewDetail.jsp").forward(request, response);
    } 


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
         processRequest(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
         processRequest(req, resp);
    }

}
