/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.*;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

@WebServlet(name="RegisterCourseServlet", urlPatterns={"/RegisterCourse"})
public class RegisterCourseServlet extends HttpServlet {
    
    private PricePackageDAO pricePackageDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        pricePackageDAO = new PricePackageDAO();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterCourseServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterCourseServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Get courseId from request parameter
        String courseIdStr = request.getParameter("courseId");
        if (courseIdStr != null && !courseIdStr.isEmpty()) {
            try {
                int courseId = Integer.parseInt(courseIdStr);
                List<PricePackage> pricePackages = pricePackageDAO.getPricePackagesByCourseId(courseId);
                
                // Set the pricePackages as request attribute
                request.setAttribute("pricePackages", pricePackages);
                
                System.out.println(pricePackages);
                
                // Forward to your JSP page
                request.getRequestDispatcher("/register-course.jsp").forward(request, response);
                return;
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        
        // If no courseId or error, just process normally
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Kiểm tra đăng nhập
    HttpSession session = request.getSession();
    Account user = (Account) session.getAttribute("fullAccount");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        // Lấy thông tin từ form
        int courseId = Integer.parseInt(request.getParameter("courseID"));
        int packageId = Integer.parseInt(request.getParameter("package"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");

        // Tạo đối tượng Registration
        Registration registration = new Registration();
        registration.setUserID(user.getUserID()); // Giả sử Account có getUserID()
        registration.setCourseID(courseId);
        registration.setPackageID(packageId);
        registration.setStatus("Pending");

        // Thực hiện đăng ký
        RegistrationDAO registrationDAO = new RegistrationDAO();
        boolean success = registrationDAO.registerCourse(registration);

        if (success) {
            // Đăng ký thành công
            session.setAttribute("message", "Đăng ký khóa học thành công! Chúng tôi sẽ liên hệ với bạn sớm.");
            session.setAttribute("messageType", "success");
        } else {
            // Đăng ký thất bại
            session.setAttribute("message", "Đăng ký khóa học thất bại. Vui lòng thử lại.");
            session.setAttribute("messageType", "error");
        }
        
        // Chuyển hướng về trang chi tiết khóa học
        response.sendRedirect("CourseDetail?id=" + courseId);
        
    } catch (Exception e) {
        e.printStackTrace();
        session.setAttribute("message", "Có lỗi xảy ra: " + e.getMessage());
        session.setAttribute("messageType", "error");
        response.sendRedirect("CourseDetail?id=" + request.getParameter("courseID"));
    }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
