
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
                    <a href="Students.jsp" class="nav-item nav-link">Students</a>
                    <a href="Reg.jsp" class="nav-item nav-link active">Registration</a>
                </div>
                <a href="Attendance.jsp" class="btn btn-primary py-4 px-lg-5 d-none d-lg-block">Attendance Scan<i class="fa fa-camera ms-3"></i></a>
            </div>
        </nav>
        <div class="container-fluid bg-primary py-5 mb-5">
            <div class="container py-5">
                <div class="row justify-content-center">
                    <div class="col-lg-10 text-center">
                        <h1 class="display-3 text-white animated slideInDown">Students Registration</h1>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <!-- Header End -->
        <!-- Contact Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h6 class="section-title bg-white text-center text-primary px-3">Registration</h6>
                    <h1 class="mb-5"></h1>
                </div>
                <div class="row">
                    <center><div class="col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                            <form action="StudentReg" method="post"  enctype="multipart/form-data">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="subject" name="rollno" placeholder="Name"required pattern="\d{10}" title="Roll number must be a 10-digit number">
                                            <label for="subject">Roll Number</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <select class="form-control" id="subject" name="syear" style="border: 2px solid #ff6376;" placeholder="Name">
                                                <option value="1st Year">1 Year</option>
                                                <option value="2nd Year">2 Year</option>
                                                <option value="3rd Year">3 Year</option>
                                                <option value="Final Year">Final Year</option>
                                            </select>
                                            <label for="subject">Select Year</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <select class="form-control" id="subject" name="sdept" style="border: 2px solid #ff6376;" placeholder="Name">
                                                <option value="IT">IT</option>
                                                <option value="CSE">CSE</option>
                                                
                                                <option value="MCA">MCA</option>
                                            </select>
                                            <label for="subject">Select Department</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="file" class="form-control" id="subject" style="border: 2px solid #ff6376;" name="pphoto" placeholder="Name">
                                            <label for="subject">Photo</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="subject" name="name" placeholder="Name">
                                            <label for="subject">Name</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="email" class="form-control" id="subject" name="email" placeholder="Email">
                                            <label for="subject">Email</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="subject" name="phone" placeholder="Phone Number">
                                            <label for="subject">Phone Number</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <textarea class="form-control" placeholder="Address" name="address" id="message" style="height: 150px;border: 2px solid #ff6376"></textarea>
                                            <label for="message">Address</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-floating">
                                            <input type="password" class="form-control" id="password" name="pass" placeholder="Password" required>
                                            <label for="subject">Password</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
    <div class="form-floating">
        <input type="password" class="form-control" id="confirmPassword" placeholder="Confirm Password" required>
        <label for="confirmPassword">Confirm Password</label>
    </div>
</div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit" id="registerBtn" disabled>Register</button>
                                    </div>
                                </div>
                            </form>
                        </div></center>
                </div>
            </div>
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
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        
        <!<!-- confirm password  -->
        <script>
    document.addEventListener('DOMContentLoaded', function () {
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        const registerBtn = document.getElementById('registerBtn');

        function validatePassword() {
            if (password.value === confirmPassword.value && password.value !== "") {
                confirmPassword.setCustomValidity('');
                registerBtn.disabled = false;
            } else {
                confirmPassword.setCustomValidity('Passwords do not match');
                registerBtn.disabled = true;
            }
        }

        password.addEventListener('input', validatePassword);
        confirmPassword.addEventListener('input', validatePassword);
    });
</script>

    </body>

</html>