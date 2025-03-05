/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Department;
import data.Employee;
import data.Feature;
import data.Role;
import data.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class UserDBContext extends DBContext<User> {

    public User get(String username, String password) {
    try {
        String sql = "SELECT u.username, u.displayname, " +
                     "       r.rid, r.rname, " +
                     "       f.fid, f.url, " +
                     "       e.eid, e.ename, e.did, " + // Thêm thông tin phòng ban từ Employees
                     "       d.dname " +                 // Thêm thông tin phòng ban từ Departments
                     "FROM Users u " +
                     "INNER JOIN Employees e ON e.eid = u.eid " +
                     "LEFT JOIN Departments d ON e.did = d.did " + // Thêm liên kết với bảng Departments
                     "LEFT JOIN User_Role ur ON u.username = ur.username " +
                     "LEFT JOIN Roles r ON ur.rid = r.rid " +
                     "LEFT JOIN Role_Feature rf ON rf.rid = r.rid " +
                     "LEFT JOIN Features f ON f.fid = rf.fid " +
                     "WHERE u.username = ? AND u.password = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, username);
        stm.setString(2, password);
        ResultSet rs = stm.executeQuery();

        User user = null;
        Role current_role = new Role();
        current_role.setId(-1); // Đặt giá trị mặc định cho Role

        while (rs.next()) {
            if (user == null) {
                user = new User();
                user.setUsername(username);
                user.setDisplayname(rs.getString("displayname"));

                // Gán thông tin nhân viên
                Employee e = new Employee();
                e.setId(rs.getInt("eid"));
                e.setName(rs.getString("ename"));

                // Gán thông tin phòng ban
                Department dept = new Department();
                dept.setId(rs.getInt("did"));
                dept.setName(rs.getString("dname"));
                user.setDept(dept);
                e.setDept(dept);

                user.setE(e); // Gán Employee vào User
            }

            // Xử lý thông tin Role
            int rid = rs.getInt("rid");
            if (rid != 0 && rid != current_role.getId()) {
                current_role = new Role();
                current_role.setId(rid);
                current_role.setName(rs.getString("rname"));
                user.getRoles().add(current_role);
                current_role.getUsers().add(user);
            }

            // Xử lý thông tin Feature
            int fid = rs.getInt("fid");
            if (fid != 0) {
                Feature f = new Feature();
                f.setId(rs.getInt("fid"));
                f.setUrl(rs.getString("url"));
                current_role.getFeatures().add(f);
                f.getRoles().add(current_role);
            }
        }
        return user;
    } catch (SQLException ex) {
        Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
    }
    return null;
}

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
