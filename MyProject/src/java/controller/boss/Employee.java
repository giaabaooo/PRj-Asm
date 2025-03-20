/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.boss;

import controller.BaseRequiredAuthenticationController;
import dal.DepartmentDBContext;
import dal.EmployeeDBContext;
import data.Department;
import data.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class Employee extends BaseRequiredAuthenticationController {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
//        EmployeeDBContext employeeDB = new EmployeeDBContext();
//        ArrayList<data.Employee> employees = employeeDB.getAllEmployees(); // Lấy toàn bộ nhân viên
//        req.setAttribute("employees", employees);
//
//// Chuyển tiếp đến JSP
//        req.getRequestDispatcher("/boss/employee.jsp").forward(req, resp);
        try {
            // Lấy tham số departmentName từ request
            String dname = req.getParameter("dname");

            EmployeeDBContext employeeDB = new EmployeeDBContext();
            DepartmentDBContext deptDB = new DepartmentDBContext();
            ArrayList<data.Employee> employees;

            if (dname != null && !dname.trim().isEmpty()) {
                // Lấy danh sách nhân viên theo tên phòng ban
                employees = employeeDB.getEmployeesByDepartmentName(dname);

            } else {
                // Lấy toàn bộ nhân viên nếu không có phòng ban cụ thể
                employees = employeeDB.getAllEmployees();
            }
//            req.setAttribute("depts", deptDB.list());
            req.setAttribute("employees", employees);

            // Chuyển tiếp đến JSP
            req.getRequestDispatcher("/boss/employee.jsp").forward(req, resp);
        } catch (Exception e) {
            // Xử lý lỗi nếu xảy ra
            e.printStackTrace();
            req.setAttribute("error", "Unable to load employee data.");
            req.getRequestDispatcher("/error.jsp").forward(req, resp);
        }

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
