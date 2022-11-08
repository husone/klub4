<%@page import="entity.Club"%>
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
    <script src="https://js.upload.io/upload-js/v2"></script>

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
                                        <h3 class="font-weight-bold">Manage Posts</h3>

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
                                    <a class="btn btn-success text-black" style="font-weight: bold;"
                                        href="./PostServlet">
                                        <i class="ti-plus"></i>
                                        <span class="menu-title">Create New</span>
                                    </a>
                                </div>
                                <c:if test="${empty postList}">
                                    <h3 style="margin: auto">Empty</h3>
                                </c:if>
                                <c:if test="${not empty postList}">
                                <div class="col-md-12 grid-margin stretch-card">
                                    <div class="card">
                                        <div class="card-body">
                                            <p class="card-title mb-0">Top Events</p>
                                            <div class="table-responsive mt-2">
                                                <table class="table table-striped table-borderless">
                                                    <thead>
                                                        <tr>
                                                            <th>Name</th>
                                                            <th>Desciptions</th>
                                                            <th>Date create</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${postList}" var="post">
                                                            <tr>
                                                                <td class="view-detail-post text-primary"
                                                                    style="cursor:pointer;" data-toggle="tooltip"
                                                                    data-placement="top" title="Click to view detail">
                                                                    ${post.title}</td>
                                                                <td style="color: gray;">${post.content}</td>
                                                                <td class="font-weight-medium">${post.time}</td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </c:if>
                            </div>
                        </div>

                        <c:if test="${not empty postList}">
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
                        </c:if>
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
                $('.view-detail-post').click(function () {
                    $('#detail-post-modal').modal('show');
                });

                $('.delete-user-btn').click(function () {
                    confirm('Are you sure to delete this user?');
                    $('#detail-member-modal').modal('hide');
                });

                $('.font-weight-bold').click(function (event) {
                    event.preventDefault();
                    window.location.pathname("./manager-manage-fund-create.html")
                })
                $('#conDelete').click(function () {
                    confirm('Are you sure to delete this post?');
                    $('#detail-post-modal').modal('hide');
                });

                $('.editModalButton').click(function () {
                    $('#edit-modal').modal('show');
                    $('#detail-post-modal').modal('hide');
                });

        });
        </script>
        <script>
                                // DOM Elements
                                const h1 = document.getElementById("image-data")
                                const uploadButton = document.getElementById("imgPost")
                                const imageUrl = document.getElementById("image-url");
                                // 1) Instantiate Upload.js (at start of app).
                                const upload = Upload({apiKey: "free"})

                                // <input type="file" onchange="onFileSelected(event)" />
                                async function onFileSelected(event) {
                                    try {
                                        // 2) Hide upload button when upload starts.
                                        uploadButton.remove()

                                        // 3) Upload file & show progress.
                                        const [file] = event.target.files
                                        const {fileUrl} = await upload.uploadFile(file, {
                                            onProgress: ({ progress }) =>
                                                h1.innerHTML = `File uploading ` + progress + `%`
                                        })

                                        // 4) Display uploaded file URL.
                                        h1.innerHTML = `
                              File uploaded`;
                                        imageUrl.value = fileUrl;

                                    } catch (e) {
                                    }
                                }
        </script>
    </body>

</html>

<c:if test="${not empty postList}">
<c:forEach items="${postList}" var="post">
    <jsp:include page="./jspfragment/post-detail-modal.jsp">
        <jsp:param name="postID" value="${post.postID}" />
        <jsp:param name="title" value="${post.title}" />
        <jsp:param name="content" value="${post.content}" />
        <jsp:param name="dateString" value="${post.getDateCreatedString()}" />
        <jsp:param name="image" value="${post.image}" />
    </jsp:include>
</c:forEach>
</c:if>