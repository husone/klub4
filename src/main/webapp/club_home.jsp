<%@page import="entity.Fund"%>
<%@page import="java.util.List"%>
<%@page import="DAO.FundDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Courses | Education</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/slicknav.css">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/hamburgers.min.css">
    <link rel="stylesheet" href="assets/css/magnific-popup.css">
    <link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/themify-icons.css">
    <link rel="stylesheet" href="assets/css/slick.css">
    <link rel="stylesheet" href="assets/css/nice-select.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
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

    <style>
        /* .club-joined li:hover{
        background-color: #48b20f !important;
        color: #e9e2e2 !important;
    } */
    </style>
</head>

<body>
    <header>
        <jsp:include page="./jspfragment/navbar-user.jsp" />
    </header>

    <main>


        <section class="blog_area mt-5 " style="background-color: #FFFFFF">
            <div class="pt-2">
                <div class="row">

                    <div class="col-md-3" style="overflow-y :scroll; height:100vh">

                        <nav class="club-joined sidebar pl-3" style="width:100% ;" id="sidebar">

                            <ul class="nav">
                                <div class="col-12">
                                    <h3 class="col-12">Club you's joined</h3>
                                </div>
                                <li class="nav-item py-0 active" style="width:100% ;">
                                    <a class="nav-link py-1" href="" style="width:100%">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="./assets/img/blog/avatar.png"
                                                    style="width:50px ; height:50px;" class="rounded-circle" alt="">
                                            </div>
                                            <div class="col-8 my-auto">
                                                <span class="menu-title">CLB Bong da FUDA</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item py-0 " style="width:100% ;">
                                    <a class="nav-link py-1" href="" style="width:100%">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="./assets/img/blog/avatar.png"
                                                    style="width:50px ; height:50px;" class="rounded-circle" alt="">
                                            </div>
                                            <div class="col-8 my-auto">
                                                <span class="menu-title">CLB Bong da FUDA</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item py-0 " style="width:100% ;">
                                    <a class="nav-link py-1" href="" style="width:100%">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="./assets/img/blog/avatar.png"
                                                    style="width:50px ; height:50px;" class="rounded-circle" alt="">
                                            </div>
                                            <div class="col-8 my-auto">
                                                <span class="menu-title">CLB Bong da FUDA</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>
                                <li class="nav-item py-0 " style="width:100% ;">
                                    <a class="nav-link py-1" href="" style="width:100%">
                                        <div class="row">
                                            <div class="col-4">
                                                <img src="./assets/img/blog/avatar.png"
                                                    style="width:50px ; height:50px;" class="rounded-circle" alt="">
                                            </div>
                                            <div class="col-8 my-auto">
                                                <span class="menu-title">CLB Bong da FUDA</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>

                            </ul>
                        </nav>
                    </div>

                    <div class="col-md-6 mb-5 mb-lg-0 rounded" style="overflow-y :scroll; height:100vh">
                       
                           
                               <div>
                                
                               </div>
                     
                       
                        <div class="blog_left_sidebar bt-3 pt-5 mx-5">
                            <article class="blog_item rounded"
                                style="background-color:white; border: 0.5px solid #e9e2e2">
                                <div class="blog_item_img">
                                    <img class="card-img " src="assets/img/blog/single_blog_1.png" alt=""
                                        style="border-top-left-radius:10px;border-top-right-radius:10px">
                                    <a href="#" class="blog_item_date">
                                        <h3>15</h3>
                                        <p>Jan</p>
                                    </a>
                                </div>
                                <div class="blog_details">
                                    <a class="d-inline-block" href="blog_details.html">
                                        <h2 class="blog-head" style="color: #2d2d2d;">Google inks pact for new 35-storey
                                            office</h2>
                                    </a>
                                    <p style="color: #2d2d2d ;">That dominion stars lights dominion divide years for
                                        fourth have don't stars is that
                                        he earth it first without heaven in place seed it second morning saying.</p>
                                    <ul class="blog-info-link">
                                        <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                    </ul>
                                    <div class="comment-form mx-2 my-0">
                                        <h4 class="mb-0">Leave a comment<Command></Command>ent</h4>
                                        <form class="form-contact comment_form form-group" action="#" id="commentForm">
                                            <input type="text" class="form-control" placeholder="Write your comment">
                                        </form>
                                    </div>

                                    <div class="comments-area mx-2 my-0" style="">
                                        <h4>03 Comments</h4>

                                        <div class="comment-list">
                                            <div class="single-comment justify-content-between d-flex"
                                                style="border-bottom: solid 1px bla ;">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="assets/img/blog/comment_1.png" alt="">
                                                    </div>
                                                    <div class="desc">

                                                        <p class="comment"
                                                            style="line-height: 16px; font-size: smaller;">
                                                            Multiply sea night grass fourth day sea lesser rule open
                                                            subdue

                                                        </p>


                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex align-items-center">
                                                                <h5>
                                                                    <a href="#">Emilly Blunt</a>
                                                                </h5>
                                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                            </div>
                                                            <div class="reply-btn">
                                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="comment-list">
                                            <div class="single-comment justify-content-between d-flex"
                                                style="border-bottom: solid 1px bla ;">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="assets/img/blog/comment_1.png" alt="">
                                                    </div>
                                                    <div class="desc">

                                                        <p class="comment"
                                                            style="line-height: 16px; font-size: smaller;">
                                                            Multiply sea night grass fourth day sea lesser rule open
                                                            subdue
                                                            female fill which them

                                                        </p>


                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex align-items-center">
                                                                <h5>
                                                                    <a href="#">Emilly Blunt</a>
                                                                </h5>
                                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                            </div>
                                                            <div class="reply-btn">
                                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />
                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </article>

                            <article class="blog_item rounded"
                                style="background-color:white; border: 0.5px solid #e9e2e2">
                                <div class="blog_item_img">
                                    <img class="card-img " src="assets/img/blog/single_blog_1.png" alt=""
                                        style="border-top-left-radius:10px;border-top-right-radius:10px">
                                    <a href="#" class="blog_item_date">
                                        <h3>15</h3>
                                        <p>Jan</p>
                                    </a>
                                </div>
                                <div class="blog_details">
                                    <a class="d-inline-block" href="blog_details.html">
                                        <h2 class="blog-head" style="color: #2d2d2d;">Google inks pact for new 35-storey
                                            office</h2>
                                    </a>
                                    <p style="color: #2d2d2d ;">That dominion stars lights dominion divide years for
                                        fourth have don't stars is that
                                        he earth it first without heaven in place seed it second morning saying.</p>
                                    <ul class="blog-info-link">
                                        <li><a href="#"><i class="fa fa-user"></i> Travel, Lifestyle</a></li>
                                        <li><a href="#"><i class="fa fa-comments"></i> 03 Comments</a></li>
                                    </ul>
                                    <div class="comment-form mx-2 my-0">
                                        <h4 class="mb-0">Leave a comment<Command></Command>ent</h4>
                                        <form class="form-contact comment_form form-group" action="#" id="commentForm">
                                            <input type="text" class="form-control" placeholder="Write your comment">
                                        </form>
                                    </div>

                                    <div class="comments-area mx-2 my-0" style="">
                                        <h4>03 Comments</h4>

                                        <div class="comment-list">
                                            <div class="single-comment justify-content-between d-flex"
                                                style="border-bottom: solid 1px bla ;">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="assets/img/blog/comment_1.png" alt="">
                                                    </div>
                                                    <div class="desc">

                                                        <p class="comment"
                                                            style="line-height: 16px; font-size: smaller;">
                                                            Multiply sea night grass fourth day sea lesser rule open
                                                            subdue

                                                        </p>


                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex align-items-center">
                                                                <h5>
                                                                    <a href="#">Emilly Blunt</a>
                                                                </h5>
                                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                            </div>
                                                            <div class="reply-btn">
                                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />
                                            </div>
                                        </div>
                                        <div class="comment-list">
                                            <div class="single-comment justify-content-between d-flex"
                                                style="border-bottom: solid 1px bla ;">
                                                <div class="user justify-content-between d-flex">
                                                    <div class="thumb">
                                                        <img src="assets/img/blog/comment_1.png" alt="">
                                                    </div>
                                                    <div class="desc">

                                                        <p class="comment"
                                                            style="line-height: 16px; font-size: smaller;">
                                                            Multiply sea night grass fourth day sea lesser rule open
                                                            subdue
                                                            female fill which them

                                                        </p>


                                                        <div class="d-flex justify-content-between">
                                                            <div class="d-flex align-items-center">
                                                                <h5>
                                                                    <a href="#">Emilly Blunt</a>
                                                                </h5>
                                                                <p class="date">December 4, 2017 at 3:12 pm </p>
                                                            </div>
                                                            <div class="reply-btn">
                                                                <a href="#" class="btn-reply text-uppercase">reply</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="about-club blog_right_sidebar mt-5">
                            <div class="text-center">
                                <h3>About Club</h3>
                                <hr>
                            </div>

                            <div class="m-2">
                                <div class="card" style="">
                                    <img class="card-img-top" src="https://picsum.photos/1920/1080"
                                        alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title">CLB Bóng đá FUDA</h5>
                                        <p class="card-text">Nơi các thợ săn ống đồng thể hiện kỹ năng săn giò đối thủ
                                        </p>
                                        <div>
                                            <a href="#" class="btn btn-block btn-danger btn-sm"> Leave club </a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Blog Area End -->
    </main>


    <!-- Scroll Up -->
    <div id="back-top">
        <a title="Go to Top" href="#"> <i class="fas fa-level-up-alt"></i></a>
    </div>
    <!-- JS here -->

    <script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
    <!-- Jquery, Popper, Bootstrap -->
    <script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="./assets/js/popper.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="./assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/slick.min.js"></script>
    <!-- One Page, Animated-HeadLin -->
    <script src="./assets/js/wow.min.js"></script>
    <script src="./assets/js/animated.headline.js"></script>
    <script src="./assets/js/jquery.magnific-popup.js"></script>

    <!-- Date Picker -->
    <script src="./assets/js/gijgo.min.js"></script>
    <!-- Nice-select, sticky -->
    <script src="./assets/js/jquery.nice-select.min.js"></script>
    <script src="./assets/js/jquery.sticky.js"></script>

    <!-- counter , waypoint,Hover Direction -->
    <script src="./assets/js/jquery.counterup.min.js"></script>
    <script src="./assets/js/waypoints.min.js"></script>
    <script src="./assets/js/jquery.countdown.min.js"></script>
    <script src="./assets/js/hover-direction-snake.min.js"></script>

    <!-- contact js -->
    <script src="./assets/js/contact.js"></script>
    <script src="./assets/js/jquery.form.js"></script>
    <script src="./assets/js/jquery.validate.min.js"></script>
    <script src="./assets/js/mail-script.js"></script>
    <script src="./assets/js/jquery.ajaxchimp.min.js"></script>

    <!-- Jquery Plugins, main Jquery -->
    <script src="./assets/js/plugins.js"></script>
    <script src="./assets/js/main.js"></script>

</body>

</html>