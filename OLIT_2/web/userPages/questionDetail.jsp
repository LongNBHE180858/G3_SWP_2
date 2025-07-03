<%-- 
    Document   : lessonDetail
    Created on : Jun 27, 2025, 3:58:06 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Questions Details</title>
        <style>
            .popup-overlay {
                display: none; /* Ẩn mặc định */
            }
            .show {
                display: flex; /* Hiển thị khi có lớp show */
            }
        </style>

    </head>
    <body>
        <form action="QuestionsDetailServlet" method="post">
            <div>
                <label for="subject">Subject</label>
                <input readonly type="text" name="subject" value="${subject.subjectName}" >
            </div>
            <div>
                <label for="dimensions">Dimension(s)</label>
                <input readonly type="text" name="dimensions" value="<c:forEach var="d" items="${dimensions}" varStatus="loop">${d.dimensionName}${!loop.last ? ', ' : ''}</c:forEach>" >
                </div>
                <div>
                    <label for="leson">Lesson</label>
                    <input readonly type="text" name="lesson" value="${lesson.lessonTitle}" >
            </div>
            <div>
                <label for="status">Status</label>
                <select name ="status">
                    <option value="1" ${question.status ? 'selected' : ''}>Active</option>
                    <option value="0" ${!question.status ? 'selected' : ''}>Inactive</option>
                </select>
            </div>
            <div>
                <label for="questionContent">Content</label>
                <input type="text" name="questionContent" value="${question.questionContent}" >
            </div>
            <div>
                <c:forEach var="qa" items="${questionAnswers}">
                    <div>
                        <label for="answerDetail">Answer</label>
                        <input type="text" name="answerDetail" value="${qa.answerDetail}" >
                        <label for="explanation">Explanation</label>
                        <input type="text" name="explanation" value="${qa.explanation}" >
                        <select name ="isCorrect">
                            <option value="1" ${qa.isCorrect ? 'selected' : ''}>Correct</option>
                            <option value="0" ${!qa.isCorrect ? 'selected' : ''}>InCorrect</option>
                        </select>
                        <button>Delete</button>
                    </div>
                </c:forEach>
                <button>+ Add answer and explanation</button>
            </div>

            <div title="Media Preview">
                <c:forEach var="qm" items="${questionMedias}">
                    <c:choose>
                        <c:when test="${qm.mediaType == 1}">
                            <div>
                                <img src="${pageContext.request.contextPath}/userPages/assets/mediaQuestion/${qm.mediaURL}" alt="Image" width="300"/>
                                <input readonly type="text" value="${qm.mediaDescription}" >
                            </div>
                        </c:when>
                        <c:when test="${qm.mediaType == 2}">
                            <div>
                                <video width="400" controls>
                                    <source src="${pageContext.request.contextPath}/userPages/assets/mediaQuestion/${qm.mediaURL}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <input readonly type="text" value="${qm.mediaDescription}" >
                            </div>
                        </c:when>
                        <c:when test="${qm.mediaType == 3}">
                            <div>
                                <audio controls>
                                    <source src="${pageContext.request.contextPath}/userPages/assets/mediaQuestion/${qm.mediaURL}" type="audio/mpeg">
                                    Your browser does not support the audio tag.
                                </audio>
                                <input readonly type="text" value="${qm.mediaDescription}" >
                            </div>
                        </c:when>
                        <c:otherwise>
                            <p>Error file</p>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>






            <button onclick="openListMedia()">Change List Media</button>

            <div class="popup-overlay" id="popup-list-media">
                <h2>Change List Media</h2>
                <c:forEach var="qm" items="${questionMedias}">
                    <div>
                        <input type="file" class="input-file" name="file" accept="image/*,video/*,audio/*" required >
                    </div>
                </c:forEach>
                <button onclick="addMediaItem()">+ Add more media</button>
                <button onclick="closeListMedia()">Save media</button>
            </div>



            <button type="submit">Save Change</button>
        </form>


        <script>

            function openListMedia() {
                document.getElementById('popup-list-media').classList.add('show');
            }
            function closeListMedia() {
                document.getElementById('popup-list-media').classList.remove('show');
            }

        </script>

    </body>
</html>
