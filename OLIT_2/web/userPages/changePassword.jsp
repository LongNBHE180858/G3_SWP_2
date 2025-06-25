<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Reset Password</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Inter', sans-serif;
                margin: 0;
                padding: 0;
            }

            body {
                background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .login-container {
                background-color: #ffffff;
                padding: 40px 30px;
                border-radius: 16px;
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 420px;
                text-align: center;
            }

            .login-container h2 {
                margin-bottom: 24px;
                color: #222;
                font-size: 22px;
                font-weight: 600;
            }

            .input-field {
                width: 100%;
                padding: 12px 16px;
                margin: 12px 0;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
                transition: border-color 0.3s ease;
            }

            .input-field:focus {
                outline: none;
                border-color: #4f8ef7;
                box-shadow: 0 0 5px rgba(79, 142, 247, 0.4);
            }

            .button {
                width: 100%;
                padding: 13px;
                background-color: #4f8ef7;
                color: white;
                font-size: 15px;
                font-weight: 600;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                margin-top: 16px;
                transition: background-color 0.3s;
            }

            .button:hover {
                background-color: #3b74d7;
            }

            .error-msg {
                color: red;
                font-size: 14px;
                margin-top: 14px;
            }

            .password-hint {
                font-size: 13px;
                color: #555;
                text-align: left;
                margin-top: -6px;
                margin-bottom: 10px;
            }
            .links {
                display: flex;
                justify-content: space-between;
                margin: 10px 0 0 0;
                font-size: 13px;
            }

            .links a {
                color: #4f8ef7;
                text-decoration: none;
            }

            .links a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <form action="${pageContext.request.contextPath}/ChangePasswordServlet" method="post">
                <h2>Change Password</h2>
                <input type="password" name="oldPassword" class="input-field" placeholder="Old Password" required>

                <input type="password" name="newPassword" class="input-field" placeholder="New Password" required>
                <div class="password-hint">
                    • At least 8 characters<br>
                    • Includes uppercase, lowercase, number and special character
                </div>
                <input type="password" name="confirmPassword" class="input-field" placeholder="Confirm Password" required>
                <a href="${pageContext.request.contextPath}/forgotPassword.jsp">Forgot Password?</a>
                <input type="hidden" name="action" value="changePassword">
                <button type="submit" class="button">Save Change</button>

                <c:if test="${not empty error}">
                    <p class="error-msg">${error}</p>
                </c:if>
            </form>
        </div>
    </body>
</html>
