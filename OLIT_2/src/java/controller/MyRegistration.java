/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RegistrationDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Registration;

/**
 *
 * @author macbook
 */
@WebServlet(name = "MyRegistration", urlPatterns = {"/MyRegistration"})
public class MyRegistration extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null) {
            response.sendRedirect(request.getContextPath() + "/userPages/login.jsp");
            return;
        }
        int userID = (int) session.getAttribute("userID");
        RegistrationDAO dao = new RegistrationDAO();
        // Lấy page từ URL, mặc định là 1
        int page = 1;
        int recordsPerPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                page = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                page = 1;
            }
        }
        int offset = (page - 1) * recordsPerPage;
        // Lấy danh sách đăng ký có phân trang
        List<Registration> registrations = dao.getRegistrationsByUserIDWithPaging(userID, offset, recordsPerPage);
        int totalRecords = dao.countRegistrationsByUserID(userID);
        int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
        request.setAttribute("registrations", registrations);
        request.setAttribute("currentPage", Integer.valueOf(page));
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("userPages/myRegistration.jsp").forward(request, response);
    }
}
