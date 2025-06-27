<%-- 
    Document   : header.jsp
    Created on : Jun 27, 2025, 3:10:11 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    .header {
        background-color: #1E88E5;
        color: white;
        padding: 15px 40px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .header .logo {
        font-size: 22px;
        font-weight: bold;
    }
    .header .nav {
        display: flex;
        align-items: center;
        gap: 20px;
    }
    .header .nav a {
        color: white;
        text-decoration: none;
        font-size: 16px;
    }
    .header .nav a:hover {
        text-decoration: underline;
    }
</style>
<header>
    <div class="header">
        <div class="logo">Online Course</div>
        <div class="nav">
            <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
            <a href="${pageContext.request.contextPath}/MyRegistration">Courses</a>
            <a href="${pageContext.request.contextPath}/BlogListServlet">Blog</a>
            <c:choose>
                <c:when test="${not empty sessionScope.userID}">
                    <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
                    <a href="${pageContext.request.contextPath}/UserProfile">
                        <img src="https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482744KVW/anh-mo-ta.png" alt="Avatar" class="avatar" style="width:40px; height:40px; border-radius:50%;">
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>