<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <title>Course Detail</title>
        <style>
            :root {
                --primary: #4361ee;
                --primary-dark: #3a56d4;
                --secondary: #3f37c9;
                --accent: #4895ef;
                --danger: #f72585;
                --success: #4cc9f0;
                --warning: #f8961e;
                --light: #f8f9fa;
                --dark: #212529;
                --gray: #6c757d;
                --light-gray: #e9ecef;
                --white: #ffffff;
                --border-radius: 8px;
                --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
                --transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
            }

            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
                line-height: 1.6;
                color: var(--dark);
                background-color: #f5f7ff;
                margin: 0;
                padding: 0;
            }

            .container {
                display: flex;
                max-width: 1400px;
                margin: 0 auto;
                padding: 2rem;
                gap: 2rem;
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
                font-size: 24px;
                font-weight: bold;
            }

            .nav-links a {
                color: white;
                margin-left: 20px;
                text-decoration: none;
                font-weight: 500;
                transition: opacity 0.2s ease;
            }

            .nav-links a:hover {
                opacity: 0.8;
            }

            .main {
                flex: 3;
                background: var(--white);
                border-radius: var(--border-radius);
                box-shadow: var(--box-shadow);
                padding: 2.5rem;
                transition: var(--transition);
            }

            .sidebar {
                flex: 1;
                background: var(--white);
                border-radius: var(--border-radius);
                box-shadow: var(--box-shadow);
                padding: 2rem;
                align-self: flex-start;
                position: sticky;
                top: 1rem;
            }

            .title {
                font-size: 2.25rem;
                font-weight: 700;
                margin-bottom: 1rem;
                color: var(--dark);
                line-height: 1.2;
            }

            .price {
                font-size: 1.5rem;
                font-weight: 700;
                color: var(--danger);
                display: inline-block;
                margin: 0.5rem 0;
            }

            .price del {
                color: var(--gray);
                font-size: 1rem;
                margin-right: 0.5rem;
                opacity: 0.7;
            }

            .btn {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                background-color: var(--primary);
                color: var(--white);
                border: none;
                padding: 0.8rem 1.75rem;
                font-size: 1rem;
                font-weight: 600;
                border-radius: var(--border-radius);
                text-decoration: none;
                cursor: pointer;
                transition: var(--transition);
                box-shadow: 0 4px 12px rgba(67, 97, 238, 0.25);
                margin: 1.5rem 0;
            }

            .btn:hover {
                background-color: var(--primary-dark);
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(67, 97, 238, 0.3);
            }

            .btn:active {
                transform: translateY(0);
            }

            h2, h3, h4 {
                margin-top: 2rem;
                margin-bottom: 1rem;
                color: var(--dark);
                font-weight: 600;
            }

            h2 {
                font-size: 1.75rem;
                border-bottom: 2px solid var(--light-gray);
                padding-bottom: 0.5rem;
            }

            h3 {
                font-size: 1.5rem;
            }

            h4 {
                font-size: 1.25rem;
            }

            p {
                margin-bottom: 1rem;
                color: var(--gray);
            }

            /* Slider Container Fixes */
            .slider-wrapper {
                position: relative;
                margin: 2.5rem 0 0 0; /* Top margin only */
                border-radius: 8px;
                /*overflow: hidden;*/
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            }

            .slider-container {
                position: relative;
                width: 100%;
                height: 500px;
                /*overflow: hidden;*/
                margin: 0;
                padding: 0;
            }

            /* Slider Controls Fix */
            .slider-controls {
                position: absolute;
                bottom: 20px;
                right: 20px;
                z-index: 100;
                display: flex;
                gap: 10px;
            }

            .slider-controls button {
                background-color: rgba(0, 0, 0, 0.7);
                color: white;
                border: none;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                cursor: pointer;
                transition: all 0.3s ease;
                font-size: 1.2rem;
            }

            .slider-controls button:hover {
                background-color: rgba(0, 0, 0, 0.9);
                transform: scale(1.1);
            }

            /* Ensure slider content fills container */
            .slide-media {
                width: 100%;
                height: 100%;
                object-fit: cover;
            }

            .slide {
                display: none;
            }

            .slide.active {
                display: block;
            }

            /* Review Slider */
            .review-slider-container {
                background: var(--white);
                border-radius: var(--border-radius);
                padding: 2rem;
                margin: 3rem 0;
                box-shadow: var(--box-shadow);
                position: relative;
            }

            .review-slide {
                display: none;
                text-align: center;
                padding: 1rem;
            }

            .review-slide.active {
                display: block;
                animation: fadeIn 0.5s ease;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            .review-content {
                font-style: italic;
                font-size: 1.1rem;
                line-height: 1.7;
                color: var(--dark);
                margin-bottom: 1.5rem;
                position: relative;
            }

            .review-content::before,
            .review-content::after {
                content: '"';
                font-size: 2rem;
                color: var(--primary);
                opacity: 0.3;
                position: absolute;
            }

            .review-content::before {
                top: -1rem;
                left: -1rem;
            }

            .review-content::after {
                bottom: -2rem;
                right: -1rem;
            }

            .review-meta {
                font-size: 0.9rem;
                color: var(--gray);
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
            }

            .review-meta .stars {
                color: #ffc107;
                font-size: 1.1rem;
            }

            .review-slider-controls {
                margin-top: 1.5rem;
                text-align: center;
            }

            .review-slider-controls button {
                background-color: transparent;
                border: 2px solid var(--light-gray);
                color: var(--gray);
                padding: 0.5rem 1rem;
                font-size: 1rem;
                margin: 0 0.5rem;
                border-radius: var(--border-radius);
                cursor: pointer;
                transition: var(--transition);
            }

            .review-slider-controls button:hover {
                background-color: var(--primary);
                color: var(--white);
                border-color: var(--primary);
            }

            /* Search and Subjects */
            input[type="text"] {
                width: 100%;
                padding: 0.75rem 1rem;
                margin-bottom: 1.5rem;
                border: 1px solid var(--light-gray);
                border-radius: var(--border-radius);
                font-size: 1rem;
                transition: var(--transition);
            }

            input[type="text"]:focus {
                outline: none;
                border-color: var(--primary);
                box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
            }

            .subjects {
                margin: 2rem 0;
            }

            #subjectList {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .subject-item {
                padding: 0.75rem 1rem;
                margin: 0.25rem 0;
                border-radius: var(--border-radius);
                transition: var(--transition);
                cursor: pointer;
                display: flex;
                align-items: center;
            }

            .subject-item::before {
                content: "•";
                color: var(--primary);
                margin-right: 0.75rem;
                font-size: 1.5rem;
            }

            .subject-item:hover {
                background-color: rgba(67, 97, 238, 0.1);
                color: var(--primary);
                transform: translateX(5px);
            }

            /* Featured Courses */
            .featured {
                margin: 2rem 0;
            }

            .featured ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .featured li {
                padding: 0.75rem 1rem;
                margin: 0.5rem 0;
                background-color: var(--light);
                border-radius: var(--border-radius);
                transition: var(--transition);
            }

            .featured li:hover {
                background-color: rgba(67, 97, 238, 0.1);
                transform: translateX(5px);
            }

            .featured a {
                color: var(--dark);
                text-decoration: none;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: 0.75rem;
            }

            .featured a::before {
                content: "→";
                color: var(--primary);
                transition: var(--transition);
            }

            .featured li:hover a::before {
                transform: translateX(3px);
            }

            .featured a:hover {
                color: var(--primary);
                text-decoration: none;
            }

            /* Alerts */
            .alert {
                padding: 1rem;
                margin-bottom: 1.5rem;
                border-radius: var(--border-radius);
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: 0.75rem;
            }

            .alert-success {
                background-color: rgba(76, 201, 240, 0.15);
                color: #0a9396;
                border-left: 4px solid var(--success);
            }

            .alert-error {
                background-color: rgba(247, 37, 133, 0.15);
                color: var(--danger);
                border-left: 4px solid var(--danger);
            }

            /* Responsive Design */
            @media (max-width: 992px) {
                .container {
                    flex-direction: column;
                }

                .sidebar {
                    position: static;
                    width: 100%;
                }

                .slider-container {
                    height: 400px;
                }
            }

            @media (max-width: 768px) {
                .container {
                    padding: 1rem;
                }

                .main, .sidebar {
                    padding: 1.5rem;
                }

                .title {
                    font-size: 1.75rem;
                }

                .slider-container {
                    height: 300px;
                }

                .slide-info {
                    padding: 1rem;
                }

                .slide-info h3 {
                    font-size: 1.25rem;
                }
            }

            /* Animation for interactive elements */
            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.05);
                }
                100% {
                    transform: scale(1);
                }
            }

            .highlight {
                animation: pulse 2s infinite;
            }

            /* Badge for featured items */
            .badge {
                display: inline-block;
                padding: 0.25rem 0.5rem;
                font-size: 0.75rem;
                font-weight: 600;
                border-radius: 50px;
                background-color: var(--primary);
                color: white;
                margin-left: 0.5rem;
                vertical-align: middle;
            }
              .review-form {
                margin-top: 30px;
                padding: 20px;
                border: 1px solid #ccc;
                background-color: #fafafa;
                border-radius: 8px;
            }
            .review-form textarea, .review-form select {
                width: 100%;
                padding: 8px;
                margin-bottom: 10px;
            }
            .review-form button {
                padding: 10px 15px;
                background-color: #0066cc;
                color: white;
                border: none;
                border-radius: 5px;
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
                <a href="#">Log out</a>
            </div>
        </header>

        <div class="container">
            <!-- MAIN -->
            <div class="main">

                <c:if test="${not empty message}">
                    <div class="alert alert-${messageType}">
                        ${message}
                    </div>
                </c:if>
                <div class="title">${course.courseTitle}</div>
                <p><em>Start your coding journey with hands-on practice.</em></p>
                <p><strong>Overview:</strong> ${course.courseDetail}</p>
                <p><strong>Lowest Price Package:</strong> <del>$99</del> <span class="price">$49</span></p>

                <div>
                    <h4>Course Description</h4>
                    <p>This course covers variables, data types, loops, functions, and basic problem-solving skills. 
                        It is perfect for beginners and provides a strong foundation to explore any programming language.</p>
                </div>
                <div class="slider-wrapper">
                    <div class="slider-container"></div>
                    <div class="slider-controls">
                        <button id="prevSlide">❮</button>
                        <button id="nextSlide">❯</button>
                    </div>
                </div>

                <c:if test="${not empty reviews}">
                    <h3>Student Reviews</h3>
                    <c:if test="${not empty sessionScope.userID}">
                        <form action="add-review" method="post" enctype="multipart/form-data" class="review-form">
                            <input type="hidden" name="courseId" value="${course.courseID}" />
                            <input type="hidden" name="userId" value="${sessionScope.userID}" />

                            <label for="star">Đánh giá (số sao 1-5):</label>
                            <select name="star" id="star" required>
                                <c:forEach begin="1" end="5" var="i">
                                    <option value="${i}">${i}</option>
                                </c:forEach>
                            </select>

                            <label for="content">Nội dung đánh giá:</label>
                            <textarea name="content" id="content" rows="4" required></textarea>
                            <label for="image">Hình ảnh minh họa (tùy chọn):</label>
                            <input type="file" name="image" id="image" accept="image/*" />
                            <button type="submit">Gửi đánh giá</button>
                        </form>
                    </c:if>

                    <c:if test="${empty sessionScope.userID}">
                        <p>Vui lòng <a href="${pageContext.request.contextPath}/userPages/login.jsp">đăng nhập</a> để gửi đánh giá.</p>
                    </c:if>
                    <div class="review-slider-container">
                        <c:forEach var="review" items="${reviews}" varStatus="loop">
                            <div class="review-slide ${loop.index == 0 ? 'active' : ''}">
                                <div class="review-content">
                                    <p>"${review.content}"</p>
                                    <div class="review-meta">
                                        ⭐ ${review.star} stars — ${review.createdAt}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="review-slider-controls">
                            <button onclick="changeReview(-1)">❮</button>
                            <button onclick="changeReview(1)">❯</button>
                        </div>
                    </div>
                </c:if>


                <a class="btn" href="CourseRegisterServlet?courseID=${course.courseID}">Register Now</a>

            </div>

            <!-- SIDEBAR -->
            <div class="sidebar">
                <div>
                    <h3>Search Subjects</h3>
                    <input type="text" id="searchBox" onkeyup="filterSubjects()" placeholder="Search...">
                </div>

                <div class="subjects">
                    <h4>Subject Categories</h4>
                    <ul id="subjectList">
                        <c:forEach var="s" items="${subjects}">
                            <li class="subject-item">${s.subjectName}</li>
                            </c:forEach>
                    </ul>
                </div>

                <div class="featured">
                    <h4>Featured Courses</h4>
                    <ul>
                        <c:forEach var="c" items="${featuredCourses}">
                            <li><a href="CourseDetail?id=${c.courseID}">${c.courseTitle}</a></li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>


        <script>
            function filterSubjects() {
                var input = document.getElementById("searchBox");
                var filter = input.value.toUpperCase();
                var ul = document.getElementById("subjectList");
                var li = ul.getElementsByTagName("li");

                for (let i = 0; i < li.length; i++) {
                    let txtValue = li[i].textContent || li[i].innerText;
                    li[i].style.display = txtValue.toUpperCase().indexOf(filter) > -1 ? "" : "none";
                }
            }

            const sliderData = [
            <c:forEach items="${sliders}" var="slider" varStatus="loop">
            {
            type: 'image',
                    url: '${slider.imageUrl}',
                    title: '${slider.title}',
                    description: '${slider.notes}'
            }${!loop.last ? ',' : ''}
            </c:forEach>
            <c:if test="${not empty firstLesson}">
            , {
                type: 'video',
                url: '${firstLesson.URLLesson}',
                title: '${firstLesson.lessonTitle}',
                description: 'Bắt đầu bài học'
            }
            </c:if>
            ];

            // Khởi tạo slider
            function initSlider() {
                const container = document.querySelector('.slider-container');

                // Tạo các slide
                sliderData.forEach((slide, index) => {
                    const slideElement = document.createElement('div');
                    slideElement.className = 'slide ' + (index === 0 ? 'active' : '');
                    if (slide.type === 'image') {
                        slideElement.innerHTML =
                                '<img src="' + slide.url + '" alt="' + slide.title + '" class="slide-media">';
                    } else if (slide.type === 'video' && isYouTubeUrl(slide.url)) {
                        const youtubeId = extractYouTubeId(slide.url);
                        slideElement.innerHTML =
                                '<iframe width="560" height="315" src="https://www.youtube.com/embed/' + youtubeId + '" ' +
                                'title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; ' +
                                'encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
                    } else {
                        slideElement.innerHTML =
                                '<video controls class="slide-media">' +
                                '<source src="' + slide.url + '" type="video/mp4">' +
                                'Trình duyệt không hỗ trợ video' +
                                '</video>';
                    }

                    container.appendChild(slideElement);
                });

                // Tự động chuyển slide
                let currentIndex = 0;
//                    setInterval(() => {
//                        const slides = document.querySelectorAll('.slide');
//                        slides[currentIndex].classList.remove('active');
//
//                        currentIndex = (currentIndex + 1) % sliderData.length;
//                        slides[currentIndex].classList.add('active');
//
//                        const activeVideo = slides[currentIndex].querySelector('video');
//                        if (activeVideo) {
//                            activeVideo.currentTime = 0;
//                            activeVideo.pause();
//                        }
//                    }, 5000);
// Chuyen slide thu cong
                function showSlide(index) {
                    const slides = document.querySelectorAll('.slide');
                    slides.forEach((slide, i) => {
                        slide.classList.remove('active');
                        if (i === index) {
                            slide.classList.add('active');
                        }

                        const video = slide.querySelector('video');
                        if (video) {
                            video.pause();
                            video.currentTime = 0;
                        }
                    });
                }

                document.getElementById('nextSlide').addEventListener('click', () => {
                    currentIndex = (currentIndex + 1) % sliderData.length;
                    showSlide(currentIndex);
                });

                document.getElementById('prevSlide').addEventListener('click', () => {
                    currentIndex = (currentIndex - 1 + sliderData.length) % sliderData.length;
                    showSlide(currentIndex);
                });
            }

            function isYouTubeUrl(url) {
                return url.includes('youtube.com') || url.includes('youtu.be');
            }

            function extractYouTubeId(url) {
                const regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
                const match = url.match(regExp);
                return (match && match[7].length === 11) ? match[7] : null;
            }

            let currentReview = 0;
            function showReview(index) {
                const slides = document.querySelectorAll(".review-slide");
                slides.forEach((s, i) => {
                    s.classList.remove("active");
                    if (i === index)
                        s.classList.add("active");
                });
            }

            function changeReview(offset) {
                const slides = document.querySelectorAll(".review-slide");
                currentReview = (currentReview + offset + slides.length) % slides.length;
                showReview(currentReview);
            }


            window.addEventListener('DOMContentLoaded', initSlider);
        </script>

    </body>
</html>
