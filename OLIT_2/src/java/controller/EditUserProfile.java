/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditUserProfile", urlPatterns = {"/EditUserProfile"})
public class EditUserProfile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8"); // xử lý tiếng Việt

        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        if (userID == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy dữ liệu từ form userProfile.jsp
        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String phoneNumber = request.getParameter("phoneNumber");
        String birthday = request.getParameter("birthday");

        // Có thể chưa có cột address hoặc không hiển thị trên form => ta bỏ qua
        AccountDAO accDao = new AccountDAO();
        boolean updated = accDao.editUserProfile(userID, fullName, gender, phoneNumber, birthday); // address=null

        if (updated) {
            Account updatedAccount = accDao.getAccountByID(userID);
            session.setAttribute("account", updatedAccount);
            session.setAttribute("message", "Cập nhật thông tin thành công!");
            session.setAttribute("messageType", "success");

            // Truy cập đúng luồng qua UserProfile Servlet
            response.sendRedirect(request.getContextPath() + "/UserProfile");
        } else {
            session.setAttribute("message", "Cập nhật thông tin thất bại. Vui lòng thử lại.");
            session.setAttribute("messageType", "error");

            response.sendRedirect(request.getContextPath() + "/UserProfile");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
