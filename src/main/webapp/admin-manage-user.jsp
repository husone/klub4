<%@page import="DAO.ClubDAO"%>
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
        <jsp:include page="./jspfragment/navbar-admin.jsp" />
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->
            <!-- partial -->
            <!-- partial:partials/_sidebar.html -->
            <jsp:include page="jspfragment/sidebar-admin.jsp" />
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="row">
                                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                    <h3 class="font-weight-bold">Manage Users</h3>
                                </div>
                                <div class="col-12 col-xl-4">
                                    <div class=" d-flex row">
                                        <form action="./UserSearchClub">
                                            <div class="d-flex">

                                                <input  type="search" class="form-control" name="searchData"
                                                        placeholder="Input to search">
                                                <Button  class="btn btn-info mx-3">Search</Button>
                                           </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:if test="${not empty noContent}"> 
                        <h3 style="margin: auto">${noContent}</h3>
                    </c:if>
                    <c:if test="${empty noContent}">    
                        <div class="row">
                            <div class="col-md grid-margin stretch-card">
                                <div class="card">
                                    <div class="card-body">
                                        <p class="card-title mb-4">List User</p>
                                        <div class="table-responsive">
                                            <table class="table table-striped table-borderless">
                                                <thead
                                                    style="background-color:#4B49AC; border-radius:50px; color: aliceblue;">
                                                    <tr>
                                                        <th>Name</th>
                                                        <th>Email</th>
                                                        <th>Address</th>               
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="i" items="${content}">
                                                        <tr>
                                                            <td class="view-detail-user${i.userID} font-weight-bold text-primary"
                                                                data-toggle="tooltip" data-placement="left"
                                                                title="Click to view detail" style="cursor:pointer;">${i.name}</td>
                                                            <td class="font-weight-bold">${i.email}</td>
                                                            <td>${i.address}</td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    <script src="./assets/js/vendor/js/vendor.bundle.base.js"></script>
    <script src="./assets/js/vendor/chart.js/Chart.min.js"></script>
    <script src="./assets/js/vendor/datatables.net/jquery.dataTables.js"></script>
    <script src="./assets/js/vendor/datatables.net-bs4/dataTables.bootstrap4.js"></script>
    <script src="js/dataTables.select.min.js"></script>

    <script src="./assets/js/off-canvas.js"></script>
    <script src="./assets/js/hoverable-collapse.js"></script>
    <script src="./assets/js/template.js"></script>
    <script src="./assets/js/settings.js"></script>
    <script src="./assets/js/todolist.js"></script>
    <script src="./assets/js/dashboard.js"></script>
    <script src="./assets/js/Chart.roundedBarCharts.js"></script>
</body>

</html>
<c:forEach var="i" items="${content}">
    <script>
        $(document).ready(function () {
            $('.view-detail-user${i.userID}').click(function () {
                $('#detail-member-modal${i.userID}').modal('show');
            });

        });
    </script>
    <div class="modal fade" id="detail-member-modal${i.userID}" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="detail-user container d-flex justify-content-center align-items-center p-0"
                     style="border-radius:10px;">
                    <div class="card text-black">
                        <div class="modal-header border-0 m-0">
                            <button type="button" class="close rounded" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true" class="rounded" style="background-color:red; padding:7px;"><i
                                        class="ti-close text-white"></i></span>
                            </button>
                        </div>

                        <div class="modal-body p-0 pb-3">
                            <div>
                                <div class="upper pt-4">
                                    <img src="https://picsum.photos/400/150" class="img-fluid">
                                </div>
                                <div class="user ">
                                    <img src="${i.avatar}" class="rounded-circle" width="80">

                                </div>

                                <div class="user-infor container ">
                                    <span class="text-muted d-block mb-2">${i.email}</span>

                                    <div class="d-flex justify-content-center align-items-center my-4 px-4">
                                        <table class="row text-left">
                                            <tr class="my-2">
                                                <td class="pr-3">ID: &nbsp; &nbsp; &nbsp;</td>
                                                <td class="text-muted">${i.userID}</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-3">Full Name: </td>
                                                <td class="text-muted">${i.name}</td>
                                            </tr>
                                            <tr>
                                                <td class="pr-3">Day of birth: &nbsp; &nbsp; &nbsp;</td>
                                                <td class="text-muted"><fmt:formatDate value="${i.dOB}" pattern="yyyy-MM-dd" /> </td>
                                            </tr>
                                            <tr>
                                                <td class="pr-3">Address: &nbsp; &nbsp; &nbsp;</td>
                                                <td class="text-muted">${i.address}</td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class=" text-center">
                                        <a href="./AdminDeleteUser?userID=${i.userID}" class="delete-user-btn btn btn-danger "><i class="ti-trash"></i> Delete
                                            User</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>