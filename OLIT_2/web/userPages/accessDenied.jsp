<%-- 
    Document   : accessDenied
    Created on : Jun 28, 2025, 5:37:05 PM
    Author     : khain
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Access Denied</title>
    <style>
        body { background: #f8f9fa; font-family: Arial; text-align: center; margin-top: 70px; }
        .error-card { background: #fff; border-radius: 15px; padding: 36px 44px; display: inline-block; box-shadow: 0 2px 24px rgba(0,0,0,0.10);}
        h1 { color: #d22323; margin-bottom: 18px; }
        p { color: #2d334d; font-size: 1.15em;}
        a { color: #337af7; text-decoration: underline;}
    </style>
</head>
<body>
    <div class="error-card">
        <h1>Access Denied</h1>
        <p>You do not have permission to view this page.<br>
        Only <b>Admin</b> or <b>Expert</b> can access this feature.</p>
        <p><a href="login.jsp">Back to Login</a></p>
    </div>
</body>
</html>
