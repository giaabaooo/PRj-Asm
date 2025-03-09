/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DepartmentDBContext;
import dal.LeaveRequestDBContext;
import data.Department;
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
public class History extends BaseRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, User user)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        LeaveRequestDBContext db = new LeaveRequestDBContext();
        

        // Lấy danh sách lịch sử nghỉ phép của người dùng hiện tại
        User currentUser = (User) session.getAttribute("user");
        String username = currentUser.getUsername(); 
        ArrayList<LeaveRequest> requests = db.getByUsername(username); // Lọc theo ID của user

      
        

        request.setAttribute("requests", requests);
        
        request.getRequestDispatcher("/user/history.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

}
