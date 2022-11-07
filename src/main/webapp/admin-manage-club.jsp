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
        <jsp:include page="./jspfragment/navbar-admin.jsp" />
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->
            <!-- partial -->
            <!-- partial:partials/_sidebar.html -->
            <jsp:include page="jspfragment/sidebar-admin.jsp" />
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
                                <div class="col-12 col-xl-4">
                                    <div class=" d-flex row">
                                        <form action="./AdminSearchClub">
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


                    <div class="row">
                        <c:if test="${not empty noContent}"> 
                            <h3 style="margin: auto">${noContent}</h3>
                        </c:if>
                        <c:forEach var="i" items="${content}">
                            <div class="col-md-3 stretch-card grid-margin">
                                <div class="card">
                                    <div class="card-body">
                                        <img src="${i.logo}" style="border-radius: 10px ;" alt="group-01" class="img-fluid">
                                        <div class="text-md-center mt-1">
                                            <h3>${i.clubName}</h3>
                                            <h2></h2>
                                        </div>
                                        <div class="row d-flex justify-content-center">
                                            <div>
                                                <button type="button" class="btn btn-danger btn-sm deleteBtn${i.clubID}" style="height: 40px; width:auto"><i class="ti-trash"></i>Delete</button>
                                                <button type="button" class="btn btn-success btn-sm detailBtn${i.clubID}" style="height: 40px; width:auto"><i class="ti-info"></i>Detail</button>     
                                            </div>                                
                                        </div>           
                                    </div>
                                </div>
                            </div>
                            <script>

                                $('.detailBtn${i.clubID}').click(function () {
                                    $('#detailModal${i.clubID}').modal('show');
                                })
                                $(".deleteBtn${i.clubID}").click(function () {
                                    $('#deleteModal${i.clubID}').modal('show');
                                });
                            </script>
                            <div class="modal fade"  id="detailModal${i.clubID}" tabindex="-1" role="dialog" aria-hidden="true" >
                                <div class="modal-dialog" style="max-width: 50%;" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header border-0">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div style="text-align: center;">
                                                <img src="${i.logo}" alt="group-01" class="img-fluid">
                                            </div>

                                            <div class="col-md-5 mt-3">
                                                <h3>Name: ${i.clubName}</h3>
                                                <p>Description: ${i.description}</p>
                                                <p>Member: ${MemberDAO.getMembersInClub(i.clubID).size()}</p>
                                            </div>
                                            <div class="row" style="margin-left: 0;">
                                                <div class="col-md-5">
                                                    <p>ID: ${i.clubID}</p>
                                                </div>
                                                <div class="col-md-5">
                                                    <p>Date Created: <fmt:formatDate value="${i.dateCreated}" pattern="yyyy-MM-dd" /> </p>
                                                </div>
                                            </div>
                                            <div class="col-md-5">
                                                <button id="returnBtn" type="button" class="btn btn-warning" data-dismiss="modal">Back</button>
                                                <button id="./AdminDeleteClub?clubID=${i.clubID}" type="button" class="btn btn-danger">Delete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="deleteModal${i.clubID}" tabindex="-1" role="dialog" aria-hidden="true">
                                <div class="modal-dialog" style="max-width: 30%;" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4>Xoá câu lạc bộ</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="text-center">
                                                <h3 style="color:red;">Bạn có chắc muốn xoá câu lạc bộ này?</h3>
                                            </div>
                                            <div class="row d-flex justify-content-center mt-4">
                                                <button id="returnBtn" type="button" class="btn btn-warning mr-1"
                                                        data-dismiss="modal">Huỷ</button>
                                                <a href="./AdminDeleteClub?clubID=${i.clubID}" type="button" class="btn btn-danger">Xoá</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </c:forEach>
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