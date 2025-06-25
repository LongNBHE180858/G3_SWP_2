<%-- 
    Document   : blogList
    Created on : Jun 1, 2025, 10:33:52 PM
    Author     : Khai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Danh sách Blog</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family: 'Segoe UI', sans-serif;
                background: linear-gradient(to right, #f9f9f9, #e6f0ff);
                color: #333;
            }

            header {
                background: linear-gradient(to right, #4a90e2, #0077cc);
                color: white;
                padding: 15px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                position: sticky;
                top: 0;
                z-index: 10;
            }

            .logo {
                font-size: 26px;
                font-weight: bold;
                letter-spacing: 1px;
            }

            .nav-links a {
                color: white;
                margin-left: 25px;
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .nav-links a:hover {
                text-decoration: underline;
                color: #ffcc00;
            }

            .container {
                display: flex;
                flex-wrap: wrap;
                padding: 30px 40px;
                gap: 30px;
            }

            .left {
                flex: 2;
                min-width: 300px;
            }

            .right {
                flex: 1;
                min-width: 250px;
            }

            .blog-card {
                background: white;
                margin-bottom: 25px;
                padding: 20px;
                border-radius: 12px;
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
                display: flex;
                gap: 20px;
                transition: transform 0.2s ease;
            }

            .blog-card:hover {
                transform: translateY(-3px);
            }

            .blog-card img {
                width: 220px;
                height: 140px;
                object-fit: cover;
                border-radius: 10px;
            }

            .blog-info {
                flex: 1;
            }

            .blog-info h3 {
                margin-top: 0;
                margin-bottom: 10px;
                color: #0077cc;
            }

            .search-box form {
                display: flex;
                gap: 8px;
            }

            .search-box input {
                flex: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 15px;
            }

            .search-box button {
                background-color: #0077cc;
                color: white;
                border: none;
                padding: 10px 14px;
                border-radius: 6px;
                font-size: 15px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .search-box button:hover {
                background-color: #005fa3;
            }

            .category-select {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                background-color: #e0f4ff;
                /* Xanh biển nhạt */
                border: 1px solid #0c98cf;
                border-radius: 6px;
                color: #333;
                font-size: 16px;
                outline: none;
                transition: border-color 0.3s ease;
            }

            .category-select:focus {
                border-color: #2196f3;
                box-shadow: 0 0 5px rgba(33, 150, 243, 0.4);
            }

            .filter-form {
                display: flex;
                align-items: center;
                gap: 10px;
                margin-bottom: 20px;
                flex-wrap: wrap;
            }

            .category-select {
                padding: 6px 10px;
                font-size: 14px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .filter-btn {
                padding: 6px 16px;
                background-color: #007bff;
                color: white;
                font-size: 14px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.2s ease;
            }

            .filter-btn:hover {
                background-color: #0056b3;
            }

            .latest-blogs h3 {
                margin-top: 0;
                margin-bottom: 15px;
                color: #0077cc;
            }

            .latest-blogs .blog-card {
                flex-direction: column;
                align-items: start;
            }

            .latest-blogs .blog-card img {
                width: 100%;
                height: 150px;
                object-fit: cover;
            }

            footer {
                background-color: #333;
                color: white;
                padding: 20px 40px;
                text-align: center;
                margin-top: 40px;
            }

            @media (max-width: 768px) {
                header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 10px;
                }

                .container {
                    flex-direction: column;
                    padding: 20px;
                }

                .nav-links a {
                    margin-left: 0;
                    margin-right: 20px;
                }
            }
        </style>
    </head>

    <body>

        <header>
            <div class="logo">Online Learn</div>
            <div class="nav-links">
                <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
                <a href="${pageContext.request.contextPath}/MyCourseServlet">Course List</a>
                <a href="${pageContext.request.contextPath}/BlogListServlet">Blog List</a>
                <a href="#">Quiz List</a>
                <a href="#">Log in</a>
                <a href="#">Register</a>
            </div>
        </header>

        <div class="container">

            <!-- Phần hiển thị danh sách blog -->
            <div class="left" id="blog-list">
                <c:choose>
                    <c:when test="${not empty blogList}">
                        <c:forEach var="blog" items="${blogList}">
                            <div class="blog-card">
                                <img src="${blog.thumbnailURL}" alt="Blog Image">
                                <div class="blog-info">
                                    <h3>${blog.blogTitle}</h3>
                                    <p>Tác giả: <strong>${blog.getAccount().getFullName()}</strong></p> <!-- Bạn có thể sửa userID thành tên nếu truy vấn SQL có -->
                                    <p>Ngày đăng: ${blog.updatedDate}</p>
                                    <p>Thể loại: <strong>${blog.getPostCategory().getCategoryName()}</strong></p> <!-- Tương tự categoryID có thể đổi tên thể loại -->
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>Không có blog nào được tìm thấy.</p>
                    </c:otherwise>
                </c:choose>

                <!-- Bạn có thể thêm nhiều blog-card ở đây -->
            </div>

            <!-- Phần sidebar: tìm kiếm, thể loại, blog mới -->
            <div class="right">
                <div class="search-box">
                    <form action="BlogListServlet" method="get"> <!-- hoặc method="post" nếu Servlet xử lý POST -->
                        <input type="text" name="search" placeholder="🔍 Tìm kiếm blog..." id="search-input" />
                        <button type="submit">Tìm kiếm</button>
                    </form>
                </div>


                <form action="BlogListServlet" method="get">
                    <label for="category-select">Thể loại:</label>
                    <select class="category-select" id="category-select" name="categoryId">
                        <option value="">-- Chọn thể loại --</option>
                        <option value="1">Tin tức giáo dục</option>
                        <option value="2">Hướng dẫn học tập</option>
                        <option value="3">Công nghệ</option>
                        <option value="4">Kinh nghiệm học tập</option>
                        <option value="5">Sự kiện</option>
                    </select>
                    <button type="submit" class="filter-btn">Lọc</button>
                </form>

                <div class="latest-blogs">
                    <h3>🆕 Blog mới nhất</h3>
                    <c:forEach var="post" items="${newestPosts}">
                        <div class="blog-card">
                            <img src="${post.thumbnailURL}" alt="Latest Blog">
                            <h4>${post.blogTitle}</h4>
                            <p>${post.updatedDate} - ${post.postCategory.categoryName}</p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>

        <footer>
            <p>📞 Contact: contact@onlinelearn.vn | ☎ 0123 456 789</p>
        </footer>

    </body>

</html>

