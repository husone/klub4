<%-- 
    Document   : user-view-category
    Created on : Nov 7, 2022, 10:21:49 AM
    Author     : ASUS
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Klub4</title>
        <!-- CSS here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/slicknav.css">
        <link rel="stylesheet" href="assets/css/flaticon.css">
        <link rel="stylesheet" href="assets/css/progressbar_barfiller.css">
        <link rel="stylesheet" href="assets/css/gijgo.css">
        <link rel="stylesheet" href="assets/css/animate.min.css">
        <link rel="stylesheet" href="assets/css/animated-headline.css">
        <link rel="stylesheet" href="assets/css/magnific-popup.css"> -->
        <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
        <link rel="stylesheet" href="assets/css/themify-icons.css">
        <link rel="stylesheet" href="assets/css/slick.css">
        <link rel="stylesheet" href="assets/css/nice-select.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <!-- plugins:css -->
        <link rel="stylesheet" href="./assets/js/vendor/feather/feather.css">
        <link rel="stylesheet" href="./assets/js/vendor/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" href="./assets/js/vendor/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- Plugin css for this page -->
        <link rel="stylesheet" href="./assets/js/vendor/datatables.net-bs4/dataTables.bootstrap4.css">
        <link rel="stylesheet" href="./assets/js/vendor/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" type="text/css" href="js/select.dataTables.min.css">
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="./assets/css/vertical-layout-light/style.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="./assets/img/logo/logo.png" />
        <link rel="stylesheet" href="./assets/css/user-detail.css">
        <link rel="stylesheet" href="./assets/css/fontawesome-all.min.css">


        <style>
            .pagination {
                display: inline-block;
            }

            .pagination a {
                color: black;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
                transition: background-color .3s;
                border-radius: 10px;
            }

            .pagination a.active {
                background-color: #FF4747;
                color: white;
            }

            .pagination a:hover:not(.active) {
                background-color: #ddd;
            }
        </style>




    </head>


    <body>

        <header>
            <jsp:include page="./jspfragment/navbar-user.jsp" />
        </header>
        <!-- partial -->
        <!-- partial:partials/_sidebar.html -->
        <!-- partial -->
        <div class="topic-area section-padding40 col-12 mb-3">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xl-7 col-lg-8">
                        <div class="section-tittle text-center mb-20">
                            <h2>Types of club</h2>
                        </div>
                    </div>
                </div>
                <form action="" class="d-none">
                    <div class="row col-12 mb-20">
                        <div class="d-flex col-12">
                            <input style="border-radius: 30px; height: 40px;" class="col-4 offset-8" placeholder="Search clubs">
                            <button style="border-radius: 30px; width: 110px;" class="btn-primary mx-2">Search</button>
                        </div>
                    </div>
                </form>
                <div class="row">
                    <div class="col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="./assets/categorises/mon-the-thao-pho-bien-nhat-1024x576 (1) (1).jpg" style=" border-radius:10px" alt="">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="./UserViewClubFollowCategory?category=Recreation">Recreation & Sport</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="./assets/categorises/top-5-reasons-why-you-need-a-social-media-manager-616015983b3ba-sej-760x400 (1).png" alt="" style=" border-radius:10px">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a  href="./UserViewClubFollowCategory?category=Media">Media & Publication</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=" col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="./assets/categorises/Role-of-a-Case-Worker-in-a-Community-Services-scaled (1).jpg" alt="" style=" border-radius:10px">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="./UserViewClubFollowCategory?category=Community">Community & Services</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class=" col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="./assets/categorises/6-Reasons-Why-Having-a-Professional-Coder-Certification-Is-Crucial (1).jpg" alt="" style=" border-radius:10px">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="./UserViewClubFollowCategory?category=Academic">Academic & Education</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="./assets/categorises/student-privacy4 (1).jpg" alt="" style=" border-radius:10px">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="./UserViewClubFollowCategory?category=Student">Student Government & Council</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="single-topic text-center mb-30">
                            <div class="topic-img">
                                <img src="./assets/categorises/images (1).jpg" alt="" class="img-fluid"
                                     style=" border-radius:10px">
                                <div class="topic-content-box">
                                    <div class="topic-content">
                                        <h3><a href="./UserViewClubFollowCategory?category=MultiCutural">MultiCutural & Religious</a></h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<!-- plugins:js -->
<script src="./assets/js/vendor/js/vendor.bundle.base.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="./assets/js/vendor/chart.js/Chart.min.js"></script>
<script src="./assets/js/vendor/datatables.net/jquery.dataTables.js"></script>
<script src="./assets/js/vendor/datatables.net-bs4/dataTables.bootstrap4.js"></script>
<script src="js/dataTables.select.min.js"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="./assets/js/off-canvas.js"></script>
<script src="./assets/js/hoverable-collapse.js"></script>
<script src="./assets/js/template.js"></script>
<script src="./assets/js/settings.js"></script>
<script src="./assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="./assets/js/dashboard.js"></script>
<script src="./assets/js/Chart.roundedBarCharts.js"></script>
</body>

</html>