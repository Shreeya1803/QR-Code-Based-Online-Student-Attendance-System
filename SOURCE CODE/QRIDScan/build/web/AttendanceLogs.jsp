<%@page import="QRAttendance.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>QR Based Student Attendance Management System</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <link href="css/table.css" rel="stylesheet">
    </head>
 <%
            if (request.getParameter("Activated") != null) {%>
        <script>alert('Approved');</script>  
        <%}
        %>
         <%
            if (request.getParameter("Rejected") != null) {%>
        <script>alert('Rejected');</script>  
        <%}
        %>
    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar Start -->
        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow  sticky-top p-0 navbar-fixed-top">
            <a href="#" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="StaffHome.jsp" class="nav-item nav-link">Home</a>
                    <a href="StudentApproval.jsp" class="nav-item nav-link">Students Approval</a>
                    <a href="StudentDetails.jsp" class="nav-item nav-link">Students Details</a>
                    <a href="CheckAttendance.jsp" class="nav-item nav-link">Check Attendance</a>
                    <a href="AttendanceLogs.jsp" class="nav-item nav-link active">Attendance Logs</a>
                </div>
                <a href="logout.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Logout<i class="fa fa-lock ms-3"></i></a>
            </div>
        </nav>


    <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Attendance Logs</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->


    <!-- 404 Start -->
    <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <!-- Filter Section -->
                <div style="margin-bottom: 20px;">
                    <label for="filterName">Filter by Name:</label>
                    <select id="filterName" onchange="filterTable()">
                        <option value="all">All</option>
                        <%
                            // Fetch distinct student names to populate the dropdown
                            Connection con = SQLconnection.getconnection();
                            Statement st = con.createStatement();
                            ResultSet rsNames = st.executeQuery("SELECT DISTINCT sname FROM attendance");
                            while (rsNames.next()) {
                        %>
                            <option value="<%= rsNames.getString("sname") %>"><%= rsNames.getString("sname") %></option>
                        <% } %>
                    </select>

                    <label for="filterDept">Filter by Department:</label>
                    <select id="filterDept" onchange="filterTable()">
                        <option value="all">All</option>
                        <%
                            // Fetch distinct departments to populate the dropdown
                            ResultSet rsDepts = st.executeQuery("SELECT DISTINCT sdept FROM attendance");
                            while (rsDepts.next()) {
                        %>
                            <option value="<%= rsDepts.getString("sdept") %>"><%= rsDepts.getString("sdept") %></option>
                        <% } %>
                    </select>
                </div>

                <!-- Table -->
                <table id="naresh" style="margin-left: -50px;padding: 10px;">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Department</th>
                            <th>Present Date</th>
                            <th>Attendance Time</th>
                            <th>Attendance Pic</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ResultSet rs = st.executeQuery("SELECT * FROM attendance");
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("sname") %></td>
                            <td><%= rs.getString("sdept") %></td>
                            <td><%= rs.getString("date") %></td>
                            <td><%= rs.getString("atime") %></td>
                            <td><img src="spic.jsp?uid=<%= rs.getString("id") %>" width="100px"></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

    <!-- 404 End -->
        
 <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
            <div class="row g-5">
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3"></h4>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3"></h4>
                    <div class="d-flex pt-2">
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3"></h4>
                </div>
                <div class="col-lg-3 col-md-6">
                    <h4 class="text-white mb-3"></h4>
                    <p></p>
                    <div class="position-relative mx-auto" style="max-width: 400px;">
                    </div>
                </div>
            </div>
        </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#"></a> All Right Reserved.
                            <a class="border-bottom" href="#"></a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
        <script>
    function filterTable() {
        const filterName = document.getElementById('filterName').value.toLowerCase();
        const filterDept = document.getElementById('filterDept').value.toLowerCase();
        const table = document.getElementById('naresh');
        const rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) {
            const cells = rows[i].getElementsByTagName('td');
            const name = cells[0].textContent.toLowerCase();
            const dept = cells[1].textContent.toLowerCase();

            if ((filterName === "all" || name.includes(filterName)) &&
                (filterDept === "all" || dept.includes(filterDept))) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
    }
</script>

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>