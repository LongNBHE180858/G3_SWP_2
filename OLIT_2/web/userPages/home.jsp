<%--
    Document   : home
    Created on : May 30, 2025, 2:31:57 PM
    Author     : Long0
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Online Course Homepage</title>
        <!-- Thêm jQuery và Slick Slider CSS/JS -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
        <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #F4F4F4;
            }
            /* Header */
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
            /* Slider + latest posts */
            .main {
                display: flex;
                margin: 20px 40px;
                gap: 20px;
                align-items: flex-start;
            }
            .slider-container {
                flex: 3;
                max-width: 70%;
            }
            .slider-wrapper {
                width: 100%;
                overflow: hidden;
            }
            .slider {
                display: flex;
            }
            .slide {
                width: 100%;
                text-align: center;
            }
            .slide img {
                width: 100%;
                height: 300px;
                object-fit: cover;
                border-radius: 5px;
            }
            .slide p {
                margin: 10px 0;
                font-size: 18px;
                color: #333;
            }
            /* Slick Slider dots and arrows */
            .slick-prev, .slick-next {
                z-index: 1;
            }
            .slick-dots {
                bottom: 10px;
            }
            .slick-dots li button:before {
                color: #1E88E5;
            }
            .latest-posts {
                flex: 1;
                background-color: white;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                height: 300px;
                overflow-y: auto;
            }
            .latest-posts h3 {
                margin-top: 0;
                font-size: 18px;
            }
            .latest-post {
                display: flex;
                flex-direction: column;
                align-items: center;
                margin-bottom: 15px;
                text-align: center;
            }
            .latest-post img {
                width: 100%;
                height: 100px;
                object-fit: cover;
                border-radius: 4px;
            }
            .latest-post h4 {
                font-size: 14px;
                margin: 8px 0 5px;
            }
            .latest-post .date {
                font-size: 12px;
                color: gray;
            }
            .latest-post a {
                text-decoration: none;
                color: #1E88E5;
            }
            .latest-post a:hover {
                text-decoration: underline;
            }
            /* Hot posts */
            .hot-posts {
                padding: 20px 40px;
                margin-top: 0;
            }
            .hot-posts h2 {
                margin-bottom: 15px;
            }
            .hot-posts-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }
            .hot-post {
                width: 200px;
                background-color: white;
                padding: 10px;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0,0,0,0.1);
                text-align: center;
            }
            .hot-post img {
                width: 100%;
                height: 120px;
                object-fit: cover;
                border-radius: 4px;
            }
            .hot-post h3 {
                font-size: 16px;
                margin: 10px 0 5px;
            }
            .hot-post .date {
                font-size: 13px;
                color: gray;
            }
            .hot-post a {
                text-decoration: none;
                color: #1E88E5;
            }
            .hot-post a:hover {
                text-decoration: underline;
            }
            /* Footer */
            .footer {
                background-color: #1E88E5;
                color: white;
                text-align: center;
                padding: 20px;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="logo">Online Course</div>
            <div class="nav">
                <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
                <a href="${pageContext.request.contextPath}/MyRegistration">Course</a>
                <a href="${pageContext.request.contextPath}/BlogListServlet">Blog</a>
                <c:choose>
                    <c:when test="${not empty sessionScope.userID}">
                        <a href="${pageContext.request.contextPath}/Logout">Logout</a>
                        <a href="${pageContext.request.contextPath}/UserProfile">
                            <img src="https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482744KVW/anh-mo-ta.png" alt="Avatar" class="avatar" style="width:40px; height:40px; border-radius:50%;">
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/Login">Login</a>
                        <a href="${pageContext.request.contextPath}/Register">Register</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <!-- Slider and Latest Posts -->
        <div class="main">
            <div class="slider-container">
                <div class="slider-wrapper">
                    <div class="slider">
                        <c:forEach var="slider" items="${listSlider}">
                            <div class="slide">
                                <a href="${slider.backLink}">
                                    <img src="${slider.imageUrl}" alt="${slider.title}" />
                                </a>
                                <p>${slider.title}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="latest-posts-container">
                <h3>Bài viết mới nhất</h3>
                <c:forEach var="post" items="${latestPost}">
                    <div class="latest-post">
                        <img src="${post.thumbnailURL}" alt="${post.blogTitle}">
                        <h4><a href="#">${post.blogTitle}</a></h4>
                        <div class="date">${post.updatedDate}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Hot Posts -->
        <div class="hot-posts">
            <h2>Bài viết nổi bật</h2>
            <div class="hot-posts-container">
                <c:forEach var="post" items="${latestPost}">
                    <div class="hot-post">
                        <img src="${post.thumbnailURL}" alt="${post.blogTitle}">
                        <h4><a href="#">${post.blogTitle}</a></h4>
                        <div class="date">${post.updatedDate}</div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="hot-posts">
            <h2>Khóa học nổi bật</h2>
            <div class="hot-posts-container">
                <c:forEach var="course" items="${hotCourse}">
                    <div class="hot-post">
                        <img src="${course.urlCourse}" alt="${course.courseTitle}">
                        <h4><a href="#">${course.courseTitle}</a></h4>
                    </div>
                </c:forEach>
            </div>
        </div>
        <!-- Footer -->
        <div class="footer">
            © 2025 Online Course. All rights reserved.
        </div>
        <!-- Khởi tạo Slick Slider -->
        <script>
            $(document).ready(function () {
                $('.slider').slick({
                    autoplay: true,
                    autoplaySpeed: 3000,
                    dots: true,
                    arrows: true,
                    infinite: true,
                    fade: true,
                    speed: 1000,
                    cssEase: 'linear',
                    prevArrow: '<button type="button" class="slick-prev">Previous</button>',
                    nextArrow: '<button type="button" class="slick-next">Next</button>'
                });
            });
        </script>
    </body>
</html>