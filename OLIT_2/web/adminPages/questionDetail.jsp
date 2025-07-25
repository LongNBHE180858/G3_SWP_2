<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>Question Detail</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap');

            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', sans-serif;
                background: #f0f2f5;
                color: #333;
            }

            .container {
                display: flex;
                gap: 24px;
                max-width: 1200px;
                margin: 40px auto;
                padding: 16px;
            }

            .form-section,
            .media-section {
                background: #fff;
                border-radius: 8px;
                box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
                padding: 24px;
            }

            .form-section {
                flex: 0 0 40%;
            }

            .media-section {
                flex: 0 0 60%;
                display: flex;
                flex-direction: column;
            }

            h1 {
                margin-bottom: 24px;
                font-size: 26px;
                font-weight: 600;
                color: #22313f;
            }

            .form-group {
                margin-bottom: 18px;
            }

            .form-group label {
                display: block;
                margin-bottom: 6px;
                font-weight: 500;
                color: #555;
            }

            .form-control,
            .form-select {
                width: 100%;
                padding: 10px 14px;
                border: 1px solid #d1d5db;
                border-radius: 6px;
                font-size: 14px;
                transition: border-color .3s, box-shadow .3s;
            }

            .form-control:focus,
            .form-select:focus {
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
                outline: none;
            }

            .answer-group {
                position: relative;
                margin-bottom: 16px;
                padding: 16px;
                border: 1px solid #e5e7eb;
                border-radius: 6px;
                background: #fafafa;
            }

            .deleteAnswer-btn {
                position: absolute;
                top: 12px;
                right: 12px;
                background: #ef4444;
                color: #fff;
                border: none;
                border-radius: 4px;
                width: 28px;
                height: 28px;
                font-weight: bold;
                cursor: pointer;
                transition: background .3s;
            }

            .deleteAnswer-btn:hover {
                background: #dc2626;
            }

            .add-btn,
            .save-btn,
            .delete-btn {
                margin-top: 20px;
                padding: 10px 20px;
                border: none;
                border-radius: 6px;
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                transition: background .3s, box-shadow .3s;
            }

            .add-btn {
                background: #3b82f6;
                color: #fff;
            }

            .add-btn:hover {
                background: #2563eb;
            }

            .save-btn {
                background: #10b981;
                color: #fff;
                float: right;
            }

            .save-btn:hover {
                background: #059669;
            }

            .delete-btn {
                background: #ef4444;
                color: #fff;
                float: left;
            }

            .delete-btn:hover {
                background: #dc2626;
            }

            .media-preview-wrapper {
                position: relative;
                background: #f9fafb;
                border-radius: 8px;
                overflow: hidden;
                height: 360px;
                margin-bottom: 16px;
            }

            .media-item {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                display: none;
                /* Only show 1 active media, all others are completely hidden */
                justify-content: center;
                align-items: center;
            }

            .media-item.active {
                display: flex;
            }

            .arrow-btn {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                background: rgba(255, 255, 255, 0.8);
                border: none;
                font-size: 24px;
                cursor: pointer;
                width: 36px;
                height: 36px;
                border-radius: 50%;
                transition: background .3s, transform .3s;
                z-index: 10;
            }

            .arrow-btn.left {
                left: 12px;
            }

            .arrow-btn.right {
                right: 12px;
            }

            .arrow-btn:hover {
                background: rgba(255, 255, 255, 1);
                transform: scale(1.1);
            }

            .media-item img,
            .media-item video,
            .media-item audio {
                max-width: 100%;
                max-height: 100%;
                border-radius: 4px;
            }

            .media-description {
                background: #fff;
                border: 1px solid #e5e7eb;
                border-radius: 6px;
                padding: 16px;
                font-size: 14px;
                color: #555;
                font-style: italic;
                min-height: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .change-media-btn {
                align-self: flex-end;
                margin-top: 8px;
                padding: 8px 16px;
                background: #3b82f6;
                color: #fff;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: background .3s;
            }

            .change-media-btn:hover {
                background: #2563eb;
            }

            .popup-overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 200;
            }

            .popup-overlay.show {
                display: flex;
            }

            .popup-content {
                background: #fff;
                border-radius: 8px;
                padding: 24px;
                width: 600px;
                max-width: 90%;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
            }

            .popup-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 16px;
            }

            .close-btn {
                background: none;
                border: none;
                font-size: 24px;
                cursor: pointer;
            }

            .media-item-group {
                display: flex;
                gap: 8px;
                margin-bottom: 12px;
                align-items: flex-start;
            }

            .media-item-group input,
            .media-item-group select {
                flex: 1;
            }

            .deleteMedia-btn {
                background: #e74c3c;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 4px 8px;
                cursor: pointer;
            }

            .deleteMedia-btn:hover {
                background: #c0392b;
            }

            .addMedia-btn,
            .saveList-btn {
                padding: 8px 16px;
                border: none;
                border-radius: 6px;
                font-weight: 500;
                cursor: pointer;
                margin-right: 8px;
            }

            .addMedia-btn {
                background: #3b82f6;
                color: #fff;
            }

            .addMedia-btn:hover {
                background: #2563eb;
            }

            .saveList-btn {
                background: #10b981;
                color: #fff;
            }

            .saveList-btn:hover {
                background: #059669;
            }

            .back-btn {
                display: inline-block;
                margin-bottom: 16px;
                padding: 8px 16px;
                background: #f1f5f9;
                color: #2563eb;
                border-radius: 6px;
                text-decoration: none;
                font-weight: 500;
                transition: background .2s, color .2s;
                border: 1px solid #cbd5e1;
            }

            .back-btn:hover {
                background: #2563eb;
                color: #fff;
            }
        </style>
    </head>

    <body>

        <script>
            // expose questionID for AJAX calls
            const questionID = "${question.questionID}";
        </script>

        <div class="container">

            <div class="form-section">
                <a href="${pageContext.request.contextPath}/QuestionListServlet" class="back-btn">← Back to Question List</a>

                <h1>Question Detail</h1>
                <form action="${pageContext.request.contextPath}/QuestionDetailServlet" method="post">
                    <input type="hidden" name="action" value="saveChanges" />
                    <input type="hidden" name="questionID" value="${question.questionID}" />
                    <!-- Subject -->
                    <div class="form-group">
                        <label>Subject</label>
                        <input class="form-control" value="${subject.subjectName}" readonly />
                    </div>
                    <!-- Dimensions -->
                    <label>Dimension(s)</label>
                    <input class="form-control" readonly
                           value="<c:forEach var='d' items='${dimensions}' varStatus='loop'>${d.dimensionName}<c:if test='${!loop.last}'>, </c:if></c:forEach>" />
                               <div class="form-group">
                                   <label for="lesson">Lesson</label>
                                   <input readonly type="text" class="form-control" name="lesson"
                                          value="${lesson.lessonTitle}" />
                    </div>
                    <div class="form-group">
                        <label>Status</label>
                        <select name="status" class="form-select">
                            <option value="1" ${question.status?'selected':''}>Active</option>
                            <option value="0" ${!question.status?'selected':''}>Inactive</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Content</label>
                        <input name="questionContent" class="form-control" value="${question.questionContent}"
                               required />
                    </div>
                    <div id="answersContainer">
                        <c:forEach var="ans" items="${questionAnswers}">
                            <div class="answer-group" id="ans-${ans.answerId}">
                                <input type="hidden" name="answerID" value="${ans.answerId}" />
                                <div class="form-group">
                                    <label>Answer</label>
                                    <input name="answerDetail" class="form-control" value="${ans.answerDetail}"
                                           required />
                                </div>
                                <div class="form-group">
                                    <label>Explanation</label>
                                    <input name="explanation" class="form-control" value="${ans.explanation}" />
                                </div>
                                <div class="form-group">
                                    <label>Correct?</label>
                                    <select name="isCorrect" class="form-select">
                                        <option value="1" ${ans.isCorrect?'selected':''}>Correct</option>
                                        <option value="0" ${!ans.isCorrect?'selected':''}>Incorrect</option>
                                    </select>
                                </div>
                                <button type="button" class="deleteAnswer-btn"
                                        onclick="deleteAnswer('${ans.answerId}')">&times;</button>
                            </div>
                        </c:forEach>
                    </div>
                    <button type="button" class="add-btn" onclick="addAnswer()">+ Add Answer</button>
                    <button type="submit" class="save-btn">Save Changes</button>
                </form>
                <form action="${pageContext.request.contextPath}/QuestionDetailServlet" method="post"
                      onsubmit="return confirm('Are you sure you want to delete this question?');">
                    <input type="hidden" name="action" value="deleteQuestion" />
                    <input type="hidden" name="questionID" value="${question.questionID}" />
                    <button type="submit" class="delete-btn">Delete Question</button>
                </form>
            </div>

            <div class="media-section">
                <div class="media-preview-wrapper">
                    <button class="arrow-btn left" onclick="prevMedia()">‹</button>
                    <c:forEach var="md" items="${questionMedias}" varStatus="loop">
                        <div class="media-item ${loop.index==0?'active':''}" data-index="${loop.index}">
                            <c:choose>
                                <c:when test="${md.mediaType == 1}">
                                    <img src="<c:url value='/userPages/assets/mediaQuestion/${md.mediaURL}'/>"
                                         alt="Image" />
                                </c:when>
                                <c:when test="${md.mediaType == 2}">
                                    <video controls width="400" height="250" preload="metadata"
                                           style="background:#000;">
                                        <source
                                            src="<c:url value='/userPages/assets/mediaQuestion/${md.mediaURL}'/>"
                                            type="video/mp4" />
                                        Your browser does not support the video tag.
                                    </video>
                                </c:when>
                                <c:when test="${md.mediaType == 3}">
                                    <audio controls>
                                        <source
                                            src="<c:url value='/userPages/assets/mediaQuestion/${md.mediaURL}'/>"
                                            type="audio/mp4" />
                                        Your browser does not support the audio tag.
                                    </audio>
                                </c:when>
                            </c:choose>
                        </div>
                    </c:forEach>
                    <button class="arrow-btn right" onclick="nextMedia()">›</button>
                </div>

                <div class="media-description" id="mediaDesc">
                    ${fn:escapeXml(questionMedias[0].mediaDescription)}
                </div>
                <button class="change-media-btn" onclick="openMediaPopup()">Edit Media List</button>
            </div>
        </div>

        <!-- Popup: Edit Media List -->
        <div id="mediaPopup" class="popup-overlay">
            <div class="popup-content">
                <div class="popup-header">
                    <h2>Edit Media List</h2>
                    <button class="close-btn" onclick="closeMediaPopup()">&times;</button>
                </div>
                <form id="mediaForm" action="${pageContext.request.contextPath}/QuestionDetailServlet"
                      method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="saveMediaList" />
                    <input type="hidden" name="questionID" value="${question.questionID}" />
                    <div id="mediaListContainer">
                        <c:forEach var="md" items="${questionMedias}">
                            <div class="media-item-group">
                                <select name="mediaType" class="form-select">
                                    <option value="1" ${md.mediaType==1?'selected':''}>Image</option>
                                    <option value="2" ${md.mediaType==2?'selected':''}>Video</option>
                                    <option value="3" ${md.mediaType==3?'selected':''}>Audio</option>
                                </select>
                                <!-- Show old file name and new file input -->
                                <input type="hidden" name="existingMediaId" value="${md.mediaId}" />
                                <input type="hidden" name="existingMediaURL" value="${md.mediaURL}" />
                                <input type="file" name="mediaFile" class="form-control" />
                                <span style="font-size:12px;color:#888;">${md.mediaURL}</span>
                                <input name="mediaDescription" class="form-control"
                                       value="${md.mediaDescription}" placeholder="Description" />
                                <button type="button" class="deleteMedia-btn"
                                        onclick="this.parentElement.remove()">−</button>
                            </div>
                        </c:forEach>
                    </div>
                    <div style="text-align:right; margin-top:16px;">
                        <button type="button" class="addMedia-btn" onclick="addMediaItem()">+ Add Media</button>
                        <button type="submit" class="saveList-btn">Save Media List</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Answer handlers
            function deleteAnswer(id) {
                const params = new URLSearchParams({action: 'deleteAnswer', qaId: id, questionID: questionID});
                fetch('${pageContext.request.contextPath}/QuestionDetailServlet', {
                    method: 'POST',
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
                    body: params.toString()
                })
                        .then(res => res.text()).then(txt => {
                    if (txt.trim() === 'success')
                        document.getElementById('ans-' + id).remove();
                    else
                        alert('Delete failed: ' + txt);
                });
            }
            function addAnswer() {
                const c = document.getElementById('answersContainer'), d = document.createElement('div');
                d.className = 'answer-group';
                d.innerHTML = `
            <div class="form-group"><label>Answer</label>
                <input name="newAnswerDetail" class="form-control" placeholder="Answer" required/></div>
            <div class="form-group"><label>Explanation</label>
                <input name="newExplanation" class="form-control" placeholder="Explanation"/></div>
            <div class="form-group"><label>Correct?</label>
                <select name="newIsCorrect" class="form-select">
                <option value="1">Correct</option><option value="0">Incorrect</option>
                </select></div>
            <button type="button" class="deleteAnswer-btn" onclick="this.parentElement.remove()">&times;</button>
        `;
                c.appendChild(d);
            }

            // Media popup handlers
            function openMediaPopup() {
                document.getElementById('mediaPopup').classList.add('show');
            }
            function closeMediaPopup() {
                document.getElementById('mediaPopup').classList.remove('show');
            }
            function addMediaItem() {
                const c = document.getElementById('mediaListContainer'), d = document.createElement('div');
                d.className = 'media-item-group';
                d.innerHTML = `
            <select name="mediaType" class="form-select">
                <option value="1">Image</option><option value="2">Video</option><option value="3">Audio</option>
            </select>
            <input type="file" name="mediaFile" class="form-control" />
            <input type="hidden" name="existingMediaURL" value="" />
            <input name="mediaDescription" class="form-control" placeholder="Description"/>
            <button type="button" class="deleteMedia-btn" onclick="this.parentElement.remove()">−</button>
        `;
                c.appendChild(d);
            }

            let current = 0
            ,
                    descs = [
            <c:forEach var="md" items="${questionMedias}" varStatus="loop">
                    '<c:out value="${fn:escapeXml(md.mediaDescription)}" />'<c:if test="${!loop.last}">,</c:if>
            </c:forEach>
                    ];

            function showMedia(i) {
                const items = document.querySelectorAll('.media-item');
                if (items.length === 0)
                    return;

                // Normalize i
                i = (i + items.length) % items.length;

                // Pause & reset all video/audio
                items.forEach(item => {
                    item.querySelectorAll('video, audio').forEach(m => {
                        m.pause();
                        try {
                            m.currentTime = 0;
                        } catch (e) {
                        }
                    });
                    item.classList.remove('active');
                });

                items[i].classList.add('active');
                document.getElementById('mediaDesc').innerText = descs[i];
                current = i;
            }

            function prevMedia() {
                console.log('Prev media clicked');

                showMedia(current - 1);
            }
            function nextMedia() {
                showMedia(current + 1);
            }

            // Always show the first media when the page loads
            document.addEventListener('DOMContentLoaded', () => {
                showMedia(current);
                document.querySelectorAll('.media-item video, .media-item audio')
                        .forEach(media => media.addEventListener('error', e => {
                                console.error('Media error:', e, media.error);
                                alert('Cannot play media. Please check the file path or format.');
                            }));
            });

        </script>

    </body>

</html>