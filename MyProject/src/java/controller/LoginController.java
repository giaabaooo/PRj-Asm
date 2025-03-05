/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.EmployeeDBContext;
import dal.UserDBContext;
import data.Employee;
import data.Role;
import data.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author sonnt-local
 */

public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        UserDBContext db = new UserDBContext();
        User user = db.get(username, password);

        if (user != null) {
    EmployeeDBContext edb = new EmployeeDBContext();
    Employee profile = edb.get(user.getE().getId());
    user.setE(profile);
    
    HttpSession session = req.getSession();
    session.setAttribute("user", user);

    // Lấy danh sách role của user
    ArrayList<Role> rid = user.getRoles(); // Lấy role của user từ DB
    String role = null;

    // Duyệt qua danh sách role để xác định role của user
    for (Role r : rid) {
        if ("team leader".equalsIgnoreCase(r.getName())) {
            role = "admin"; // Ánh xạ role "boss" thành "admin"
            break;
        } else if ("staff".equalsIgnoreCase(r.getName())) {
            role = "user"; // Ánh xạ role "staff" thành "user"
            break;
        }
    }

    // Phân chia role
    if ("admin".equalsIgnoreCase(role)) {
        resp.sendRedirect("admin/welcome"); // Trang cho admin
    } else if ("user".equalsIgnoreCase(role)) {
        resp.sendRedirect("user/welcome"); // Trang cho user
    } else {
        resp.getWriter().println("Role not recognized!"); // Trường hợp role không hợp lệ
    }
} else {
    resp.getWriter().println("Login failed!"); // Sai username hoặc password
}
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }

}
