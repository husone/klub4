<%@page import="DAO.ClubDAO"%>
<%@page import="DAO.MemberDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Klub4 Admin</title>
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
        <script src="script.js"></script>
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
            /* .modal {
                text-align: center;
                padding: 0!important;
            }
            .modal:before {
                content: '';
                display: inline-block;
                height: 100%;
                vertical-align: middle;
                    margin-right: -4px;
            }
            .modal-dialog {
                display: inline-block;
                text-align: left;
                vertical-align: middle;
            } */
        </style>




    </head>

    <body>
    </head>

<body>
    <div class="container-scroller">
        <!-- partial:partials/_navbar.html -->
        <jsp:include page="./jspfragment/navbar-admin.jspf" />
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->
            <!-- partial -->
            <!-- partial:partials/_sidebar.html -->
            <jsp:include page="jspfragment/sidebar-admin.jspf" />
            <!-- partial -->        
            <!-- Delete Club Confirm Modal -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="row">
                                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                    <h3 class="font-weight-bold">Manage Clubs</h3>
                                </div>
                              
                            </div>
                        </div>
                    </div>


                    <div class="row">

                        <div class=" col-md-12 row justify-content-center">
                            <div class="card col-6 m-2" style="box-shadow: rgba(50, 50, 93, 0.25) 0px 13px 27px -5px, rgba(0, 0, 0, 0.3) 0px 8px 16px -8px;">
                                <div class="card-title m-3">
                                    <h4 style="color:red;">Change Admin Password</h4>
                                    <hr class="m-0">
                                </div>
                                <div class="card-body">
                                    <form action="#" class="">
                                        <div class="form-group row align-items-center">
                                            <label for="old-password" class="col-md-3 mt-2"> <b>Old password</b> </label>
                                            <input type="text" class="col-md-9 form-control" name="old-pasword" placeholder="Enter your old password">
                                        </div>
                                        <div class="form-group row align-items-center">
                                            <label for="new-password" class="col-md-3 mt-2"> <b>New password</b> </label>
                                            <input type="text" class="col-md-9 form-control" name="new-pasword" placeholder="Enter your new password">
                                        </div>
                                          <div class="form-group row align-items-center">
                                            <label for="confirm-password" class="col-md-3 mt-2"> <b>Confirm password</b> </label>
                                            <input type="text" class="col-md-9 form-control" name="confirm-pasword" placeholder="Retype your new password">
                                        </div>
                                         <div class="form-group row ">
                                             <div class="col-md-9 offset-md-3 justify-content-around p-0">
                                                 <input type="submit" class="btn btn-danger" name="btn-change-pasword" value="Change password"  >
                                                 <button class="btn btn-warning" type="reset">Reset</button>
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
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->

        <!-- plugins:js -->

</body>

</html>