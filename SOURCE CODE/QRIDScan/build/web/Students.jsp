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
    </head>
    <%
            if (request.getParameter("LogAdded") != null) {
               
 String sname=session.getAttribute("sname").toString();
%>
        <script>alert('Hi <%=sname%> your attendance has been registered');</script>  
        <%}
        %>
<%
   
            if (request.getParameter("Already") != null) {
                 String sname=session.getAttribute("sname").toString();
               
%>
        <script>alert('Hi <%=sname%> your attendance has been Already registered');</script>  
        <%}
        %>
        
    <%
            if (request.getParameter("LogFailed") != null) {%>
    <script>alert('Invalid ID');</script>  
    <%}
    %>
    <%
     if (request.getParameter("Success") != null) {%>
    <script>alert('Registration Success');</script>  
    <%}
    %>
    <%
             if (request.getParameter("mailid") != null) {%>
    <script>alert('Mail Id Already Registered');</script>  
    <%}
    %>
    <%
            if (request.getParameter("not") != null) {%>
    <script>alert('Your Account not yet approved. please try again later');</script>  
    <%}
    %>
    <%
            if (request.getParameter("Authentication_Failed") != null) {%>
    <script>alert('Incorrect id and password');</script>  
    <%}
    %>
    <%
if (request.getParameter("AlreadyScanned") != null) {
%>
<script>alert('You have already scanned the QR code within the last hour. Please try again later.');</script>
<%
}
%>

    <body>
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <nav class="navbar navbar-expand-lg bg-white navbar-light shadow sticky-top p-0">
             <a href="#" class="navbar-brand d-flex align-items-center px-4 px-lg-5">
                <h2 class="m-0 text-primary"></h2>
            </a>
            <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto p-4 p-lg-0">
                    <a href="index.jsp" class="nav-item nav-link">Home</a>
                    <a href="Staff.jsp" class="nav-item nav-link">Staff</a>
                    <a href="Students.jsp" class="nav-item nav-link active">Students</a>
                    <a href="Reg.jsp" class="nav-item nav-link">Registration</a>
                </div>
                <a href="Attendance.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Attendance Scan<i class="fa fa-camera ms-3"></i></a>
            </div>
        </nav>
        <!-- Navbar End -->
        <div class="container-fluid bg-primary py-5 mb-5 ">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1 class="display-3 text-white animated slideInDown">Students</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->

        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Login</h6>
                    <h1 class="mb-5"></h1>
                </div>
                <div class="row">
                    <center><div class="col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <form action="StudentLog" method="post">
                                <div class="row g-3">
                                    <div class="col-md-12">
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="email" name="email" required="" placeholder="Email">
                                            <label for="email">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="password" class="form-control" id="subject" name="password" required="" placeholder="Password">
                                            <label for="subject">Password</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div></center>

                </div>
            </div>
            <br> <br> <br> <br> <br> <br> <br>
        </div>
        <!-- Contact End -->


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
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>


        <!-- JavaScript Libraries -->
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
