/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.DimensionDAO;
import dao.LessonDAO;
import dao.QuestionAnswerDAO;
import dao.QuestionDAO;
import dao.SubjectDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;
import model.Dimension;
import model.Lesson;
import model.Question;
import model.Subject;

/**
 *
 * @author Long0
 */
@WebServlet(name = "CreateQuestionServlet", urlPatterns = {"/CreateQuestionServlet"})
public class CreateQuestionServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CreateQuestionServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateQuestionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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

        SubjectDAO sj = new SubjectDAO();
        List<Subject> subjects = sj.getAllPublishedSubjects();
        List<Dimension> dimensions = DimensionDAO.getAllDimension();

        List<Lesson> lessons = LessonDAO.getAllLesson();

        request.setAttribute("subjects", subjects);
        request.setAttribute("dimensions", dimensions);
        request.setAttribute("lessons", lessons);
        request.getRequestDispatcher("adminPages/createQuestion.jsp").forward(request, response);
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
//        int subject = Integer.parseInt(request.getParameter("subject"));
//        int lesson = Integer.parseInt(request.getParameter("lesson"));
//        int statusInt = Integer.parseInt(request.getParameter("status"));
//        boolean status = (statusInt == 1);
//        String questionContent = request.getParameter("questionContent");
//        int userID = Integer.parseInt(request.getParameter("userID"));
//        int lv = Integer.parseInt(request.getParameter("lv"));
//        Question question = new Question(questionContent, 1, status, lv, userID, subject, lesson);
//        int questionID = QuestionDAO.insertQuestion(question);
//
//        String[] dimensions = request.getParameterValues("dimensions");
//        if (dimensions != null && questionID != -1) {
//            for (int i = 0; i < dimensions.length; i++) {
//                if (!dimensions[i].isBlank()) {
//                    int dimension = Integer.parseInt(dimensions[i]);
//                    DimensionDAO.insertQuestionDimension(questionID, dimension);
//                }
//            }
//        }
//        // --- Create new Answers ---
//        String[] newD = request.getParameterValues("newAnswerDetail");
//        if (newD != null && questionID != -1) {
//            String[] newE = request.getParameterValues("newExplanation");
//            String[] newC = request.getParameterValues("newIsCorrect");
//            for (int i = 0; i < newD.length; i++) {
//                if (!newD[i].isBlank()) {
//                    QuestionAnswerDAO.createQuestionAnswer(
//                            questionID,
//                            newD[i],
//                            newE[i],
//                            "1".equals(newC[i]));
//                }
//            }
//        }
//
//        response.sendRedirect(request.getContextPath() + "/QuestionListServlet");
        String errorMessage = null; // Biến để lưu thông báo lỗi

        try {
            // 1. Lấy và kiểm tra các thông tin cơ bản của câu hỏi
            String subjectParam = request.getParameter("subject");
            String lessonParam = request.getParameter("lesson");
            String statusParam = request.getParameter("status");
            String questionContent = request.getParameter("questionContent");
            String userIDParam = request.getParameter("userID");
            String lvParam = request.getParameter("lv");

            if (subjectParam == null || lessonParam == null || statusParam == null
                    || questionContent == null || questionContent.trim().isEmpty()
                    || userIDParam == null || lvParam == null) {
                errorMessage = "Please fill in all required question fields.";
            }

            int subject = -1;
            int lesson = -1;
            boolean status = false;
            int userID = -1;
            int lv = -1;

            if (errorMessage == null) {
                try {
                    subject = Integer.parseInt(subjectParam);
                    lesson = Integer.parseInt(lessonParam);
                    int statusInt = Integer.parseInt(statusParam);
                    status = (statusInt == 1); // Fix logic: 1 is true (Active)
                    userID = Integer.parseInt(userIDParam);
                    lv = Integer.parseInt(lvParam);
                } catch (NumberFormatException e) {
                    errorMessage = "Invalid numeric input for subject, lesson, status, user ID, or level.";
                }
            }

            // 2. Kiểm tra ít nhất 2 đáp án và ít nhất 1 đáp án đúng
            String[] newAnswerDetails = request.getParameterValues("newAnswerDetail");
            String[] newExplanations = request.getParameterValues("newExplanation");
            String[] newIsCorrects = request.getParameterValues("newIsCorrect");

            if (newAnswerDetails == null || newAnswerDetails.length < 2) {
                errorMessage = "A question must have at least 2 answers.";
            } else {
                boolean hasCorrectAnswer = false;
                for (int i = 0; i < newAnswerDetails.length; i++) {
                    if (newAnswerDetails[i] == null || newAnswerDetails[i].trim().isEmpty()) {
                        errorMessage = "Please fill in all answer details.";
                        break;
                    }
                    if (newIsCorrects != null && i < newIsCorrects.length && "1".equals(newIsCorrects[i])) {
                        hasCorrectAnswer = true;
                    }
                }
                if (errorMessage == null && !hasCorrectAnswer) {
                    errorMessage = "At least one answer must be marked as correct.";
                }
            }

            // Nếu có lỗi, đặt thông báo lỗi và forward lại trang JSP
            if (errorMessage != null) {
                request.setAttribute("errorMessage", errorMessage);
                // Retain previously selected values if possible (for a better UX)
                request.setAttribute("selectedSubject", subjectParam);
                request.setAttribute("selectedLesson", lessonParam);
                request.setAttribute("selectedStatus", statusParam);
                request.setAttribute("selectedLevel", lvParam);
                request.setAttribute("questionContent", questionContent);
                // Also need to pass subjects, dimensions, lessons again
                doGet(request, response); // Reuse doGet to load dropdowns etc.
                return;
            }

            // --- Nếu không có lỗi, tiến hành lưu vào DB ---
            Question question = new Question(questionContent, 1, status, lv, userID, subject, lesson);
            question.setCreatedAt(LocalDateTime.now()); // Set Creation Time

            // Sửa lại Question Type nếu cần, hiện tại đang hardcode 1
            // question.setQuestionType(Integer.parseInt(request.getParameter("questionType"))); // Nếu có input cho QuestionType
            int questionID = QuestionDAO.insertQuestion(question);

            if (questionID == -1) {
                errorMessage = "Failed to create question. Please try again.";
                request.setAttribute("errorMessage", errorMessage);
                doGet(request, response);
                return;
            }

            // Xử lý Dimensions
            String[] dimensions = request.getParameterValues("dimensions");
            if (dimensions != null) {
                for (String dimStr : dimensions) {
                    if (!dimStr.trim().isEmpty()) {
                        int dimension = Integer.parseInt(dimStr);
                        DimensionDAO.insertQuestionDimension(questionID, dimension);
                    }
                }
            }

            // Xử lý Answers mới
            // newAnswerDetails đã được kiểm tra null và length ở trên
            for (int i = 0; i < newAnswerDetails.length; i++) {
                // newAnswerDetails[i] đã được kiểm tra không rỗng ở trên
                String detail = newAnswerDetails[i].trim();
                String explanation = (newExplanations != null && i < newExplanations.length) ? newExplanations[i].trim() : "";
                boolean isCorrect = (newIsCorrects != null && i < newIsCorrects.length) && "1".equals(newIsCorrects[i]);

                QuestionAnswerDAO.createQuestionAnswer(questionID, detail, explanation, isCorrect);
            }

            // Chuyển hướng sau khi tạo thành công
            response.sendRedirect(request.getContextPath() + "/QuestionListServlet");

        } catch (Exception e) {
            e.printStackTrace();
            errorMessage = "An unexpected error occurred: " + e.getMessage();
            request.setAttribute("errorMessage", errorMessage);
            doGet(request, response); // Forward back with error
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
