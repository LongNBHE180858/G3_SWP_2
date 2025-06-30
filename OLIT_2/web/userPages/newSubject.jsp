<%-- 
    Document   : newSubject
    Created on : Jun 29, 2025, 9:49:24 PM
    Author     : khain
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>New Subject</title>
    <style>
        .form-container {
            background: #fff;
            width: 460px;
            margin: 40px auto;
            border-radius: 16px;
            box-shadow: 0 6px 28px rgba(0,0,0,0.10);
            padding: 32px 40px 28px 40px;
        }
        h2 { margin-bottom: 22px; }
        label { display: block; margin-top: 16px; font-weight: 600; }
        input[type="text"], select, textarea {
            width: 100%; margin-top: 7px; padding: 10px; border-radius: 8px; border: 1px solid #e0e7f0; font-size: 1em;
        }
        textarea { height: 75px; }
        .status-group { margin-top: 12px; }
        .btn-row { margin-top: 24px; display: flex; gap: 13px; }
        button, .btn-row a {
            background: #3867fa; color: #fff; border: none; border-radius: 8px; padding: 9px 26px;
            font-size: 1em; font-weight: 600; text-decoration: none; transition: background 0.2s;
        }
        button[type="reset"], .btn-row a { background: #bbb; color: #23376a; }
        button[type="reset"]:hover, .btn-row a:hover { background: #888; color: #fff; }
        button[type="submit"]:hover { background: #204ac4; }
    </style>
</head>
<body>
<div class="form-container">
    <h2>New Subject</h2>
    <form action="${pageContext.request.contextPath}/newSubject" method="post" enctype="multipart/form-data">
        <label>Name</label>
        <input type="text" name="subjectName" required />

        <label>Images & Videos</label>
        <input type="file" name="mediaFiles" multiple />

        <label>Category</label>
        <select name="category" required>
            <c:forEach var="cat" items="${categoryList}">
                <option value="${cat}">${cat}</option>
            </c:forEach>
        </select>

        <label>Owner (Expert)</label>
        <select name="ownerId" required>
            <c:forEach var="expert" items="${expertList}">
                <option value="${expert.userID}">${expert.fullName}</option>
            </c:forEach>
        </select>

        <div class="status-group">
            <label>Status</label>
            <label><input type="radio" name="status" value="1" checked /> Published</label>
            <label><input type="radio" name="status" value="0" /> Draft</label>
        </div>

        <label>Description</label>
        <textarea name="description"></textarea>

        <div class="btn-row">
            <button type="submit">Save</button>
            <button type="reset">Reset</button>
            <a href="${pageContext.request.contextPath}/SubjectList">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
