<%-- 
    Document   : userProfile
    Created on : Jun 2, 2025, 8:50:38 PM
    Author     : NAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.AccountDAO"%>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <title>User Profile</title>
        <style>
            * {
                box-sizing: border-box;
            }
            
            html {
                margin: 0;
                padding: 0;
            }
            
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }
            
            .header {
                background-color: #1e88e5;
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
            
            .profile-container {
                display: flex;
                max-width: 700px;
                margin: auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 8px rgba(0,0,0,0.1);
                overflow: hidden;
                margin-top: 50px;
            }
            .left-panel {
                width: 250px;
                background-color: #007bff;
                color: white;
                padding: 20px;
                text-align: center;
            }
            .avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                border: 4px solid white;
                margin-bottom: 15px;
            }
            .btn-change {
                background-color: white;
                color: #007bff;
                border: none;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }
            .btn-change:hover {
                background-color: #e6e6e6;
            }
            
            .btn-change-1 {
                background-color: white;
                color: #007bff;
                border: none;
                padding: 10px 16px;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }
            .btn-change-1:hover {
                background-color: #e6e6e6;
            }

            .right-panel {
                flex: 1;
                padding: 25px 40px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 6px;
                font-weight: 600;
                color: #333;
            }
            input[type="text"],
            input[type="email"],
            input[type="date"],
            input[type="tel"] {
                width: 100%;
                padding: 8px 10px;
                font-size: 14px;
                border: 1.5px solid #ccc;
                border-radius: 4px;
                transition: border-color 0.3s ease;
            }
            input[readonly] {
                pointer-events: none;
            }
            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="date"]:focus,
            input[type="tel"]:focus {
                border-color: #007bff;
                outline: none;
            }

            .gender-group {
                display: flex;
                gap: 20px;
                align-items: center;
            }
            .gender-group label {
                font-weight: normal;
                color: #555;
                cursor: pointer;
            }
            .gender-group input {
                margin-right: 5px;
                cursor: pointer;
            }
            
            /* Overlay nền mờ */
            .modal {
              display: none;
              position: fixed;
              z-index: 1000;
              inset: 0;
              background-color: rgba(0, 0, 0, 0.4);
              backdrop-filter: blur(2px); /* hiệu ứng mờ hiện đại */
              animation: fadeIn 0.3s ease-in-out;
            }

            /* Nội dung hộp thoại */
            .modal-content {
              position: relative;
              background-color: #fff;
              margin: auto;
              margin-top: 8vh;
              width: 90%;
              max-width: 550px;
              border-radius: 16px;
              box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
              padding: 30px;
              animation: slideUp 0.4s ease;
              transition: all 0.3s ease-in-out;
            }

            /* Nút đóng */
            .close {
              position: absolute;
              top: 14px;
              right: 18px;
              font-size: 22px;
              font-weight: bold;
              color: #888;
              cursor: pointer;
              transition: color 0.2s;
            }

            .close:hover {
              color: #000;
            }

            /* Nhóm form */
            .modal-content .form-group {
              margin-bottom: 18px;
            }

            .modal-content label {
              display: block;
              margin-bottom: 6px;
              font-weight: 600;
              color: #333;
            }

            .modal-content input,
            .modal-content select {
              width: 100%;
              padding: 10px 14px;
              border: 1.5px solid #ccc;
              border-radius: 8px;
              font-size: 15px;
              transition: border-color 0.3s;
            }

            .modal-content input:focus,
            .modal-content select:focus {
              border-color: #3f77ff;
              outline: none;
            }

            /* Nút lưu */
            .modal-content .btn-change {
              background: #3f77ff;
              color: #fff;
              border: none;
              padding: 10px 20px;
              font-weight: bold;
              border-radius: 8px;
              cursor: pointer;
              transition: background 0.3s ease;
            }

            .modal-content .btn-change:hover {
              background: #2f66e0;
            }

            /* Hiệu ứng */
            @keyframes fadeIn {
              from { opacity: 0; }
              to { opacity: 1; }
            }

            @keyframes slideUp {
              from {
                opacity: 0;
                transform: translateY(40px);
              }
              to {
                opacity: 1;
                transform: translateY(0);
              }
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">Online Course</div>
            <div class="nav">
                <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
                <a href="${pageContext.request.contextPath}/MyRegistration">Registration</a>
                <a href="${pageContext.request.contextPath}/MyCourseServlet">My Course</a>
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
        <c:choose>
            <c:when test="${not empty sessionScope.userEmail}">
                
                <c:if test="${not empty sessionScope.message}">
                    <div class="${sessionScope.messageType == 'success' ? 'message-success' : 'message-error'}">
                        ${sessionScope.message}
                    </div>
                    <c:remove var="message" scope="session" />
                    <c:remove var="messageType" scope="session" />
                </c:if> 
                <div class="profile-container">
                    <c:set var="userInfor" value="${AccountDAO.getAccountByMail(sessionScope.userEmail)}" scope="page"/>
                    <!-- Avatar và nút mở modal -->
                    <div class="left-panel">
                        <img src="${empty userInfor.urlAvatar ? 'https://i.pravatar.cc/150' : userInfor.urlAvatar}" 
                             alt="Avatar" class="avatar" id="avatarImg" />
                        <button type="button" class="btn-change-1" onclick="openModal()" style="margin-top:18px;">Edit Information</button>
                        <button type="button" class="btn-change-1" onclick="openAvatarModal()" style="margin-top:14px;">Change Avatar</button>
                    </div>

                    <div class="right-panel">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" value="${userInfor.getFullName()}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Birthday</label>
                            <input type="date" value="${userInfor.getBirthday()}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="tel" value="${userInfor.getPhoneNumber()}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" value="${userInfor.getEmail()}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Gender</label>
                            <input type="text" value="${userInfor.getGender()}" readonly />
                        </div>

                        <div style="margin-top: 20px;">
                            <a href="${pageContext.request.contextPath}/userPages/changePassword.jsp" class="btn-change">Change Password</a>
                        </div>
                    </div>

            </c:when>
            <c:otherwise>
                <p>User information not found!</p>
            </c:otherwise>
        </c:choose>
                
        <div id="editModal" class="modal">
            <div class="modal-content">
              <span class="close" onclick="closeModal()">&times;</span>
              <form action="${pageContext.request.contextPath}/EditUserProfile" method="post">
                  <div class="form-group">
                      <label>Full Name</label>
                      <input type="text" name="fullName" value="${account.fullName}" required />
                  </div>
                  <div class="form-group">
                      <label>Birthday</label>
                      <input type="date" name="birthday" value="${account.birthday}" max="<%= java.time.LocalDate.now() %>" required />
                  </div>
                  <div class="form-group">
                      <label>Phone</label>
                      <input type="tel" name="phoneNumber" value="${account.phoneNumber}" required />
                  </div>
                  <div class="form-group">
                      <label>Email</label>
                      <input type="email" value="${account.email}" readonly />
                  </div>
                  <div class="form-group">
                      <label>Gender</label>
                      <div class="gender-group">
                          <label><input type="radio" name="gender" value="Male" <c:if test="${account.gender == 'Male'}">checked</c:if>> Male</label>
                          <label><input type="radio" name="gender" value="Female" <c:if test="${account.gender == 'Female'}">checked</c:if>> Female</label>
                          <label><input type="radio" name="gender" value="Other" <c:if test="${account.gender != 'Male' && account.gender != 'Female'}">checked</c:if>> Other</label>
                      </div>
                  </div>
                  <div style="margin-top: 20px;">
                      <button type="submit" class="btn-change">Save</button>
                  </div>
              </form>
            </div>
          </div>

        <!-- Modal đổi avatar -->
        <div id="avatarModal" class="modal">
          <div class="modal-content">
            <span class="close" onclick="closeAvatarModal()">&times;</span>
            <form action="${pageContext.request.contextPath}/EditUserProfile" method="post" enctype="multipart/form-data">
              <div class="form-group" style="text-align:center;">
                <img id="avatarPreview" src="${empty userInfor.urlAvatar ? 'https://i.pravatar.cc/150' : userInfor.urlAvatar}" alt="Preview" style="width:120px; height:120px; border-radius:50%; object-fit:cover; margin-bottom:16px; border:3px solid #eee;" />
                <input type="file" name="avatar" accept="image/*" id="avatarInputModal" style="display:block; margin:auto; margin-bottom:16px;" onchange="previewAvatarModal(event)" required />
              </div>
              <div style="text-align:center;">
                <button type="submit" class="btn-change">Save Avatar</button>
              </div>
            </form>
          </div>
        </div>

                <script>
                    function openModal() {
                        document.getElementById("editModal").style.display = "block";
                    }
                    function closeModal() {
                        document.getElementById("editModal").style.display = "none";
                    }
                    window.onclick = function(event) {
                      const modal = document.getElementById("editModal");
                      if (event.target == modal) {
                        closeModal();
                      }
                    }
                </script>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
        const birthdayInput = document.querySelector('input[name="birthday"]');

        // Tính năm hiện tại - 16
        const currentYear = new Date().getFullYear();
        const maxYear = currentYear - 16;

        // Gán ngày max là 31-12-(năm hiện tại - 16)
        birthdayInput.setAttribute("max", `${maxYear}-12-31`);
    });

    // Kiểm tra trước khi submit
    document.querySelector('form').addEventListener("submit", function (e) {
        const phone = document.querySelector('input[name="phoneNumber"]').value.trim();
        const phoneRegex = /^0\d{9}$/;

        if (!phoneRegex.test(phone)) {
            alert("Invalid phone number! Please enter 10 digits and start with 0 .");
            e.preventDefault();
            return;
        }

        // Kiểm tra tuổi theo năm
        const birthdayValue = document.querySelector('input[name="birthday"]').value;
        const birthYear = new Date(birthdayValue).getFullYear();
        const currentYear = new Date().getFullYear();

        if (currentYear - birthYear < 16) {
            alert("Users must be 16 years of age or older.");
            e.preventDefault();
        }
    });
</script>
<script>
    function previewAvatar(event) {
        const input = event.target;
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('avatarImg').src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script>
    function openAvatarModal() {
        document.getElementById('avatarModal').style.display = 'block';
    }
    function closeAvatarModal() {
        document.getElementById('avatarModal').style.display = 'none';
    }
    function previewAvatarModal(event) {
        const input = event.target;
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById('avatarPreview').src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    window.onclick = function(event) {
        const modal = document.getElementById('avatarModal');
        if (event.target == modal) {
            closeAvatarModal();
        }
    }
</script>

    </body>
</html>

