<%@page import="entity.Event"%>
<%@page import="java.util.List"%>
<%@page import="DAO.EventDAO"%>
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
            <!-- Modal Create Event -->
            <div class="modal fade">

            </div>
            <!-- partial:partials/_navbar.html -->
            <jsp:include page="./jspfragment/navbar-user.jsp" />
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_settings-panel.html -->
                <jsp:include page="./jspfragment/settings-user.jsp" />
                <!-- partial -->
                <!-- partial:partials/_sidebar.html -->
                <jsp:include page="./jspfragment/sidebar-user.jsp" />
                <!-- partial -->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="row">
                                    <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                        <h3 class="font-weight-bold">Manage Events</h3>
                                        
                                    </div>
                                    <div class="col-12 col-xl-4">
                                        <div class=" d-flex row">
                                            <form action="">
                                                <div class="d-flex">
                                                    <input type="search" class="form-control" name="search-box"
                                                        placeholder="Input to search">
                                                    <Button class="btn btn-info mx-3">Search</Button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="row col-md-12">
                                <div class="col-12 my-3">
                                    <a class="btn btn-success text-black" style="font-weight: bold;" href="./EventServlet">
                                        <i class="ti-plus"></i>
                                        <span class="menu-title">Create New</span>
                                    </a>
                                </div>

                                <div class="col-md-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-title mb-0">Top Events</p>
                                            <div class="table-responsive mt-2">
                                                <table class="table table-striped table-borderless">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Descriptions</th>
                                                            <th>Date Start</th>
                                                            <th>Date End</th>
                                                            <th>Location</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    
                                                    <c:if test="${not empty eventList}"> 
                                                        <c:forEach var="event" items="${eventList}">
                                                            <tr>
                                                                <td class="view-detail-event text-primary"
                                                                    style="cursor:pointer;" data-toggle="tooltip"
                                                                    data-placement="top" title="Click to view detail">
                                                                    ${event.eventName}</td>
                                                                <td style="color: gray;">${event.description}</td>
                                                                <td>${event.dateFrom}</td>
                                                                <td>${event.dateTo}</td>
                                                                <td class="font-weight-medium">${event.location}</td>
                                                            </tr> 
                                                        </c:forEach>   
                                                    </c:if> 
                                                    </tbody>
                                                </table>
                                                <c:if test="${empty eventList}"> 
                                                        <h3 style="margin: auto">Empty</h3>
                                                    </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>


                        </div>

                        <div class="row justify-content-center">
                            <div class="pagination">
                                <a href="#">&laquo;</a>
                                <a href="#" class="active">1</a>
                                <a href="#">2</a>
                                <a href="#">3</a>
                                <a href="#">4</a>
                                <a href="#">5</a>
                                <a href="#">6</a>
                                <a href="#">&raquo;</a>
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
                $('.view-detail-event').click(function () {
                    $('#detail-event-modal').modal('show');
                });

                $('.delete-user-btn').click(function () {
                    confirm('Are you sure to delete this user?');
                    $('#detail-member-modal').modal('hide');
                });

                $('.font-weight-bold').click(function(event){
                    event.preventDefault();
                    window.location.pathname("./manager-manage-fund-create.html")
                })
                $('#conDelete').click(function(){
                    confirm('Are you sure to delete this user?');
                })

            });
        </script>
    </body>

</html>

<c:if test="${not empty eventList}"> 
<c:forEach var="event" items="${eventList}">
<div class="modal fade" id="detail-event-modal" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:600px ;">
            <div class="detail-user container d-flex justify-content-center align-items-center p-0">
                <div class="card text-black">
                    <div class="modal-header border-0 m-0">
                        <h3>Event Details</h3>
                        <button type="button" class="close rounded" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true" class="rounded" style="background-color:red; padding:7px;"><i
                                    class="ti-close text-white"></i></span>
                        </button>

                    </div>

                    <div class="modal-body p-0 pb-3">
                        <table class="table mx-auto" style="width: 80% ;">
                            <tr>
                                <td class="text-info"><h4>Id</h4></td>
                                <td><h4>${event.eventID}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Name</h4></td>
                                <td><h4>${event.eventName}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Description</h4></td>
                                <td><h4>${event.description}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Date Start</h4></td>
                                <td><h4>${event.getDateFromCreatedString()}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Date End</h4></td>
                                <td><h4>${event.getDateToCreatedString()}</h4></td>
                            </tr>
                            <tr>
                                <td class="text-info"><h4>Place</h4></td>
                                <td><h4>${event.location}</h4></td>
                            </tr>
                        </table>

                        <div class="text-center">
                            <button class="btn btn-success">Edit</button>
                            <button id="conDelete"class="btn btn-danger">Delete</button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</c:forEach>
</c:if>