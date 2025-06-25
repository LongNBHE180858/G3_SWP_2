package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import dal.DBContext;
import dao.AccountDAO;
import java.util.ArrayList;
import model.Account;
import validate.InputValidator;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author macbook
 */
@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action.equalsIgnoreCase("changePassword")) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                String userEmail = (String) session.getAttribute("userEmail");
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                String confirm = request.getParameter("confirmPassword");

                if (!AccountDAO.getAccountByMail(userEmail).getPassword().equals(oldPassword)) {
                    request.setAttribute("error", "Incorrect password, please re-enter");
                    request.getRequestDispatcher("userPages/changePassword.jsp?email=" + userEmail).forward(request, response);
                    return;
                } else if (oldPassword.equals(newPassword)) {
                    request.setAttribute("error", "New password must be different from old password");
                    request.getRequestDispatcher("userPages/changePassword.jsp?email=" + userEmail).forward(request, response);
                    return;
                } else if (!InputValidator.isStrongPass(newPassword)) {
                    request.setAttribute("error", "Password must be at least 8 characters including numbers, letters and special characters.");
                    request.getRequestDispatcher("userPages/changePassword.jsp?email=" + userEmail).forward(request, response);
                    return;
                } else if (!newPassword.equals(confirm)) {
                    request.setAttribute("error", "Passwords do not match.");
                    request.getRequestDispatcher("userPages/changePassword.jsp?email=" + userEmail).forward(request, response);
                    return;
                }
                boolean success = AccountDAO.updatePasswordAndActivate(userEmail, newPassword);
                if (success) {
                    response.sendRedirect("userPages/userProfile.jsp");
                } else {
                    request.setAttribute("error", "Failed to change the password.");
                    request.getRequestDispatcher("userPages/changePassword.jsp?email=" + userEmail).forward(request, response);
                }
            }
        }

        if (action.equalsIgnoreCase("setPassword")) {
            String userEmail = request.getParameter("email");
            String newPassword = request.getParameter("newPassword");
            String confirm = request.getParameter("confirmPassword");
            if (!InputValidator.isStrongPass(newPassword)) {
                request.setAttribute("error", "Password must be at least 8 characters including numbers, letters and special characters.");
                request.getRequestDispatcher("userPages/setPassword.jsp?email=" + userEmail).forward(request, response);
                return;
            } else if (!newPassword.equals(confirm)) {
                request.setAttribute("error", "Passwords do not match.");
                request.getRequestDispatcher("userPages/setPassword.jsp?email=" + userEmail).forward(request, response);
                return;
            }
            boolean success = AccountDAO.updatePasswordAndActivate(userEmail, newPassword);
            if (success) {
                Account loggedInAccount = AccountDAO.getAccountByMail(userEmail);
                HttpSession session = request.getSession();
                session.setAttribute("userID", loggedInAccount.getUserID());
                session.setAttribute("roleID", loggedInAccount.getRoleID());
                session.setAttribute("userEmail", loggedInAccount.getEmail());
                session.setAttribute("fullAccount", loggedInAccount);
                response.sendRedirect(request.getContextPath() + "/HomeServlet");
            } else {
                request.setAttribute("error", "Failed to set the password.");
                request.getRequestDispatcher("userPages/setPassword.jsp?email=" + userEmail).forward(request, response);
            }
        }
    }
}
