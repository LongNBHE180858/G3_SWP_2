<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- viewport để responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Course Homepage</title>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <!-- Slick Slider CSS/JS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

    <style>
        :root {
            --color-bg: #f9fafb;
            --color-card-bg: #ffffff;
            --color-primary: #4F46E5;
            --color-text: #374151;
            --color-muted: #6B7280;
            --radius: 8px;
            --transition: 0.3s ease;
        }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Poppins', sans-serif;
            background-color: var(--color-bg);
            color: var(--color-text);
            line-height: 1.6;
        }
        a { color: var(--color-primary); text-decoration: none; }
        a:hover { text-decoration: underline; }

        /* Layout chính */
        .main {
            display: flex;
            gap: 20px;
            padding: 20px 40px;
        }
        @media (max-width: 768px) {
            .main { flex-direction: column; padding: 20px; }
        }

        /* Đảm bảo flex item co được và không tràn */
        .slider-container,
        .latest-posts-container {
            min-width: 0;
        }

        /* Slider */
        .slider-container {
            flex: 3;
        }
        .slider-wrapper {
            width: 100%;
            overflow: hidden;
        }
        .slide img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            border-radius: var(--radius);
            transition: transform var(--transition);
        }
        .slide img:hover {
            transform: scale(1.02);
        }
        .slide p {
            margin: 12px 0;
            font-weight: 500;
        }
        .slick-prev, .slick-next {
            z-index: 2;
            background: var(--color-card-bg);
            border-radius: 50%;
            width: 36px; height: 36px;
            display: flex; align-items: center; justify-content: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }
        .slick-dots li button:before {
            color: var(--color-primary);
            opacity: 0.7;
        }

        /* Latest Posts */
        .latest-posts-container {
            flex: 1;
            background: var(--color-card-bg);
            border-radius: var(--radius);
            padding: 16px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            max-height: 320px;
            overflow-y: auto;
        }
        .latest-posts-container h3 {
            font-size: 1.2rem;
            margin-bottom: 12px;
            font-weight: 600;
        }
        .latest-post {
            display: flex;
            gap: 12px;
            margin-bottom: 16px;
            transition: background var(--transition);
            padding: 8px;
            border-radius: var(--radius);
        }
        .latest-post:hover {
            background: #F3F4F6;
        }
        .latest-post img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: var(--radius);
        }
        .latest-post div {
            flex: 1;
        }
        .latest-post h4 {
            font-size: 0.95rem;
            margin-bottom: 4px;
            font-weight: 500;
        }
        .latest-post .date {
            font-size: 0.85rem;
            color: var(--color-muted);
        }

        /* Featured sections */
        .section {
            padding: 20px 40px;
        }
        .section h2 {
            font-size: 1.4rem;
            margin-bottom: 16px;
            font-weight: 600;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        .card {
            background: var(--color-card-bg);
            border-radius: var(--radius);
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            overflow: hidden;
            transition: transform var(--transition), box-shadow var(--transition);
            text-align: center;
        }
        .card:hover {
            transform: translateY(-4px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }
        .card img {
            width: 100%;
            height: 140px;
            object-fit: cover;
        }
        .card h3 {
            font-size: 1rem;
            margin: 12px 8px 4px;
            font-weight: 500;
        }
        .card .date {
            font-size: 0.8rem;
            color: var(--color-muted);
            margin-bottom: 12px;
        }
    </style>
</head>
<body>
    <jsp:include page="components/header.jsp"/>

    <!-- Slider & Latest Posts -->
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
            <h3>Latest Posts</h3>
            <c:forEach var="post" items="${latestPost}">
                <div class="latest-post">
                    <img src="${post.thumbnailURL}" alt="${post.blogTitle}">
                    <div>
                        <h4><a href="#">${post.blogTitle}</a></h4>
                        <div class="date">${post.updatedDate}</div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Featured Posts -->
    <div class="section">
        <h2>Featured Posts</h2>
        <div class="grid-container">
            <c:forEach var="post" items="${latestPost}">
                <div class="card">
                    <img src="${post.thumbnailURL}" alt="${post.blogTitle}">
                    <h3><a href="#">${post.blogTitle}</a></h3>
                    <div class="date">${post.updatedDate}</div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Featured Courses -->
    <div class="section">
        <h2>Featured Courses</h2>
        <div class="grid-container">
            <c:forEach var="course" items="${hotCourse}">
                <div class="card">
                    <img src="${course.urlCourse}" alt="${course.courseTitle}">
                    <h3><a href="#">${course.courseTitle}</a></h3>
                </div>
            </c:forEach>
        </div>
    </div>

    <jsp:include page="components/footer.jsp"/>

    <!-- Slick Slider Init -->
    <script>
        $(function(){
            $('.slider').slick({
                autoplay: true,
                autoplaySpeed: 3000,
                dots: true,
                arrows: true,
                infinite: true,
                fade: true,
                speed: 800,
                cssEase: 'linear',
                prevArrow: '<button class="slick-prev">&#10094;</button>',
                nextArrow: '<button class="slick-next">&#10095;</button>'
            });
        });
    </script>
</body>
</html>
