package controller;

import dao.QuestionDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.*;

@WebServlet("/QuestionListServlet")
public class QuestionListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       // --- Kiểm tra session và vai trò người dùng ---
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userID") == null || session.getAttribute("roleID") == null) {
            // Nếu không có session, userID hoặc roleID, chuyển hướng về trang đăng nhập
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        Integer roleID = (Integer) session.getAttribute("roleID");
        if (roleID == null || roleID != 2) { // Kiểm tra nếu roleID không phải là 2
            response.sendRedirect(request.getContextPath() + "/HomeServlet"); // Chuyển hướng về HomeServlet
            return;
        }

        // Lấy tham số từ request
        String search = request.getParameter("search");
        String filter = request.getParameter("filter");
        String pageSizeRaw = request.getParameter("pageSize");
        String pageIndexRaw = request.getParameter("page");

        int pageSize = 10;  // Giá trị mặc định
        int pageIndex = 1;

        try {
            if (pageSizeRaw != null && !pageSizeRaw.isEmpty()) {
                pageSize = Integer.parseInt(pageSizeRaw);
            }
            if (pageIndexRaw != null && !pageIndexRaw.isEmpty()) {
                pageIndex = Integer.parseInt(pageIndexRaw);
            }
        } catch (NumberFormatException e) {
            // Nếu lỗi thì giữ nguyên pageSize, pageIndex mặc định
        }

        QuestionDAO dao = new QuestionDAO();

        // Lấy danh sách câu hỏi theo search, filter, phân trang
        List<Question> questionList = dao.getAllQuestionWithParam(search, filter, pageSize, pageIndex);

        // Lấy tổng số bản ghi để tính số trang
        int totalRecords = dao.getTotalQuestionCount(search, filter);
        int totalPage = (int) Math.ceil((double) totalRecords / pageSize);

        // Truyền dữ liệu sang JSP
        request.setAttribute("questionList", questionList);
        request.setAttribute("search", search);
        request.setAttribute("filter", filter);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("pageIndex", pageIndex);
        request.setAttribute("totalPage", totalPage);

        request.getRequestDispatcher("/adminPages/questionList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
