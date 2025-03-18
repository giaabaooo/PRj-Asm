/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import controller.BaseRequiredAuthenticationController;
import dal.DepartmentDBContext;
import dal.LeaveRequestDBContext;
import data.LeaveRequest;
import data.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class Dashboard extends BaseRequiredAuthenticationController {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, User user)
    throws ServletException, IOException {
         String username = user.getUsername();
    
    // Khởi tạo các DBContext để truy vấn dữ liệu
    LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
    DepartmentDBContext departmentDB = new DepartmentDBContext();
    
    // Truy vấn danh sách các yêu cầu nghỉ phép liên quan đến phòng ban của user hiện tại
    ArrayList<LeaveRequest> leaves = leaveRequestDB.getByDeptOfUser(username);
    
    // Gửi dữ liệu đến JSP
    request.setAttribute("leaves", leaves);
    request.setAttribute("depts", departmentDB.list());
        
        request.getRequestDispatcher("/admin/dashboard.jsp").forward(request, response);
    } 

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
         processRequest(req, resp, user);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
         processRequest(req, resp, user);
    }

}
