<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Register Course</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .overlay {
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 1000;
        }

        .popup {
            background: #ffffff;
            padding: 35px 30px;
            border-radius: 16px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 480px;
            animation: fadeIn 0.3s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.95);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        h2 {
            text-align: center;
            color: #1e88e5;
            margin-bottom: 25px;
            font-size: 22px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 16px;
        }

        label {
            display: block;
            font-weight: 500;
            margin-bottom: 6px;
            color: #333;
        }

        input[type="text"],
        input[type="email"],
        input[type="tel"],
        select {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s ease;
        }

        input:focus,
        select:focus {
            border-color: #1e88e5;
            outline: none;
            box-shadow: 0 0 5px rgba(30, 136, 229, 0.2);
        }

        input[readonly] {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }

        .gender-group {
            display: flex;
            gap: 16px;
            margin-top: 5px;
        }

        .gender-group label {
            font-weight: normal;
            font-size: 14px;
            color: #444;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
            gap: 12px;
            margin-top: 25px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            font-size: 15px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn-register {
            background-color: #1e88e5;
            color: white;
        }

        .btn-register:hover {
            background-color: #1565c0;
        }

        .btn-cancel {
            background-color: #e0e0e0;
            color: #333;
        }

        .btn-cancel:hover {
            background-color: #bdbdbd;
        }
    </style>
</head>
<body>
    <div class="overlay">
        <div class="popup">
            <h2>Register Course</h2>
            <form action="RegisterCourse" method="post">
                <input type="hidden" name="courseID" value="${param.courseID}" />

                <div class="form-group">
                    <label for="package">Choose Price Package</label>
                    <select id="package" name="package" required>
                        <option value="">-- Select Package --</option>
                        <c:forEach items="${pricePackages}" var="pkg">
                            <option value="${pkg.packageID}">
                                <c:out value="${pkg.name}"/> - $${pkg.salePrice}
                                <c:if test="${pkg.listPrice > pkg.salePrice}">
                                    (was $${pkg.listPrice})
                                </c:if>
                                - ${pkg.accessDuration} months access
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName"
                           value="${sessionScope.fullAccount != null ? sessionScope.fullAccount.fullName : ''}"
                           ${sessionScope.fullAccount != null ? 'readonly' : ''} required>
                </div>

                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email"
                           value="${sessionScope.fullAccount != null ? sessionScope.fullAccount.email : ''}"
                           ${sessionScope.fullAccount != null ? 'readonly' : ''} required>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <input type="tel" id="phoneNumber" name="phoneNumber"
                           value="${not empty sessionScope.fullAccount ? sessionScope.fullAccount.phoneNumber : ''}"
                           ${not empty sessionScope.fullAccount ? 'readonly' : ''} required>
                </div>

                <div class="form-group">
                    <label>Gender</label>
                    <div class="gender-group">
                        <label><input type="radio" name="gender" value="Male" <c:if test="${fullAccount.gender == 'Male'}">checked</c:if>> Male</label>
                        <label><input type="radio" name="gender" value="Female" <c:if test="${fullAccount.gender == 'Female'}">checked</c:if>> Female</label>
                        <label><input type="radio" name="gender" value="Other" <c:if test="${fullAccount.gender != 'Male' && fullAccount.gender != 'Female'}">checked</c:if>> Other</label>
                    </div>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn btn-register">Register</button>
                    <button type="button" class="btn btn-cancel" onclick="window.location.href = 'CourseDetail?id=${param.courseID}'">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
