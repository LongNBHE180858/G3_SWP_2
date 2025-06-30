<%-- 
    Document   : lessonDetail
    Created on : Jun 27, 2025, 3:58:06 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Questions Details</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
                background-color: #f5f5f5;
                color: #333;
            }

            .container {
                max-width: 1200px;
                margin: 0 auto;
                background: white;
                min-height: 100vh;
                display: flex;
            }

            .header {
                display: flex;
                align-items: center;
                padding: 20px;
                border-bottom: 1px solid #e0e0e0;
                background: white;
                position: sticky;
                top: 0;
                z-index: 100;
            }

            .back-btn {
                background: none;
                border: none;
                font-size: 24px;
                cursor: pointer;
                margin-right: 20px;
                color: #666;
            }

            .back-btn:hover {
                color: #333;
            }

            .title {
                font-size: 24px;
                font-weight: 600;
                color: #333;
            }

            .main-content {
                display: flex;
                flex: 1;
            }

            .form-section {
                flex: 1;
                padding: 30px;
                max-width: 400px;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                font-weight: 500;
                color: #555;
            }

            .form-control {
                width: 100%;
                padding: 12px 16px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            .form-control:focus {
                outline: none;
                border-color: #007bff;
            }

            .form-control.select {
                background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
                background-position: right 12px center;
                background-repeat: no-repeat;
                background-size: 16px;
                padding-right: 40px;
                appearance: none;
            }

            .media-upload {
                border: 2px dashed #007bff;
                border-radius: 8px;
                padding: 20px;
                text-align: center;
                background: #f8f9ff;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .media-upload:hover {
                background: #e6f2ff;
            }

            .media-upload-text {
                color: #007bff;
                font-weight: 500;
                margin-bottom: 5px;
            }

            .answer-group {
                position: relative;
                margin-bottom: 15px;
            }

            .answer-input {
                margin-bottom: 10px;
            }

            .explanation-input {
                font-size: 14px;
                color: #666;
            }

            .remove-btn {
                position: absolute;
                right: 12px;
                top: 12px;
                background: #ff4757;
                color: white;
                border: none;
                border-radius: 50%;
                width: 24px;
                height: 24px;
                cursor: pointer;
                font-size: 14px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .remove-btn:hover {
                background: #ff3742;
            }

            .add-btn {
                background: #007bff;
                color: white;
                border: none;
                padding: 12px 24px;
                border-radius: 8px;
                font-size: 14px;
                cursor: pointer;
                font-weight: 500;
                transition: background-color 0.3s ease;
            }

            .add-btn:hover {
                background: #0056b3;
            }

            .preview-section {
                flex: 1;
                background: #f8f9fa;
                border-left: 1px solid #e0e0e0;
                display: flex;
                flex-direction: column;
            }

            .preview-header {
                padding: 20px;
                border-bottom: 1px solid #e0e0e0;
                background: white;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .preview-nav {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .nav-btn {
                background: none;
                border: none;
                font-size: 20px;
                cursor: pointer;
                color: #666;
                padding: 8px;
                border-radius: 4px;
            }

            .nav-btn:hover {
                background: #f0f0f0;
            }

            .preview-title {
                font-size: 16px;
                font-weight: 600;
                color: #333;
            }

            .preview-content {
                flex: 1;
                padding: 40px;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #666;
            }

            .preview-placeholder {
                text-align: center;
            }

            .description-section {
                padding: 20px;
                background: white;
                border-top: 1px solid #e0e0e0;
            }

            .description-label {
                font-weight: 500;
                color: #555;
                margin-bottom: 10px;
            }

            .description-input {
                width: 100%;
                min-height: 80px;
                resize: vertical;
            }

            .save-btn {
                position: fixed;
                bottom: 30px;
                right: 30px;
                background: #007bff;
                color: white;
                border: none;
                padding: 16px 32px;
                border-radius: 8px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
                transition: all 0.3s ease;
            }

            .save-btn:hover {
                background: #0056b3;
                transform: translateY(-2px);
                box-shadow: 0 6px 16px rgba(0, 123, 255, 0.4);
            }

            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                animation: fadeIn 0.3s ease;
            }

            .modal.show {
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .modal-content {
                background: white;
                border-radius: 12px;
                padding: 30px;
                width: 90%;
                max-width: 600px;
                max-height: 80vh;
                overflow-y: auto;
                position: relative;
                animation: slideIn 0.3s ease;
            }

            .modal-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
                padding-bottom: 15px;
                border-bottom: 2px solid #f0f0f0;
            }

            .modal-title {
                font-size: 24px;
                font-weight: 700;
                color: #333;
            }

            .close-btn {
                background: none;
                border: none;
                font-size: 28px;
                cursor: pointer;
                color: #666;
                width: 32px;
                height: 32px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 50%;
                transition: background-color 0.3s ease;
            }

            .close-btn:hover {
                background: #f0f0f0;
                color: #333;
            }

            .media-item {
                display: flex;
                gap: 15px;
                margin-bottom: 20px;
                padding: 20px;
                border: 2px solid #e0e0e0;
                border-radius: 8px;
                background: #fafafa;
                transition: border-color 0.3s ease;
            }

            .media-item:hover {
                border-color: #007bff;
            }

            .media-inputs {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }

            .media-input {
                padding: 12px 16px;
                border: 2px solid #e0e0e0;
                border-radius: 6px;
                font-size: 14px;
                transition: border-color 0.3s ease;
            }

            .media-input:focus {
                outline: none;
                border-color: #007bff;
            }

            .media-input.file-input {
                background: #f8f9ff;
                color: #007bff;
                font-weight: 500;
            }

            .media-remove-btn {
                background: #ff4757;
                color: white;
                border: none;
                border-radius: 50%;
                width: 36px;
                height: 36px;
                cursor: pointer;
                font-size: 18px;
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                align-self: flex-start;
                transition: background-color 0.3s ease;
            }

            .media-remove-btn:hover {
                background: #ff3742;
            }

            .add-media-btn {
                background: #007bff;
                color: white;
                border: none;
                padding: 14px 28px;
                border-radius: 8px;
                font-size: 16px;
                cursor: pointer;
                font-weight: 600;
                transition: background-color 0.3s ease;
                display: flex;
                align-items: center;
                gap: 8px;
                margin: 20px auto;
            }

            .add-media-btn:hover {
                background: #0056b3;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }

            @keyframes slideIn {
                from {
                    opacity: 0;
                    transform: scale(0.9) translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: scale(1) translateY(0);
                }
            }

            @media (max-width: 768px) {
                .main-content {
                    flex-direction: column;
                }

                .form-section {
                    max-width: none;
                }

                .preview-section {
                    border-left: none;
                    border-top: 1px solid #e0e0e0;
                    min-height: 300px;
                }

                .modal-content {
                    width: 95%;
                    padding: 20px;
                }

                .modal-title {
                    font-size: 20px;
                }

                .media-item {
                    flex-direction: column;
                    gap: 10px;
                }

                .media-remove-btn {
                    align-self: flex-end;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="main-content">
                <div class="form-section">
                    <div class="header">
                        <button class="back-btn" onclick="goBack()">‹</button>
                        <h1 class="title">Questions Details</h1>
                    </div>

                    <form id="questionForm">
                        <div class="form-group">
                            <label for="subject">Subject</label>
                            <input type="text" name="subject" class="form-control" placeholder="Nhập chủ đề">
                        </div>

                        <div class="form-group">
                            <label for="dimensions">Dimension(s)</label>
                            <input type="text" name="dimensions" class="form-control" placeholder="Nhập kích thước">
                        </div>

                        <div class="form-group">
                            <label for="lesson">Lesson</label>
                            <input type="text" name="lesson" class="form-control" placeholder="Nhập bài học">
                        </div>

                        <div class="form-group">
                            <label for="status">Status</label>
                            <select name="status" class="form-control select">
                                <option value="">Chọn trạng thái</option>
                                <option value="draft">Bản nháp</option>
                                <option value="active">Hoạt động</option>
                                <option value="inactive">Không hoạt động</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="content">Content</label>
                            <textarea name="content" class="form-control" rows="3" placeholder="Nhập nội dung câu hỏi"></textarea>
                        </div>

                        <div name="answersContainer">
                            <div class="answer-group">
                                <div class="answer-input">
                                    <label>Answer 1</label>
                                    <input type="text" class="form-control" placeholder="Nhập câu trả lời 1">
                                    <button type="button" class="remove-btn" onclick="removeAnswer(this)">×</button>
                                </div>
                                <div class="explanation-input">
                                    <label>Explanation 1</label>
                                    <input type="text" class="form-control" placeholder="Nhập giải thích cho câu trả lời 1">
                                </div>
                            </div>

                            <div class="answer-group">
                                <div class="answer-input">
                                    <label>Answer 2</label>
                                    <input type="text" class="form-control" placeholder="Nhập câu trả lời 2">
                                    <button type="button" class="remove-btn" onclick="removeAnswer(this)">×</button>
                                </div>
                                <div class="explanation-input">
                                    <label>Explanation 2</label>
                                    <input type="text" class="form-control" placeholder="Nhập giải thích cho câu trả lời 2">
                                </div>
                            </div>
                        </div>

                        <button type="button" class="add-btn" onclick="addAnswer()">➕ Add answer and explanation for it</button>
                    </form>
                </div>

                <div class="preview-section">

                    <div class="form-group">
                        <label>List media</label>
                        <div class="media-upload" onclick="openMediaModal()">
                            <div class="media-upload-text">📁 Quản lý media</div>
                            <div style="font-size: 12px; color: #888;">Click để thêm, sửa hoặc xóa media</div>
                        </div>
                    </div>

                    <div class="preview-header">
                        <div class="preview-nav">
                            <button class="nav-btn">‹</button>
                            <span class="preview-title">MEDIA PREVIEW</span>
                            <button class="nav-btn">›</button>
                        </div>
                    </div>

                    <div class="preview-content">
                        <div class="preview-placeholder">
                            <div style="font-size: 48px; margin-bottom: 20px;">🖼️</div>
                            <div>Chưa có media nào được chọn</div>
                        </div>
                    </div>

                    <div class="description-section">
                        <div class="description-label">Description</div>
                        <textarea class="form-control description-input" placeholder="Nhập mô tả cho media..."></textarea>
                    </div>
                </div>
            </div>
        </div>

        <!-- Media Modal -->
        <div name="mediaModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Change List Media</h2>
                    <button class="close-btn" onclick="closeMediaModal()">&times;</button>
                </div>

                <div name="mediaList">
                    <div class="media-item">
                        <div class="media-inputs">
                            <input type="text" class="media-input file-input" placeholder="Media file 1" readonly onclick="selectMediaFile(this)">
                            <input type="text" class="media-input" placeholder="Description 1">
                        </div>
                        <button class="media-remove-btn" onclick="removeMediaItem(this)">−</button>
                    </div>

                    <div class="media-item">
                        <div class="media-inputs">
                            <input type="text" class="media-input file-input" placeholder="Media file 2" readonly onclick="selectMediaFile(this)">
                            <input type="text" class="media-input" placeholder="Description 2">
                        </div>
                        <button class="media-remove-btn" onclick="removeMediaItem(this)">−</button>
                    </div>
                </div>

                <button class="add-media-btn" onclick="addMediaItem()">
                    <span>+</span>
                    Add more media
                </button>
            </div>
        </div>

        <!-- Hidden file input -->
        <input type="file" id="hiddenFileInput" style="display: none;" accept="image/*,video/*,audio/*">

        <button class="save-btn" onclick="saveQuestion()">Save Change</button>

        <script>
            let answerCount = 2;
            let mediaCount = 2;
            let currentFileInput = null;

            function goBack() {
                alert('Quay lại trang trước');
            }

            // Media Modal Functions
            function openMediaModal() {
                document.getElementById('mediaModal').classList.add('show');
            }

            function closeMediaModal() {
                document.getElementById('mediaModal').classList.remove('show');
            }

            function addMediaItem() {
                mediaCount++;
                const mediaList = document.getElementById('mediaList');
                const newMediaItem = document.createElement('div');
                newMediaItem.className = 'media-item';
                newMediaItem.innerHTML = `
                    <div class="media-inputs">
                        <input type="text" class="media-input file-input" placeholder="Media file ${mediaCount}" readonly onclick="selectMediaFile(this)">
                        <input type="text" class="media-input" placeholder="Description ${mediaCount}">
                    </div>
                    <button class="media-remove-btn" onclick="removeMediaItem(this)">−</button>
                `;
                mediaList.appendChild(newMediaItem);
            }

            function removeMediaItem(button) {
                const mediaItem = button.closest('.media-item');
                const mediaList = document.getElementById('mediaList');
                if (mediaList.children.length > 1) {
                    mediaItem.remove();
                    updateMediaLabels();
                } else {
                    alert('Phải có ít nhất một media item');
                }
            }

            function updateMediaLabels() {
                const mediaItems = document.querySelectorAll('.media-item');
                mediaItems.forEach((item, index) => {
                    const fileInput = item.querySelector('.file-input');
                    const descInput = item.querySelector('.media-input:not(.file-input)');

                    if (fileInput.value === '' || fileInput.value.startsWith('Media file')) {
                        fileInput.placeholder = `Media file ${index + 1}`;
                    }
                    descInput.placeholder = `Description ${index + 1}`;
                });
                mediaCount = mediaItems.length;
            }

            function selectMediaFile(input) {
                currentFileInput = input;
                document.getElementById('hiddenFileInput').click();
            }

            // Handle file selection
            document.getElementById('hiddenFileInput').addEventListener('change', function (e) {
                const file = e.target.files[0];
                if (file && currentFileInput) {
                    currentFileInput.value = file.name;
                    currentFileInput.style.color = '#007bff';
                    currentFileInput.style.fontWeight = '600';

                    // Update preview
                    updateMediaPreview();
                }
            });

            function updateMediaPreview() {
                const mediaItems = document.querySelectorAll('.media-item');
                const totalFiles = Array.from(mediaItems).filter(item => {
                    const fileInput = item.querySelector('.file-input');
                    return fileInput.value && !fileInput.value.startsWith('Media file');
                }).length;

                if (totalFiles > 0) {
                    const previewContent = document.querySelector('.preview-content');
                    previewContent.innerHTML = `
                        <div class="preview-placeholder">
                            <div style="font-size: 48px; margin-bottom: 20px;">📁</div>
                            <div>Đã chọn ${totalFiles} file media</div>
                            <div style="font-size: 14px; color: #888; margin-top: 10px;">
                                Click để xem chi tiết trong popup
                            </div>
                        </div>
                    `;
                }
            }

            // Close modal when clicking outside
            window.onclick = function (event) {
                const modal = document.getElementById('mediaModal');
                if (event.target === modal) {
                    closeMediaModal();
                }
            }

            // Answer Functions
            function addAnswer() {
                answerCount++;
                const container = document.getElementById('answersContainer');
                const newAnswerGroup = document.createElement('div');
                newAnswerGroup.className = 'answer-group';
                newAnswerGroup.innerHTML = `
                    <div class="answer-input">
                        <label>Answer ${answerCount}</label>
                        <input type="text" class="form-control" placeholder="Nhập câu trả lời ${answerCount}">
                        <button type="button" class="remove-btn" onclick="removeAnswer(this)">×</button>
                    </div>
                    <div class="explanation-input">
                        <label>Explanation ${answerCount}</label>
                        <input type="text" class="form-control" placeholder="Nhập giải thích cho câu trả lời ${answerCount}">
                    </div>
                `;
                container.appendChild(newAnswerGroup);
            }

            function removeAnswer(button) {
                const answerGroup = button.closest('.answer-group');
                const container = document.getElementById('answersContainer');
                if (container.children.length > 1) {
                    answerGroup.remove();
                    updateAnswerLabels();
                } else {
                    alert('Phải có ít nhất một câu trả lời');
                }
            }

            function updateAnswerLabels() {
                const answerGroups = document.querySelectorAll('.answer-group');
                answerGroups.forEach((group, index) => {
                    const answerLabel = group.querySelector('.answer-input label');
                    const explanationLabel = group.querySelector('.explanation-input label');
                    const answerInput = group.querySelector('.answer-input input');
                    const explanationInput = group.querySelector('.explanation-input input');

                    answerLabel.textContent = `Answer ${index + 1}`;
                    explanationLabel.textContent = `Explanation ${index + 1}`;
                    answerInput.placeholder = `Nhập câu trả lời ${index + 1}`;
                    explanationInput.placeholder = `Nhập giải thích cho câu trả lời ${index + 1}`;
                });
                answerCount = answerGroups.length;
            }

            function saveQuestion() {
                const formData = {
                    subject: document.getElementById('subject').value,
                    dimensions: document.getElementById('dimensions').value,
                    lesson: document.getElementById('lesson').value,
                    status: document.getElementById('status').value,
                    content: document.getElementById('content').value,
                    answers: [],
                    media: []
                };

                // Collect answers
                const answerGroups = document.querySelectorAll('.answer-group');
                answerGroups.forEach((group, index) => {
                    const answer = group.querySelector('.answer-input input').value;
                    const explanation = group.querySelector('.explanation-input input').value;
                    if (answer || explanation) {
                        formData.answers.push({
                            answer: answer,
                            explanation: explanation
                        });
                    }
                });

                // Collect media
                const mediaItems = document.querySelectorAll('.media-item');
                mediaItems.forEach((item, index) => {
                    const fileInput = item.querySelector('.file-input');
                    const descInput = item.querySelector('.media-input:not(.file-input)');
                    const fileName = fileInput.value;
                    const description = descInput.value;

                    if (fileName && !fileName.startsWith('Media file')) {
                        formData.media.push({
                            fileName: fileName,
                            description: description
                        });
                    }
                });

                console.log('Dữ liệu form:', formData);
                alert('Đã lưu thành công! Kiểm tra console để xem dữ liệu.');
            }
        </script>
    </body>
</html>
