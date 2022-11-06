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
        <script src="https://js.upload.io/upload-js/v2"></script>

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


                            <div class="col-12 px-5 mt-5">
                                <h3 cla>Your don't have any club!</h3>
                            </div>

                            <div class="col-6 ">                       
                                <div class="m-2 rounded container bg-light" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)">
                                    <div class="card  bg-light">
                                        <div class="cart-header mt-2">
                                            <h3>Create your own club</h3>
                                        </div>


                                        <div class="card-body">
                                            <div class="mt-3">
                                                <form action="./UserCreateClub" method="post" class="col-12 ">
                                                    <div class="form-group col-12 row align-items-center">
                                                        <label class="col-md-4" for="club-name"> <h5>Your Club Name</h5> </label>
                                                        <input  type="text" name="club-name" id="club-name" placeholder="Enter your club's name" value="" class="form-control col-md-8" required="">
                                                    </div>
                                                    <div class="form-group col-12 row align-items-center">
                                                        <label class="col-md-4" for="club-avatar"> <h5>Club's Avatar</h5> </label>
                                                        <h5 id="image-data"></h5>
                                                        <input  type="file" id="club-avatar" name="club-avatar" class="col-md-8" onchange="onFileSelected(event)" required>
                                                        <input name="image-url" id="image-url" style="display: none" required>
                                                    </div>    
                                                    <div class="form-group col-12 row align-items-center">
                                                        <label class="col-md-4" for="club-description"> <h5>Description</h5> </label>
                                                        <input required type="text" placeholder="Enter your club's description" name="club-description" id="club-description" value="" class="form-control col-md-8" required>
                                                    </div>
                                                    <div class="form-group col-12 row align-items-center">
                                                        <label class="col-md-4" for="club-type"> <h5>Club Type</h5> </label>
                                                        <select name="club-type" class="form-select col-md-8">
                                                            <option value="Recreation & Sport">Recreation & Sport</option>
                                                            <option value="Media & Publication">Media & Publication</option>
                                                            <option value="Community & Services">Community & Services</option>
                                                            <option value="Academic & Education">Academic & Education</option>
                                                            <option value="Student Government & Council">Student Government & Council</option>
                                                            <option value="MultiCutural & Religious">MultiCutural & Religious</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group col-12 row justify-content-end  ">
                                                        <div class="" >
                                                            <button type="submit"class="btn btn-primary btn-sm btn-sm">Create</button>
                                                            <button type="reset" class="btn btn-danger btn-sm"> Cancel </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script>
                                // DOM Elements
                                const h1 = document.getElementById("image-data")
                                const uploadButton = document.getElementById("club-avatar")
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