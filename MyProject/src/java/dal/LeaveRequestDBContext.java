/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import data.Department;
import data.Employee;
import data.LeaveRequest;
import data.User;
import java.util.ArrayList;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author sonnt-local
 */
public class LeaveRequestDBContext extends DBContext<LeaveRequest> {

    @Override
    public ArrayList<LeaveRequest> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public LeaveRequest get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(LeaveRequest model) {
        try {
            String sql = "INSERT INTO [LeaveRequest]\n"
                    + "           ([title]\n"
                    + "           ,[reason]\n"
                    + "           ,[from]\n"
                    + "           ,[to]\n"
                    + "           ,[createdby]\n"
                    + "           ,[status]\n"
                    + "		   ,[createddate]\n"
                    + "		   )\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,0,GETDATE())";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, model.getTitle());
            stm.setString(2, model.getReason());
            stm.setDate(3, model.getFrom());
            stm.setDate(4, model.getTo());
            stm.setString(5, model.getCreatedby().getUsername());
            stm.executeUpdate();//update insert delete
        } catch (SQLException ex) {
            Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (connection != null)
                try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
    
    // Lấy danh sách nghỉ phép của người dùng hiện tại
    public ArrayList<LeaveRequest> getByUsername(String username) {
    ArrayList<LeaveRequest> requests = new ArrayList<>();
    String sql = "SELECT lr.rid, lr.title, lr.reason, lr.[from], lr.[to], lr.createddate, lr.status " +
                 "FROM LeaveRequest lr " +
                 "WHERE lr.createdby = ?";
    try (PreparedStatement stmt = connection.prepareStatement(sql)) {
        stmt.setString(1, username); // Gán giá trị `eid` của user hiện tại
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            LeaveRequest r = new LeaveRequest();
            r.setId(rs.getInt("rid"));
            r.setTitle(rs.getString("title"));
            r.setReason(rs.getString("reason"));
            r.setFrom(rs.getDate("from"));
            r.setTo(rs.getDate("to"));
            r.setCreateddate(rs.getTimestamp("createddate"));
            r.setStatus(rs.getInt("status"));
            requests.add(r); // Thêm vào danh sách
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return requests;
}

    public ArrayList<LeaveRequest> getByDeptOfUser(String username) {
    ArrayList<LeaveRequest> requests = new ArrayList<>();
    try {
        String sql = "SELECT \n"
                + "    r.rid, r.title, r.reason, r.[from], r.[to], u.username, u.displayname, \n"
                + "    r.createddate, r.status, \n"
                + "    d.did, d.dname, \n"
                + "    e.eid, e.ename \n"
                + "FROM LeaveRequest r \n"
                + "INNER JOIN Users u ON u.username = r.createdby \n"
                + "INNER JOIN Employees e ON e.eid = u.eid \n"
                + "INNER JOIN Departments d ON d.did = e.did \n"
                + "WHERE d.did = ( \n"
                + "    SELECT d.did \n"
                + "    FROM Users u \n"
                + "    INNER JOIN Employees e ON u.eid = e.eid \n"
                + "    INNER JOIN Departments d ON e.did = d.did \n"
                + "    WHERE u.username = ? \n"
                + ")";

        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setString(1, username);

        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            LeaveRequest r = new LeaveRequest();
            r.setId(rs.getInt("rid"));
            r.setTitle(rs.getString("title"));
            r.setReason(rs.getString("reason"));
            r.setFrom(rs.getDate("from"));
            r.setTo(rs.getDate("to"));
            r.setCreateddate(rs.getTimestamp("createddate"));
            r.setStatus(rs.getInt("status"));

            User u = new User();
            u.setUsername(rs.getString("username"));
            u.setDisplayname(rs.getString("displayname"));
            r.setCreatedby(u);

            Employee e = new Employee();
            u.setE(e);
            e.setId(rs.getInt("eid"));
            e.setName(rs.getString("ename"));

            Department d = new Department();
            e.setDept(d);
            d.setId(rs.getInt("did"));
            d.setName(rs.getString("dname"));

            requests.add(r);
        }

    } catch (SQLException ex) {
        Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
    } finally {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(LeaveRequestDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    return requests;
}
    
    public int getTotalRequestsByDid(int did) {
    int total = 0;
    String sql = "SELECT COUNT(*) AS total_requests " +
                 "FROM LeaveRequest r " +
                 "INNER JOIN Users u ON r.createdby = u.username " +
                 "WHERE u.did = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, did); // Truyền giá trị `did`
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            total = rs.getInt("total_requests");
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return total;
}
    
    public LeaveRequest getRequestById(int rid) {
    LeaveRequest request = null;
    String sql = "SELECT r.rid, r.title, r.reason, r.[from], r.[to], r.createddate, r.status, " +
                 "u.username, u.displayname " +
                 "FROM LeaveRequest r " +
                 "INNER JOIN Users u ON r.createdby = u.username " +
                 "WHERE r.rid = ?";
    try (PreparedStatement stm = connection.prepareStatement(sql)) {
        stm.setInt(1, rid);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            request = new LeaveRequest();
            request.setId(rs.getInt("rid"));
            request.setTitle(rs.getString("title"));
            request.setReason(rs.getString("reason"));
            request.setFrom(rs.getDate("from"));
            request.setTo(rs.getDate("to"));
            request.setCreateddate(rs.getTimestamp("createddate"));
            request.setStatus(rs.getInt("status"));

            User user = new User();
            user.setUsername(rs.getString("username"));
            user.setDisplayname(rs.getString("displayname"));
            request.setCreatedby(user);
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return request;
}

  public int updateRequestStatus(int rid, int status) {
    try {
        String sql = "UPDATE LeaveRequest SET status = ? WHERE rid = ?";
        PreparedStatement stm = connection.prepareStatement(sql);
        stm.setInt(1, status); // Trạng thái (2 = Approved, 1 = Rejected)
        stm.setInt(2, rid);    // ID của yêu cầu
        return stm.executeUpdate(); // Trả về số hàng bị ảnh hưởng
    } catch (SQLException e) {
        e.printStackTrace();
        return 0; // Trả về 0 nếu có lỗi
    }
}

    



    @Override
    public void update(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(LeaveRequest model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
