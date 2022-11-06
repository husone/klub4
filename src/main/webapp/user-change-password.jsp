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
                    <jsp:include page="./jspfragment/user-joined-club.jsp" /> 
                    <div class="col-md-9 row mb-5 mb-lg-0 justify-content-center" height:100vh">
                        <div class="col-6 mt-5 ">                               
                            <div class="m-2 rounded container bg-light" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)">
                                <div class="card mt-2 bg-light">
                                    <div class="cart-header mt-2">
                                        <h3>Change Password</h3>
                                    </div>

                                    <div class="position-relative mt-2">
                                        <img class="card-img-top" height="150px" width="400px"
                                            src="https://picsum.photos/400/150" alt="Card image cap"
                                            style="border-top-left-radius:10px; border-top-right-radius: 10px ;">
                                        
                                            <div class="position-absolute" style="top:90px; left: 50px;">
                                                <img height="80px" width="80px" src="${userData.avatar}" alt="" class="img-fluid rounded-circle">
                                            </div>

                                    </div>
                                    <div class="card-body mt-2">
                                        <h3>${userData.name}</h3>
                                        <form action="./UserChangePassword" method="post" class="col-12 row mt-5">
                                            <div class="form-group col-12 row align-it  ems-center">
                                                <label class="col-md-4" for="user-oldPass"> <h5>Old Password</h5> </label>
                                                <input type="password" name="user-oldPass" id="user-oldPass" placeholder="Enter your old password" class="form-control col-md-8">
                                            </div>

                                            <div class="form-group col-12 row align-items-center">
                                                <label class="col-md-4" for="user-oldPass"> <h5>New Password</h5> </label>
                                                <input type="password" placeholder="Enter your new password" name="user-newPass" id="user-newPass" class="form-control col-md-8" >
                                            </div>

                                            <div class="form-group col-12 row align-items-center">
                                                <label class="col-md-4" for="user-oldPass"> <h5>Confirm Password</h5> </label>
                                                <input type="password" placeholder="Enter your old password again" name="user-newPassCon" id="user-newPassCon" class="form-control col-md-8" onchange="validatePW()">
                                            </div>
                                            <h5 style="color:red" id="errorHere"></h5>
                                            <script>
                                                const pw1 = document.getElementById("user-newPass");
                                                const pw2 = document.getElementById("user-newPassCon");
                                                const e = document.getElementById("errorHere");
                                                async function validatePW() {
                                                    if (pw1.value === pw2.value){
                                                        e.innerHTML = "";                                                              
                                                    }
                                                    else e.innerHTML = "Password does not match";
                                                    console.log(pw1.value,pw2.value)
                                                }
                                            </script>
                                            <c:if test="${error!= null}">
                                                <h5 style="color:red">${error}</h5>
                                            </c:if>
                                                <c:if test="${success!= null}">
                                                <h5 style="color:green">${success}</h5>
                                            </c:if>
                                            <div class="form-group col-12 row justify-content-end  ">
                                              <div class="" >
                                                <button type="submit"class="btn btn-primary btn-sm btn-sm">Change password</button>
                                                <button  class="btn btn-danger btn-sm"> <a href="">Cancel</a> </button>
                                              </div>
                                            </div>
                                            
                                            
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- content-wrapper ends -->
                        <!-- partial:partials/_footer.html -->

                        <!-- partial -->
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