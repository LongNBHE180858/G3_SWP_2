<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Sign Up</title>
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

            .input-field, select {
                width: 100%;
                padding: 12px 16px;
                margin: 12px 0;
                border: 1px solid #ddd;
                border-radius: 8px;
                font-size: 14px;
                transition: border-color 0.3s;
            }

            .input-field:focus, select:focus {
                border-color: #4f8ef7;
                outline: none;
            }

            .form-group {
                display: flex;
                align-items: center;
                gap: 10px;
                margin: 12px 0;
            }

            label {
                font-weight: 500;
                color: #444;
                flex: 0 0 80px;
                margin: 0;
            }

            select {
                flex: 1;
                width: auto;
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
            <h2>Create Your Account</h2>
            <form action="${pageContext.request.contextPath}/SignupServlet" method="post">
                <input type="text" class="input-field" name="fullName" placeholder="Full Name" required>

                <div class="form-group">
                    <label for="gender">Gender</label>
                    <select name="gender" class="input-field" id="gender" required>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other" selected>Other</option>
                    </select>
                </div>

                <input type="email" class="input-field" name="email" placeholder="Email Address" required>
                <input type="tel" class="input-field" name="phone" placeholder="Phone Number" required>

                <div class="links">
                    <a href="${pageContext.request.contextPath}/login.jsp">Sign in</a>
                </div>

                <button type="submit" class="button">Sign Up</button>

                <c:if test="${not empty err}">
                    <p class="err">${err}</p>
                </c:if>
            </form>
        </div>
    </body>
</html>