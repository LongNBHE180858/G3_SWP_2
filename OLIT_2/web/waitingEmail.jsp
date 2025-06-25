<%-- 
    Document   : waitingEmail
    Created on : Jun 23, 2025, 11:16:57 AM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Waiting Email</title>
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
                text-align: center;
            }

            .login-container h2 {
                text-align: center;
                margin-bottom: 24px;
                font-weight: 600;
                color: #333;
            }

            .login-container p {
                margin: 0 0 16px 0;
                color: #333;
                font-size: 14px;
            }

            .login-container a {
                color: #4f8ef7;
                text-decoration: none;
                font-weight: bold;
            }

            .login-container a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2>${action}</h2>
            <p>The link has been sent to email: 
                <a href="mailto:${email}" onclick="openWebmail('${email}'); return false;">
                    ${email}
                </a>
            </p>
        </div>
        <script>
            function openWebmail(email) {
                const domain = email.split('@')[1].toLowerCase();

                const webmailUrls = {
                    'gmail.com': 'https://mail.google.com/',
                    'outlook.com': 'https://outlook.live.com/',
                    'hotmail.com': 'https://outlook.live.com/',
                    'live.com': 'https://outlook.live.com/',
                    'yahoo.com': 'https://mail.yahoo.com/'
                };

                if (webmailUrls[domain]) {
                    window.open(webmailUrls[domain], '_blank');
                } else {
                    // Fallback to mailto for other email providers
                    window.location.href = 'mailto:' + email;
                }
            }
        </script>
    </body>
</html>