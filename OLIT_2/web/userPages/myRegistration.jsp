<%-- 
    Document   : myRegistration
    Created on : Jun 2, 2025, 10:25:29 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Registration" %>
<%@ page import="model.Course" %>
<%@ page import="model.PricePackage" %>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <title>My Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            html,
            body {
                height: 100%;
                margin: 0;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f5faff;
                display: flex;
                flex-direction: column;
            }

            main {
                flex: 1;
                padding: 20px;
                padding-bottom: 100px;
                /* chừa chỗ cho button cố định */
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

            h3 {
                color: #0d6efd;
                font-weight: bold;
                margin-bottom: 25px;
            }

            table {
                background-color: white;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            thead.table-dark {
                background-color: #0d6efd !important;
            }

            .table thead th {
                color: white;
                text-align: center;
                vertical-align: middle;
            }

            .table td {
                vertical-align: middle;
                text-align: center;
            }

            .cancel-btn {
                background-color: #dc3545;
                border: none;
                padding: 5px 10px;
                font-size: 14px;
                border-radius: 4px;
                color: white;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .cancel-btn:hover {
                background-color: #bb2d3b;
            }

            .form-control,
            .form-select {
                background-color: #e0f4ff;
                border: 1px solid #7ec8e3;
                border-radius: 6px;
                color: #333;
                transition: border-color 0.3s ease;
            }

            .form-control:focus,
            .form-select:focus {
                border-color: #0d6efd;
                box-shadow: 0 0 5px rgba(13, 110, 253, 0.3);
            }

            label.form-label {
                font-weight: bold;
                color: #333;
            }


            .bottom-left-btn {
                height: 40px;
                left: 30px;
                background-color: #6c757d;
                color: white;
            }

            .bottom-right-btn {
                height: 40px;
                right: 30px;
                background-color: #0d6efd;
                color: white;
            }



            .bottom-left-btn:hover {
                background-color: #5c636a;
            }

            .bottom-right-btn:hover {
                background-color: #0b5ed7;
            }

            footer {
                background-color: #f0f0f0;
                padding: 15px 40px;
                text-align: center;
                font-size: 14px;
                color: #333;
                box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.05);
            }

            @media (max-width: 768px) {
                header {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 10px;
                }

                .nav-links a {
                    margin: 5px 0;
                }

                .bottom-left-btn,
                .bottom-right-btn {
                    bottom: 100px;
                    /* Adjusted for mobile to avoid footer */
                    padding: 8px 14px;
                    font-size: 14px;
                }
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

        <main>
            <div class="container-fluid">
                <h3 class="mb-4">My Registration</h3>
                <div class="row">
                    <!-- Left Section: Course List -->
                    <div class="col-md-9">
                        <table class="table table-bordered table-striped align-middle">
                            <thead class="table-dark">
                                <tr>
                                    <th>ID</th>
                                    <th>Subject</th>
                                    <th>Registration Time</th>
                                    <th>Package</th>
                                    <th>Total Cost</th>
                                    <th>Status</th>
                                    <th>Valid From</th>
                                    <th>Valid To</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<Registration> registrations = (List<Registration>) request.getAttribute("registrations");
                                    if (registrations != null) {
                                        for (Registration r : registrations) {
                                %>
                                <tr>
                                    <td><%= r.getRegistrationID() %></td>
                                    <td><%= r.getCourse().getCourseTitle() %></td>
                                    <td><%= r.getValidFrom() %></td>
                                    <td><%= r.getPricePackage().getName() %></td>
                                    <td>$<%= r.getPricePackage().getSalePrice() %></td>
                                    <td>
                                        <span class="badge bg-<%= "Active".equals(r.getStatus()) ? "success" : "secondary" %>">
                                            <%= r.getStatus() %>
                                        </span>
                                    </td>
                                    <td><%= r.getValidFrom() %></td>
                                    <td><%= r.getValidTo() %></td>
                                    <td>
                                        <% if ("Pending".equals(r.getStatus())) { %>
                                        <button class="btn btn-danger btn-sm cancel-btn">Cancel</button>
                                        <% } %>
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>

                        </table>

                        <!-- Pagination -->
                        <div class="d-flex justify-content-center mt-4">
                            <nav>
                                <ul class="pagination">
                                    <!-- Prev -->
                                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                                        <a class="page-link" href="MyRegistration?page=${currentPage - 1}" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <!-- Page numbers -->
                                    <c:forEach begin="1" end="${totalPages}" var="i">
                                        <li class="page-item ${i == currentPage ? 'active' : ''}">
                                            <a class="page-link" href="MyRegistration?page=${currentPage}">${currentPage}</a>
                                        </li>
                                    </c:forEach>
                                    <!-- Next -->
                                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                                        <a class="page-link" href="MyRegistration?page=${currentPage + 1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <!-- Right Section: Filter -->
                    <div class="col-md-3">
                        <div class="mb-3">
                            <label for="search" class="form-label">Search</label>
                            <input type="text" id="search" class="form-control" placeholder="Search subject...">
                        </div>
                        <div class="mb-3">
                            <label for="subjectFilter" class="form-label">Filter by Subject</label>
                            <select id="subjectFilter" class="form-select">
                                <option value="">-- All Subjects --</option>
                                <option value="Java Web">Java Web</option>
                                <option value="Python Backend">Python Backend</option>
                                <option value="React Frontend">React Frontend</option>
                            </select>
                        </div>
                        <div>
                            <!-- Fixed Buttons -->
                            <button class="bottom-left-btn" style="border-radius: 8px;">⚙️ Settings</button>
                            <button class="bottom-right-btn" style="border-radius: 8px;">➕ Course Register</button>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer>
            <p>📞 Contact: contact@onlinelearn.vn | ☎ 0123 456 789</p>
        </footer>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const searchInput = document.getElementById('search');
                const subjectFilter = document.getElementById('subjectFilter');
                const tableRows = document.querySelectorAll('tbody tr');

                function filterTable() {
                    const searchText = searchInput.value.toLowerCase().trim();
                    const selectedSubject = subjectFilter.value;

                    tableRows.forEach(row => {
                        const subject = row.cells[1].textContent.trim();
                        const matchSearch = subject.toLowerCase().includes(searchText);
                        const matchFilter = !selectedSubject || subject === selectedSubject;

                        if (matchSearch && matchFilter) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                }

                searchInput.addEventListener('input', filterTable);
                subjectFilter.addEventListener('change', filterTable);
            });
        </script>
    </body>

</html>
