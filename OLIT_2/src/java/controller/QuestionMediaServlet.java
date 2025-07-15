package controller;

import dao.QuestionMediaDAO;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Arrays;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import model.QuestionMedia;

@WebServlet("/questionMedia")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,      // 1MB
    maxFileSize = 1024 * 1024 * 5,        // 5MB
    maxRequestSize = 1024 * 1024 * 10     // 10MB
)
public class QuestionMediaServlet extends HttpServlet {
    private static final String UPLOAD_DIR = "uploads";
    private static final List<String> ALLOWED_EXTENSIONS = Arrays.asList(
        ".jpg", ".jpeg", ".png", ".gif", ".pdf", ".docx", ".txt", ".mp4", ".avi"
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("view".equals(action)) {
            String questionIDStr = request.getParameter("questionID");
            if (questionIDStr != null) {
                int questionID = Integer.parseInt(questionIDStr);
                List<QuestionMedia> mediaList = QuestionMediaDAO.getQuestionAnswerByQuestionID(questionID);
                request.setAttribute("mediaList", mediaList);
                request.setAttribute("questionID", questionID);
            }
        }
        request.getRequestDispatcher("questionMedia.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if ("upload".equals(action)) {
                handleFileUpload(request, response);
            } else if ("update".equals(action)) {
                handleUpdateMedia(request, response);
            } else if ("delete".equals(action)) {
                handleDeleteMedia(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            request.getRequestDispatcher("questionMedia.jsp").forward(request, response);
        }
    }

    private void handleFileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int questionID = Integer.parseInt(request.getParameter("questionID"));
        String mediaDescription = request.getParameter("mediaDescription");
        int mediaType = Integer.parseInt(request.getParameter("mediaType"));
        Part filePart = request.getPart("file");

        String fileName = getFileName(filePart);
        if (!isValidFile(filePart, fileName)) {
            request.setAttribute("error", "File không hợp lệ hoặc quá lớn");
            request.getRequestDispatcher("questionMedia.jsp").forward(request, response);
            return;
        }

        String fileExtension = getFileExtension(fileName);
        String newFileName = UUID.randomUUID().toString() + fileExtension;

        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        filePart.write(uploadPath + File.separator + newFileName);

        boolean success = QuestionMediaDAO.createQuestionMedia(
            questionID,
            newFileName,
            mediaType,
            mediaDescription
        );

        if (success) {
            response.sendRedirect("questionMedia?action=view&questionID=" + questionID);
        } else {
            request.setAttribute("error", "Lỗi khi lưu thông tin file vào database");
            request.getRequestDispatcher("questionMedia.jsp").forward(request, response);
        }
    }

    private void handleUpdateMedia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int questionID = Integer.parseInt(request.getParameter("questionID"));
        int mediaID = Integer.parseInt(request.getParameter("mediaID"));
        int mediaType = Integer.parseInt(request.getParameter("mediaType"));
        String mediaDescription = request.getParameter("mediaDescription");
        Part filePart = request.getPart("file");

        String mediaURL = request.getParameter("currentMediaURL");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getFileName(filePart);
            if (isValidFile(filePart, fileName)) {
                String fileExtension = getFileExtension(fileName);
                String newFileName = UUID.randomUUID().toString() + fileExtension;
                String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
                filePart.write(uploadPath + File.separator + newFileName);
                mediaURL = newFileName;
            }
        }

        boolean success = QuestionMediaDAO.changeQuestionMedia(
            questionID,
            mediaID,
            mediaURL,
            mediaType,
            mediaDescription
        );

        if (success) {
            response.sendRedirect("questionMedia?action=view&questionID=" + questionID);
        } else {
            request.setAttribute("error", "Lỗi khi cập nhật media");
            request.getRequestDispatcher("questionMedia.jsp").forward(request, response);
        }
    }

    private void handleDeleteMedia(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int mediaID = Integer.parseInt(request.getParameter("mediaID"));
        int questionID = Integer.parseInt(request.getParameter("questionID"));

        boolean success = QuestionMediaDAO.deleteQuestionMedia(mediaID);

        if (success) {
            response.sendRedirect("questionMedia?action=view&questionID=" + questionID);
        } else {
            request.setAttribute("error", "Lỗi khi xóa media");
            request.getRequestDispatcher("questionMedia.jsp").forward(request, response);
        }
    }

    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }

    private String getFileExtension(String fileName) {
        int dot = fileName.lastIndexOf('.');
        return (dot == -1) ? "" : fileName.substring(dot);
    }

    private boolean isValidFile(Part part, String fileName) {
        if (part.getSize() > 5 * 1024 * 1024) {
            return false;
        }
        String ext = getFileExtension(fileName).toLowerCase();
        return ALLOWED_EXTENSIONS.contains(ext);
    }
}
