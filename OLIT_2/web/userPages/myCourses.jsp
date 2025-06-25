<%-- 
    Document   : myCourse
    Created on : June 03, 2025
    Author     : Nam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>My Courses - Online Learn</title>
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
            }

            /* Header */
            .header {
                background-color: #1e88e5;
                color: white;
                padding: 15px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .header .logo {
                font-size: 24px;
                font-weight: bold;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .header .nav {
                display: flex;
                gap: 20px;
            }

            .header .nav a {
                color: white;
                text-decoration: none;
                font-size: 16px;
                transition: color 0.3s;
            }

            .header .nav a:hover {
                color: #bbdefb;
            }

            /* Main Content */
            .main {
                padding: 40px;
                text-align: center;
            }

            .main .title {
                font-size: 32px;
                color: #333;
                margin-bottom: 30px;
            }

            /* Course List */
            .course-list {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
                justify-content: center;
            }

            .course-card {
                width: 300px;
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                overflow: hidden;
                transition: transform 0.3s;
            }

            .course-card:hover {
                transform: translateY(-5px);
            }

            .course-card img {
                width: 100%;
                height: 180px;
                object-fit: cover;
            }

            .course-card .content {
                padding: 15px;
            }

            .course-card h3 {
                font-size: 18px;
                color: #1e88e5;
                margin: 0 0 10px;
                text-align: left;
            }

            .course-card p {
                font-size: 14px;
                color: #666;
                margin: 0 0 10px;
                text-align: left;
                line-height: 1.5;
            }

            .course-card .instructor {
                font-size: 13px;
                color: #999;
                text-align: left;
            }

            .course-card a {
                display: inline-block;
                margin-top: 10px;
                padding: 8px 15px;
                background-color: #1e88e5;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                font-size: 14px;
            }

            .course-card a:hover {
                background-color: #1565c0;
            }

            /* No Courses Message */
            .no-courses {
                font-size: 18px;
                color: #666;
                margin-top: 20px;
            }

            /* Responsive Design */
            @media (max-width: 768px) {
                .main {
                    padding: 20px;
                }

                .course-card {
                    width: 100%;
                    max-width: 400px;
                }

                .header .nav {
                    gap: 10px;
                }

                .header .nav a {
                    font-size: 14px;
                }
            }
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header">
            <div class="logo">ONLINE LEARN</div>
            <div class="nav">
                <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
                <a href="${pageContext.request.contextPath}/MyRegistration">Courses</a>
                <a href="${pageContext.request.contextPath}/BlogListServlet">Blog</a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main">
            <h1 class="title">Online Learning Courses</h1>
            <div class="course-list">
                <c:choose>
                    <c:when test="${not empty myCourses}">
                        <c:forEach var="course" items="${myCourses}">
                            <div class="course-card">
                                <div class="content">
                                    <h3>${course.getCourseTitle()}</h3>
                                    <p>${course.getCourseDetail()}</p>
                                    <a href="${pageContext.request.contextPath}/CourseDetail?id=${course.getCourseID()}">View Course</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="no-courses">You have not registered for any courses yet.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>