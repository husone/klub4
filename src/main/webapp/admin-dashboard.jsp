<%@page import="entity.Club"%>
<%@page import="java.util.List"%>
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
    </head>

    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
                    <a class="navbar-brand brand-logo mr-5" href=""><img src="./assets/img/logo/loder.png" class="mr-2"
                                                                         alt="logo" /></a>
                    <a class="navbar-brand brand-logo-mini" href=""><img src="./assets/img/logo/loder.png" alt="logo" /></a>
                </div>
                <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                    <ul class="navbar-nav navbar-nav-right">
                        <li class="nav-item dropdown">
                            <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#"
                               data-toggle="dropdown">
                                <i class="icon-bell mx-0"></i>
                                <span class="count"></span>
                            </a>
                        </li>
                        <li class="nav-item nav-profile dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" id="profileDropdown">
                                <img src="./assets/img/blog/avatar.png" alt="profile" />
                            </a>
                            <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="profileDropdown">
                                <a class="dropdown-item">
                                    <i class="ti-settings text-primary"></i>
                                    Settings
                                </a>
                                <a href="./LogoutServlet" class="dropdown-item">
                                    <i class="ti-power-off text-primary"></i>
                                    Logout
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_settings-panel.html -->
                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav" style="position: fixed ;">
                        <li class="nav-item active">
                            <a class="nav-link" href="./AdminDashboard">
                                <i class="ti-layout-grid2 menu-icon active"></i>
                                <span class="menu-title">Dashboard</span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="./AdminManageUser">
                                <i class="icon-head  menu-icon"></i>
                                <span class="menu-title">Manage User</span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="./AdminManageClub">
                                <i class="icon-grid menu-icon"></i>
                                <span class="menu-title">Manage Club</span>
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a class="nav-link" href="./AdminManagePost">
                                <i class="ti-layout-cta-left icon-lg menu-icon"></i>
                                <span class="menu-title">Manage Post</span>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="row">
                                    <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                        <h3 class="font-weight-bold">Welcome Admin</h3>
                                    </div>
                                </div>
                            </div>
                        </div>




                        <div class="row">
                            <div class="col-md-6 stretch-card grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title mb-0 ">New Clubs</p>
                                        <div class="table-responsive">
                                            <table class="table table-borderless">
                                                <thead>
                                                    <tr>
                                                        <th class="pl-0  pb-2 border-bottom">Name</th>
                                                        <th class="border-bottom pb-2">Type</th>
                                                        <th class="border-bottom pb-2">Date Created</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="i" items="${clubList}">
                                                        <tr>
                                                            <td class="pl-0">${i.clubName}</td>
                                                            <td>
                                                                <p class="mb-0"><span class="font-weight-bold mr-2">${i.clubType}</span></p>
                                                            </td>
                                                            <td class="text-muted">${i.dateCreated}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 stretch-card grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title mb-0">New Users</p>
                                        <div class="table-responsive">
                                            <table class="table table-borderless">
                                                <thead>
                                                    <tr>
                                                        <th class="pl-0  pb-2 border-bottom">ID</th>
                                                        <th class="border-bottom pb-2">Name</th>
                                                        <th class="border-bottom pb-2">Email</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="i" items="${userList}">
                                                        <tr>
                                                            <td class="pl-0">${i.userID}</td>
                                                            <td>
                                                                <p class="mb-0"><span class="font-weight-bold mr-2">${i.name}</p>
                                                            </td>
                                                            <td class="text-muted">${i.email}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

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
        <!-- End custom js for this page-->
    </body>

</html>