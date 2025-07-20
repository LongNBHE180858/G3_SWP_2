package controller;

import dao.RegistrationDAO;
import dao.SubjectDAO;
import model.Registration;
import model.Subject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminRegistrationListServlet", urlPatterns = {"/AdminRegistrationListServlet"})
public class AdminRegistrationListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Đã loại bỏ kiểm tra quyền admin - cho phép tất cả người dùng truy cập

        RegistrationDAO registrationDAO = new RegistrationDAO();
        List<Registration> registrationList = registrationDAO.getAllRegistrationsForAdmin();
        request.setAttribute("registrationList", registrationList);

        SubjectDAO subjectDAO = new SubjectDAO();
        List<Subject> subjectList = subjectDAO.getAllSubjects();
        request.setAttribute("subjectList", subjectList);

        // Thống kê
        int totalRegistrations = registrationList.size();
        int pendingCount = 0, approvedCount = 0, rejectedCount = 0, cancelledCount = 0;
        for (Registration reg : registrationList) {
            switch (reg.getStatus()) {
                case "Pending": pendingCount++; break;
                case "Approved": approvedCount++; break;
                case "Rejected": rejectedCount++; break;
                case "Cancelled": cancelledCount++; break;
            }
        }
        request.setAttribute("totalRegistrations", totalRegistrations);
        request.setAttribute("pendingCount", pendingCount);
        request.setAttribute("approvedCount", approvedCount);
        request.setAttribute("rejectedCount", rejectedCount);
        request.setAttribute("cancelledCount", cancelledCount);

        // Forward tới JSP
        request.getRequestDispatcher("/adminPages/adminRegistrationList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("updateStatus".equals(action)) {
            String regIdStr = request.getParameter("registrationID");
            String newStatus = request.getParameter("newStatus");
            if (regIdStr != null && newStatus != null && (newStatus.equals("Approved") || newStatus.equals("NotApproved"))) {
                try {
                    int regId = Integer.parseInt(regIdStr);
                    RegistrationDAO dao = new RegistrationDAO();
                    // Chỉ cho phép cập nhật nếu trạng thái hiện tại là Pending
                    List<Registration> regs = dao.getAllRegistrationsForAdmin();
                    Registration reg = regs.stream().filter(r -> r.getRegistrationID() == regId).findFirst().orElse(null);
                    if (reg != null && "Pending".equals(reg.getStatus())) {
                        // Nếu chọn NotApproved thì lưu là NotApproved trong DB
                        String dbStatus = newStatus.equals("NotApproved") ? "NotApproved" : "Approved";
                        dao.updateRegistrationStatus(regId, dbStatus);
                        request.setAttribute("message", "Status updated successfully!");
                    } else {
                        request.setAttribute("error", "Only registrations in Pending status can be approved.");
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid ID.");
                }
            } else {
                request.setAttribute("error", "Missing information or invalid status.Missing information or invalid status.");
            }
        }
        // Sau khi xử lý, load lại danh sách
        doGet(request, response);
    }
} 