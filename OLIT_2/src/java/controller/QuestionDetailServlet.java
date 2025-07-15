package controller;

import dao.SubjectDAO;
import dao.DimensionDAO;
import dao.LessonDAO;
import dao.QuestionDAO;
import dao.QuestionAnswerDAO;
import dao.QuestionMediaDAO;
import model.Subject;
import model.Dimension;
import model.Lesson;
import model.Question;
import model.QuestionAnswer;
import model.QuestionMedia;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/QuestionDetailServlet")
public class QuestionDetailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String qid = request.getParameter("questionID");
        if (qid == null || qid.isBlank()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameter questionID");
            return;
        }
        int questionID = Integer.parseInt(qid);

        Subject subject = SubjectDAO.getSubjectByID(questionID);
        List<Dimension> dimensions = DimensionDAO.getDimensionsByQuestionID(questionID);
        Question question = QuestionDAO.getQuesionByID(questionID);
        Lesson lesson = LessonDAO.getLessonByID(question.getLessonID());
        List<QuestionAnswer> answers = QuestionAnswerDAO.getQuestionAnswerByQuestionID(questionID);
        List<QuestionMedia> medias = QuestionMediaDAO.getQuestionAnswerByQuestionID(questionID);

        request.setAttribute("subject", subject);
        request.setAttribute("dimensions", dimensions);
        request.setAttribute("lesson", lesson);
        request.setAttribute("question", question);
        request.setAttribute("questionAnswers", answers);
        request.setAttribute("questionMedias", medias);
        request.getRequestDispatcher("userPages/questionDetail.jsp").forward(request, response);
    }

    @Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");
    String qid    = request.getParameter("questionID");
    if (qid == null || qid.isBlank()) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing parameter questionID");
        return;
    }
    int questionID = Integer.parseInt(qid);

    switch (action == null ? "" : action) {
        case "saveChanges":
            // --- Update Question ---
            Question q = new Question();
            q.setQuestionID(questionID);
            q.setQuestionContent(request.getParameter("questionContent"));
            q.setStatus("1".equals(request.getParameter("status")));
            new QuestionDAO().update(q);

            // --- Update existing Answers ---
            String[] ansIds = request.getParameterValues("answerID");
            if (ansIds != null) {
                String[] dets = request.getParameterValues("answerDetail");
                String[] exps = request.getParameterValues("explanation");
                String[] cors = request.getParameterValues("isCorrect");
                for (int i = 0; i < ansIds.length; i++) {
                    QuestionAnswerDAO.changeQuestionAnswer(
                        questionID,
                        Integer.parseInt(ansIds[i]),
                        dets[i],
                        exps[i],
                        "1".equals(cors[i])
                    );
                }
            }
            // --- Create new Answers ---
            String[] newD = request.getParameterValues("newAnswerDetail");
            if (newD != null) {
                String[] newE = request.getParameterValues("newExplanation");
                String[] newC = request.getParameterValues("newIsCorrect");
                for (int i = 0; i < newD.length; i++) {
                    if (!newD[i].isBlank()) {
                        QuestionAnswerDAO.createQuestionAnswer(
                            questionID,
                            newD[i],
                            newE[i],
                            "1".equals(newC[i])
                        );
                    }
                }
            }

            // redirect back to detail view
            response.sendRedirect(request.getContextPath()
                + "/QuestionDetailServlet?questionID=" + questionID);
            break;

        case "saveMediaList":
            // --- Re-create Media list ---
            // delete old
            List<QuestionMedia> oldMedia = QuestionMediaDAO.getQuestionAnswerByQuestionID(questionID);
            for (QuestionMedia m : oldMedia) {
                QuestionMediaDAO.deleteQuestionMedia(m.getMediaId());
            }
            // create new from form
            String[] mUrls  = request.getParameterValues("mediaURL");
            String[] mTypes = request.getParameterValues("mediaType");
            String[] mDescs = request.getParameterValues("mediaDescription");
            if (mUrls != null) {
                for (int i = 0; i < mUrls.length; i++) {
                    QuestionMediaDAO.createQuestionMedia(
                        questionID,
                        mUrls[i],
                        Integer.parseInt(mTypes[i]),
                        mDescs[i]
                    );
                }
            }
             response.sendRedirect(request.getContextPath()
                + "/QuestionDetailServlet?questionID=" + questionID);
            break;

        case "deleteAnswer":
            String aIdStr = request.getParameter("qaId");
            if (aIdStr != null) {
                int aId = Integer.parseInt(aIdStr);
                QuestionAnswerDAO.deleteQuestionAnswerByID(aId);
                response.getWriter().write("success");
            } else {
                response.getWriter().write("fail");
            }
            break;

        case "deleteQuestion":
            boolean ok = new QuestionDAO().deleteQuestionByID(questionID);
            if (ok) {
                response.sendRedirect(request.getContextPath() + "/QuestionListServlet");
            } else {
                response.getWriter().write("fail");
            }
            break;

        default:
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
    }
}
}
