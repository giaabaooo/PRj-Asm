/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.admin;

import dal.LeaveRequestDBContext;
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
@WebServlet(name = "ApproveRejectRequest", urlPatterns = {"/admin/ApproveRejectRequest"})
public class ApproveRejectRequest extends HttpServlet {
   
 
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       try {
            // Lấy tham số từ request
            int rid = Integer.parseInt(request.getParameter("rid"));
            int status = Integer.parseInt(request.getParameter("status"));

            // Cập nhật trạng thái yêu cầu
            LeaveRequestDBContext leaveRequestDB = new LeaveRequestDBContext();
            leaveRequestDB.updateRequestStatus(rid, status);

            // Gửi phản hồi thành công (Redirect về dashboard hoặc hiển thị thông báo JSON)
            response.sendRedirect("dashboard?success=true");
        } catch (NumberFormatException | NullPointerException e) {
            // Xử lý lỗi nếu tham số không hợp lệ
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid parameters.");
        } catch (Exception e) {
            // Xử lý các lỗi khác
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        
    }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
