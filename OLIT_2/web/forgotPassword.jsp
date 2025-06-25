<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = request.getParameter("email");
%>
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
            }

            body {
                margin: 0;
                padding: 0;
                background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
            }

            .login-container {
                background-color: white;
                padding: 40px 30px;
                border-radius: 16px;
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }

            .login-container h2 {
                text-align: center;
                margin-bottom: 24px;
                font-weight: 600;
                color: #333;
            }

            .input-field {
                width: 100%;
                padding: 12px 16px;
                margin: 12px 0;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
                transition: border-color 0.3s;
            }

            .input-field:focus {
                border-color: #4f8ef7;
                outline: none;
            }

            .button {
                width: 100%;
                padding: 12px;
                background-color: #4f8ef7;
                color: white;
                border: none;
                border-radius: 8px;
                font-size: 15px;
                font-weight: 600;
                margin-top: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .button:hover {
                background-color: #3b74d7;
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

            .err {
                color: #e74c3c;
                font-size: 14px;
                margin-top: 8px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>Reset your password</h2>
            <form action="${pageContext.request.contextPath}/ForgotPasswordServlet" method="post">
                <p>Please enter the email address you’d like your password reset information sent to</p>
                <input type="text" class="input-field" name="email" value="<%= email != null ? email : "" %>" placeholder="Enter Your Email" required>
                <c:if test="${not empty err}">
                    <p class="err">${err}</p>
                </c:if>
                <div class="links">
                    <a href="${pageContext.request.contextPath}/login.jsp">Sign in</a>
                </div>
                <input type="hidden" name="action" value="resetPassword">
                <button type="submit" class="button">Request reset link</button>
            </form>
        </div>
    </body>
</html>
