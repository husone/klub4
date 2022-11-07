<%-- 
    Document   : user-view-club
    Created on : Nov 7, 2022, 10:40:30 AM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="entity.Club"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <header>
            <jsp:include page="./jspfragment/navbar-user.jsp" />
        </header>
        <div class="container">
           
            <div class="mt-5">
              

                <div class="pt-5">
                    <div class="">
                        <div class="row">
                            <div class="col-md-12 grid-margin">
                                <div class="row">
                                    <div class="col-12 col-xl-8 mb-4 mb-xl-0">

                                    </div>
                                    <div class="col-12 col-xl-4">
                                        <div class=" d-flex row">
                                            <form action="./UserSearchClub">
                                                <div class="d-flex">
                                                    <input type="search" class="form-control" name="searchData"
                                                           placeholder="Input to search">
                                                    <input type="hidden" name="category" value="${category}">
                                                    <Button class="btn btn-info mx-3">Search</Button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <c:if test="${not empty noContent}">
                                <div class="col-12 justify-content-center">
                                    <h3>${noContent}</h3>
                                </div>

                            </c:if>

                            <c:if test="${not empty sessionScope.listClub}">
                                <c:forEach var="club" items="${sessionScope.listClub}">
                                    <div class="col-md-3 stretch-card grid-margin">
                                        <div class="card" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)">
                                            <div class="card-body">
                                                <img src="${club.logo}" style="border-radius:10px" alt="group-01" class="img-fluid">
                                                <div class="text-md-center mt-1">
                                                    <h4>${club.getClubName()}</h4>
                                                </div>
                                                <div class="row d-flex justify-content-center">
                                                    <div>
                                                        <button type="button" class="btn btn-dark btn-sm detailBtn${club.getClubID()}"
                                                                style="height: 40px; width:auto"><i
                                                                class="ti-info join-btn"></i>Detail</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>


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
        <script src="script.js"></script>

    </body>

</html>

<c:forEach var="club" items="${sessionScope.listClub}">
    <script>
    $(document).ready(function () {
        $('.detailBtn${club.getClubID()}').click(function () {
            $('#detailModal${club.getClubID()}').modal('show');
        });
    });
</script>
<div class="modal fade" id="detailModal${club.getClubID()}" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" style="max-width: 50%;" role="document">
        <div class="modal-content">
            <div class="modal-header border-0">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div style="text-align: center;" >
                    <img src="https://picsum.photos/600/400" alt="group-01" class="img-fluid" style="border-radius:10px" >
                </div>

                <div class="col-12 mt-3">
                    <h3>${club.getClubName()}</h3>
                    <p>${club.getDescription()}</p>
                    <div class="col-md-5">
                        <p>Members: ${MemberDAO.getMembersInClub(club.clubID).size()}</p>
                    </div>
                    <div class="col-md-6">
                        <p>Day founded: ${club.getdateCreated()}</p>
                    </div>

                </div>
                <div class="col-md-5">
                    <button id="returnBtn" type="button" class="btn btn-warning"
                            data-dismiss="modal">Quay lại</button>
                    <a id="joinBtn" href="./UserJoinClub?clubId=${club.getClubID()}" type="button" class="btn btn-success">Join</a>
                </div>
            </div>
        </div>
    </div>
</div>
</c:forEach>

<!-- Delete Club Confirm Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true">
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
                    <h3 style="color:red;">Bạn có chắc muốn xoá câu lạc bộ này ?</h3>
                </div>
                <div class="row d-flex justify-content-center mt-4">
                    <button id="returnBtn" type="button" class="btn btn-warning mr-1"
                            data-dismiss="modal">Huỷ</button>
                    <button id="deleteBtn" type="button" class="btn btn-danger">Xoá</button>
                </div>
            </div>
        </div>
    </div>
</div>
