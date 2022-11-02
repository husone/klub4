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
        <jsp:include page="./jspfragment/navbar-admin.jspf" />
        <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:partials/_settings-panel.html -->
            <!-- partial -->
            <!-- partial:partials/_sidebar.html -->
            <jsp:include page="jspfragment/sidebar-admin.jspf" />
            <!-- partial -->
            <div class="main-panel">
                <div class="content-wrapper">
                    <div class="row">
                        <div class="col-md-12 grid-margin">
                            <div class="row">
                                <div class="col-12 col-xl-8 mb-4 mb-xl-0">
                                    <h3 class="font-weight-bold">Manage Users</h3>
                                    <h6 class="font-weight-normal mb-0"><span class="text-primary">3 unread
                                            alerts!</span></h6>
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
                                                    <th>Day join</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="view-detail-user font-weight-bold text-primary"
                                                        data-toggle="tooltip" data-placement="left"
                                                        title="Click to view detail" style="cursor:pointer;">Hoang
                                                        Nghia</td>
                                                    <td class="font-weight-bold">nghia@gmail.com</td>
                                                    <td>21-02-2022</td>
                                                </tr>



                                            </tbody>
                                        </table>
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
            $('.view-detail-user').click(function () {
                $('#detail-member-modal').modal('show');
            });
            $('.delete-user-btn').click(function () {

                if (confirm("Are you sure to delete this user?") == true) {
                    $('#detail-member-modal').modal('hide');
                }
            });


        });
    </script>


</body>

</html>

<div class="modal fade" id="detail-member-modal" tabindex="-1" role="dialog" aria-hidden="true">
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
                                <img src="./assets/img/blog/avatar.png" class="rounded-circle" width="80">

                            </div>

                            <div class="user-infor container ">
                                <h4 class="ml-3">NghiaDz</h4>
                                <span class="text-muted d-block mb-2">nghia@gmail.com</span>

                                <div class="d-flex justify-content-center align-items-center my-4 px-4">
                                    <table class="row text-left">
                                        <tr class="my-2">
                                            <td class="pr-3">ID: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">101</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Full Name: </td>
                                            <td class="text-muted">Nguyen Dac Hoang Nghia</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Day of birth: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">24/02/2002</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Adress: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">Quang Nam</td>
                                        </tr>
                                        <tr>
                                            <td class="pr-3">Full Name: &nbsp; &nbsp; &nbsp;</td>
                                            <td class="text-muted">Nguyen Dac Hoang Nghia</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class=" text-center">
                                    <button class="delete-user-btn btn btn-danger "><i class="ti-trash"></i> Delete
                                        User</button>
                                </div>


                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>