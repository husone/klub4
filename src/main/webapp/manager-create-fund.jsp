<%@page import="entity.Fund"%>
<%@page import="java.util.List"%>
<%@page import="DAO.ClubDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Klub4 Manager</title>
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
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="./jspfragment/navbar-user.jspf" />
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_settings-panel.html -->
                <jsp:include page="./jspfragment/settings-user.jspf" />
                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <jsp:include page="./jspfragment/sidebar-user.jspf" />
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="row">
                                    <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                        <h3 class="font-weight-bold">Manage Funds</h3>
                                      
                                    </div>
                                 
                                </div>
                            </div>
                        </div>


                        <div class="row justify-content-center" >
                            <div class="row col-md-5">
                               

                                <div class="col-md-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-header bg-dark">
                                            <p class="card-title mb-3 bg-dark text-white">Create New Fund</p>
                                        </div>
                                        <div class="card-body">
                                            
                                            <form action="./ManageFund" method="post">
                                                <div class="form-group">
                                                    <label class="col-12 p-0 font-weight-bold" for="new-fund-name"><h4>Name</h4></label>
                                                    <input type="text" class="form-control form-control-sm col-12;" name="fundName" id="new-fund-name">
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-12 p-0 font-weight-bold" for="new-fund-amount"><h4>Amount/Person</h4></label>
                                                    <input type="text" class="form-control form-control-sm col-12;" name="amount" id="new-fund-amount">
                                                </div>
                                                <input type="hidden"  name="typeOfRequest" value="createFund" />
                                                <div class="justify-content-between">
                                                    <button type="submit" class="btn btn-info">Create</button>
                                                    <a href="./ManageFund"  style="float:right;" class="btn btn-danger">Cancel</a>
                                                </div>
                                            </form>
                                           
                                        </div>
                                    </div>
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
        <script>
            $(document).ready(function () {
                $('.view-detail-fund').click(function () {
                    $('#detail-fund-modal').modal('show');
                });

                $('.delete-user-btn').click(function () {
                    confirm('Are you sure to delete this user?');
                    $('#detail-member-modal').modal('hide');
                });


            });
        </script>
    </body>

</html>

<%-- <c:forEach items="${fundList}" var="fund">
    <jsp:include page="./jspfragment/fund-detail-modal.jsp">
        <jsp:param name="fund" value="${fund}" />
    </jsp:include>
</c:forEach> --%>
