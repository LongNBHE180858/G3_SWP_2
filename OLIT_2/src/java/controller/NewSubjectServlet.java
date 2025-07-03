package controller;

import dao.AccountDAO;
import dao.SubjectDAO;
import dao.SubjectMediaDAO;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import model.Account;

@WebServlet(name = "NewSubjectServlet", urlPatterns = {"/newSubject"})
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1MB
        maxFileSize = 1024 * 1024 * 50, // 50MB/file
        maxRequestSize = 1024 * 1024 * 100 // 100MB total
)
public class NewSubjectServlet extends HttpServlet {

    // Hiển thị form, load category + expert từ DB
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Kiểm quyền (nếu cần)
        HttpSession session = req.getSession();
        Account acc = (session != null) ? (Account) session.getAttribute("fullAccount") : null;
        if (acc == null || acc.getRoleID() != 1) {
            resp.sendRedirect(req.getContextPath() + "/userPages/accessDenied.jsp");
            return;
        }

        // Load data cho dropdown
        List<String> categoryList = new SubjectDAO().getAllCategories();
        List<Account> expertList = new AccountDAO().getExperts();

        req.setAttribute("categoryList", categoryList);
        req.setAttribute("expertList", expertList);

        // Forward đến JSP mới của bạn 
        req.getRequestDispatcher("/userPages/newSubject.jsp")
                .forward(req, resp);
    }

    // Xử lý khi bấm Save
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        Account acc = (session != null) ? (Account) session.getAttribute("fullAccount") : null;
        if (acc == null || acc.getRoleID() != 1) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied.jsp");
            return;
        }

        // 1) Đọc form fields
        String subjectName = req.getParameter("subjectName");
        String category = req.getParameter("category");
        String ownerRaw = req.getParameter("ownerId");
        String statusRaw = req.getParameter("status");
        String description = req.getParameter("description");

        if (ownerRaw == null || ownerRaw.isBlank()) {
            req.setAttribute("error", "Bạn phải chọn Owner/Expert!");
            doGet(req, resp);
            return;
        }

        int ownerId = Integer.parseInt(ownerRaw);
        boolean featuredFlag = req.getParameter("featuredFlag") != null;
        boolean status = "1".equals(statusRaw);

        // 2) Lưu Subject, lấy ID
        int subjectID = new SubjectDAO().insertSubjectReturnId(subjectName, category, ownerId, featuredFlag, status, description);
        if (subjectID <= 0) {
            req.setAttribute("error", "Tạo Subject thất bại!");
            doGet(req, resp);
            return;
        }

        // 3) Lưu từng file media vào /uploads và SubjectMedia
        String uploadPath = req.getServletContext().getRealPath("/uploads");
        new File(uploadPath).mkdirs();
        SubjectMediaDAO smDao = new SubjectMediaDAO();

        for (Part part : req.getParts()) {
            if ("mediaFiles".equals(part.getName()) && part.getSize() > 0) {
                String fileName = Paths
                        .get(part.getSubmittedFileName())
                        .getFileName()
                        .toString();
                String ext = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();
                String mediaType = ext.matches("jpg|jpeg|png|gif")
                        ? "image"
                        : "video";
                // Save file
                String filePath = uploadPath + File.separator + fileName;
                part.write(filePath);
                // Save record vào DB
                String url = "uploads/" + fileName;
                smDao.insertMedia(subjectID, url, mediaType, fileName);
            }
        }

        // 4) Chuyển về trang danh sách
        resp.sendRedirect(req.getContextPath() + "/SubjectList");
    }
}
