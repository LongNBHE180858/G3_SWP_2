/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import dao.SubjectDAO;
import dao.SubjectMediaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import model.Account;
import model.Subject;

/**
 *
 * @author khain
 */
@WebServlet(name = "NewSubjectServlet", urlPatterns = {"/newSubject"})
@MultipartConfig(
  fileSizeThreshold = 1024 * 1024,        // 1 MB before writing to disk
  maxFileSize = 1024 * 1024 * 50,         // max individual file size 50 MB
  maxRequestSize = 1024 * 1024 * 100      // max total request size 100 MB
)
public class NewSubjectServlet extends HttpServlet {

    // Show form + truyền expertList cho dropdown
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Kiểm tra quyền, lấy session
        HttpSession session = req.getSession(false);
        Account acc = (session != null) ? (Account) session.getAttribute("fullAccount") : null;
        if (acc == null || acc.getRoleID() != 1) { // Chỉ cho Admin
            resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            return;
        }
        List<String> categoryList = new SubjectDAO().getAllCategories();
        List<Account> expertList = new AccountDAO().getExperts();
        req.setAttribute("categoryList", categoryList);
        req.setAttribute("expertList", expertList);
        req.getRequestDispatcher("/userPages/newSubject.jsp").forward(req, resp);
    }

    // Xử lý lưu subject + media
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        // Kiểm tra quyền
        HttpSession session = req.getSession(false);
        Account acc = (session != null) ? (Account) session.getAttribute("fullAccount") : null;
        if (acc == null || acc.getRoleID() != 1) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            return;
        }

        // Lấy form data
        String subjectName = req.getParameter("subjectName");
        String category = req.getParameter("category");

        String ownerIdRaw = req.getParameter("ownerId");
        System.out.println("DEBUG ownerIdRaw = " + ownerIdRaw);

        if (ownerIdRaw == null || ownerIdRaw.isBlank()) {
            req.setAttribute("error", "Bạn phải chọn Owner/Expert!");
            doGet(req, resp);
            return;
        }

        int ownerId = Integer.parseInt(req.getParameter("ownerId"));
        boolean status = "1".equals(req.getParameter("status"));
        String description = req.getParameter("description");

        // 1. Insert Subject, lấy SubjectID mới
        int subjectID = new SubjectDAO().insertSubjectReturnId(subjectName, category, ownerId, status, description);
        if (subjectID <= 0) {
            req.setAttribute("error", "Failed to create subject.");
            doGet(req, resp);
            return;
        }

        // 2. Insert từng media vào SubjectMedia
        Collection<Part> parts = req.getParts();
        
        SubjectMediaDAO smDao = new SubjectMediaDAO();
        for (Part part : parts) {
            if ("mediaFiles".equals(part.getName()) && part.getSize() > 0) {
                String fileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                String ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
                String mediaType = (ext.matches("jpg|jpeg|png|gif") ? "image" : "video");
                // Lưu file lên thư mục /media/
                String uploadDir = req.getServletContext().getRealPath("/media/");
                new File(uploadDir).mkdirs();
                String savePath = uploadDir + File.separator + fileName;
                part.write(savePath);
                // Lưu vào DB
                smDao.insertMedia(subjectID, "media/" + fileName, mediaType, "");
            }
        }
        // Done, chuyển về SubjectList
        resp.sendRedirect(req.getContextPath() + "/SubjectList");
    }
}
