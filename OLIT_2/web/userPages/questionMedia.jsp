<!-- userPages/questionMedia.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quản lý Media</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f5f5f5; margin: 0; padding: 20px; }
    .container { max-width: 800px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; }
    h1, h2 { color: #333; }
    form { margin-bottom: 24px; }
    label { display: block; margin-bottom: 8px; font-weight: 500; }
    input[type="text"], select, input[type="file"] {
      width: 100%; padding: 8px; margin-bottom: 12px; border: 1px solid #ccc; border-radius: 4px;
    }
    button { padding: 8px 16px; border: none; border-radius: 4px; background: #3b82f6; color: #fff; cursor: pointer; }
    button:hover { background: #2563eb; }
    .media-item { border-bottom: 1px solid #eee; padding: 12px 0; }
    .media-preview { margin-bottom: 8px; }
    .media-description { font-style: italic; color: #555; margin-bottom: 8px; }
    .actions { display: flex; gap: 8px; }
    .actions form { display: inline; }
  </style>
</head>
<body>
  <div class="container">
    <h1>Upload Media cho Question ${questionID}</h1>
    <c:if test="${not empty error}">
      <div style="color: #e74c3c; margin-bottom: 12px;">${error}</div>
    </c:if>
    <c:if test="${not empty success}">
      <div style="color: #10b981; margin-bottom: 12px;">${success}</div>
    </c:if>

    <form action="questionMedia" method="post" enctype="multipart/form-data">
      <input type="hidden" name="action" value="upload"/>
      <input type="hidden" name="questionID" value="${questionID}"/>
      <label>Loại Media</label>
      <select name="mediaType">
        <option value="1">Image</option>
        <option value="2">Video</option>
        <option value="3">Audio</option>
      </select>
      <label>Chọn File</label>
      <input type="file" name="file"/>
      <label>Mô tả</label>
      <input type="text" name="mediaDescription" placeholder="Nhập mô tả"/>
      <button type="submit">Upload</button>
    </form>

    <h2>Danh sách Media</h2>
    <c:forEach var="m" items="${mediaList}">
      <div class="media-item">
        <div class="media-preview">
          <c:choose>
            <c:when test="${m.mediaType == 1}">
              <img src="${pageContext.request.contextPath}/uploads/${m.mediaURL}" alt="" style="max-width:100%;"/>
            </c:when>
            <c:when test="${m.mediaType == 2}">
              <video controls style="max-width:100%;"><source src="${pageContext.request.contextPath}/uploads/${m.mediaURL}" type="video/mp4"/></video>
            </c:when>
            <c:when test="${m.mediaType == 3}">
              <audio controls><source src="${pageContext.request.contextPath}/uploads/${m.mediaURL}" type="audio/mpeg"/></audio>
            </c:when>
          </c:choose>
        </div>
        <div class="media-description">${m.mediaDescription}</div>

        <div class="actions">
          <form action="questionMedia" method="post" enctype="multipart/form-data">
            <input type="hidden" name="action" value="update"/>
            <input type="hidden" name="questionID" value="${questionID}"/>
            <input type="hidden" name="mediaID" value="${m.mediaId}"/>
            <input type="hidden" name="currentMediaURL" value="${m.mediaURL}"/>

            <label>Loại Media</label>
            <select name="mediaType">
              <option value="1" ${m.mediaType==1?'selected':''}>Image</option>
              <option value="2" ${m.mediaType==2?'selected':''}>Video</option>
              <option value="3" ${m.mediaType==3?'selected':''}>Audio</option>
            </select>
            <label>Đổi File</label>
            <input type="file" name="file"/>
            <label>Mô tả</label>
            <input type="text" name="mediaDescription" value="${m.mediaDescription}"/>
            <button type="submit">Cập nhật</button>
          </form>

          <form action="questionMedia" method="post" onsubmit="return confirm('Xác nhận xóa?')">
            <input type="hidden" name="action" value="delete"/>
            <input type="hidden" name="questionID" value="${questionID}"/>
            <input type="hidden" name="mediaID" value="${m.mediaId}"/>
            <button type="submit" style="background:#ef4444;">Xóa</button>
          </form>
        </div>
      </div>
    </c:forEach>
  </div>
</body>
</html>
