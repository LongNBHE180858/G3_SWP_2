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

    /* Phần logo và tên (từ header-left gốc) */
    .header-left {
        display: flex;
        align-items: center;
        gap: 16px; /* khoảng cách giữa logo và chữ */
    }
    .logo-img {
        height: 54px;       /* chiều cao logo */
        width: auto;
        padding: 4px;       /* khoảng trắng quanh icon */
        border-radius: 8px;
        background: rgba(255,255,255,0.15);
        box-shadow: 0 2px 8px rgba(0,0,0,0.2);
        display: block;
    }
    .logo-text {
        font-size: 2.1em;
        font-weight: 700;
        color: #fff;
        letter-spacing: 1.5px;
        font-family: inherit;
        line-height: 1;
    }

    /* Phần menu bên phải (giữ nguyên style .nav hiện tại) */
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
    /* Nếu cần style cho avatar */
    .header .nav .avatar {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        cursor: pointer;
        object-fit: cover;
    }
</style>

<header>
    <div class="header">
        <!-- Logo + tên -->
        <div class="header-left">
            <img class="logo-img" src="images/HeaderIcon.png" alt="Logo">
            <span class="logo-text">CourseAura</span>
        </div>

        <!-- Menu / phần nav (giữ nguyên từ trước) -->
        <div class="nav">
            <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
            <a href="${pageContext.request.contextPath}/MyRegistration">Courses</a>
            <a href="${pageContext.request.contextPath}/BlogListServlet">Blog</a>

            <c:choose>
                <c:when test="${not empty sessionScope.userID}">
                    <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
                    <a href="${pageContext.request.contextPath}/UserProfile">
                        <img src="${sessionScope.avatarUrl != null 
                                    ? sessionScope.avatarUrl 
                                    : 'images/avatar-default.png'}"
                             alt="Avatar"
                             class="avatar">
                    </a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login.jsp">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</header>
