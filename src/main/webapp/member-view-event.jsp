<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
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

        <style>
            /* .club-joined li:hover{
            background-color: #48b20f !important;
            color: #e9e2e2 !important;
        } */
        </style>
    </head>

    <body>
        <header>
            <jsp:include page="./jspfragment/navbar-user.jsp" />
        </header>

        <main>


            <section class="blog_area mt-5 " style="background-color: #FFFFFF">
                <div class="pt-2">
                    <div class="row">

                        <jsp:include page="./jspfragment/user-joined-club.jsp"/>

                        <div class="col-md-6 mb-5 mb-lg-0 rounded" style="overflow-y :scroll; height:100vh">


                            <div>

                            </div>


                            <div class="blog_left_sidebar bt-3 pt-5 mx-5">
                                <div class="col-12 row  justify-content-center">
                                    <div id='calendar' class="col-12 border" style='border-radius: 5%'></div>
                                    <style>
                                        html,
                                        body {
                                            margin: 0;
                                            padding: 0;
                                            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
                                            font-size: 14px;
                                        }

                                        #calendar {
                                            max-width: 1100px;
                                            margin: 40px auto;
                                        }

                                        .popper,
                                        .tooltip {
                                            position: absolute;
                                            z-index: 9999;
                                            background: #FFC107;
                                            color: black;
                                            width: 150px;
                                            border-radius: 3px;
                                            box-shadow: 0 0 2px rgba(0, 0, 0, 0.5);
                                            padding: 10px;
                                            text-align: center;
                                        }

                                        .style5 .tooltip {
                                            background: #1E252B;
                                            color: #FFFFFF;
                                            max-width: 200px;
                                            width: auto;
                                            font-size: .8rem;
                                            padding: .5em 1em;
                                        }

                                        .popper .popper__arrow,
                                        .tooltip .tooltip-arrow {
                                            width: 0;
                                            height: 0;
                                            border-style: solid;
                                            position: absolute;
                                            margin: 5px;
                                        }

                                        .tooltip .tooltip-arrow,
                                        .popper .popper__arrow {
                                            border-color: #FFC107;
                                        }

                                        .style5 .tooltip .tooltip-arrow {
                                            border-color: #1E252B;
                                        }

                                        .popper[x-placement^="top"],
                                        .tooltip[x-placement^="top"] {
                                            margin-bottom: 5px;
                                        }

                                        .popper[x-placement^="top"] .popper__arrow,
                                        .tooltip[x-placement^="top"] .tooltip-arrow {
                                            border-width: 5px 5px 0 5px;
                                            border-left-color: transparent;
                                            border-right-color: transparent;
                                            border-bottom-color: transparent;
                                            bottom: -5px;
                                            left: calc(50% - 5px);
                                            margin-top: 0;
                                            margin-bottom: 0;
                                        }

                                        .popper[x-placement^="bottom"],
                                        .tooltip[x-placement^="bottom"] {
                                            margin-top: 5px;
                                        }

                                        .tooltip[x-placement^="bottom"] .tooltip-arrow,
                                        .popper[x-placement^="bottom"] .popper__arrow {
                                            border-width: 0 5px 5px 5px;
                                            border-left-color: transparent;
                                            border-right-color: transparent;
                                            border-top-color: transparent;
                                            top: -5px;
                                            left: calc(50% - 5px);
                                            margin-top: 0;
                                            margin-bottom: 0;
                                        }

                                        .tooltip[x-placement^="right"],
                                        .popper[x-placement^="right"] {
                                            margin-left: 5px;
                                        }

                                        .popper[x-placement^="right"] .popper__arrow,
                                        .tooltip[x-placement^="right"] .tooltip-arrow {
                                            border-width: 5px 5px 5px 0;
                                            border-left-color: transparent;
                                            border-top-color: transparent;
                                            border-bottom-color: transparent;
                                            left: -5px;
                                            top: calc(50% - 5px);
                                            margin-left: 0;
                                            margin-right: 0;
                                        }

                                        .popper[x-placement^="left"],
                                        .tooltip[x-placement^="left"] {
                                            margin-right: 5px;
                                        }

                                        .popper[x-placement^="left"] .popper__arrow,
                                        .tooltip[x-placement^="left"] .tooltip-arrow {
                                            border-width: 5px 0 5px 5px;
                                            border-top-color: transparent;
                                            border-right-color: transparent;
                                            border-bottom-color: transparent;
                                            right: -5px;
                                            top: calc(50% - 5px);
                                            margin-left: 0;
                                            margin-right: 0;
                                        }
                                    </style>
                                    <script>
//                                        var eventName = document.getElementById("eventName");
//                                        var eventDescription = document.getElementById("eventDescription");
//                                        var dateFrom = document.getElementById("dateFrom");
//                                        var dateTo = document.getElementById("dateTo");
//                                        var address = document.getElementById("eventAddress");
           
                                        document.addEventListener('DOMContentLoaded', function () {
                                            var calendarEl = document.getElementById('calendar');

                                            var calendar = new FullCalendar.Calendar(calendarEl, {
                                                initialView: 'dayGridMonth',
                                                initialDate: new Date(),

                                                eventClick: function (info) {
//                                                    alert(info.event.title)
                                                    document.getElementById("eventName").innerHTML = info.event.title;
//                                                    console.log(document.getElementById("eventName").innerHTML)
                                                    document.getElementById("eventDescription").innerHTML = info.event.extendedProps.description;
                                                    document.getElementById("dateFrom").innerHTML = info.event.start.toLocaleString();
                                                    document.getElementById("dateTo").innerHTML = info.event.end.toLocaleString();
                                                    document.getElementById("eventAddress").innerHTML = info.event.extendedProps.address;
                                                    modal.style.display = "block";
                                                    
                                                },

                                                events: [
                                                    {
                                                        title: 'All Day Event',
                                                        description: 'description for All Day Event',
                                                        start: '2022-08-01',
                                                        end: '2022-08-05',
                                                        address: 'danang'
                                                    },
                                                    {
                                                        title: 'Long Event',
                                                        description: 'description for Long Event',
                                                        start: '2022-08-07',
                                                        end: '2022-08-10'
                                                    },
                                                    {
                                                        groupId: '999',
                                                        title: 'Repeating Event',
                                                        description: 'description for Repeating Event',
                                                        start: '2022-08-09T16:00:00'
                                                    },
                                                    {
                                                        groupId: '999',
                                                        title: 'Repeating Event',
                                                        description: 'description for Repeating Event',
                                                        start: '2022-08-16T16:00:00'
                                                    },
                                                    {
                                                        title: 'Conference',
                                                        description: 'description for Conference',
                                                        start: '2022-08-11',
                                                        end: '2022-08-13'
                                                    },
                                                    {
                                                        title: 'Meeting',
                                                        description: 'description for Meeting',
                                                        start: '2022-08-12T10:30:00',
                                                        end: '2022-08-12T12:30:00'
                                                    },
                                                    {
                                                        title: 'Lunch',
                                                        description: 'description for Lunch',
                                                        start: '2022-08-12T12:00:00'
                                                    },
                                                    {
                                                        title: 'Meeting',
                                                        description: 'description for Meeting',
                                                        start: '2022-08-12T14:30:00'
                                                    },
                                                    {
                                                        title: 'Birthday Party',
                                                        description: 'description for Birthday Party',
                                                        start: '2022-08-13T07:00:00'
                                                    },
                                                    {
                                                        title: 'Click for Google',
                                                        description: 'description for Click for Google',
                                                        url: 'http://google.com/',
                                                        start: '2022-08-28'
                                                    },
                                                ]
                                            });

                                            calendar.render();
                                        });
                                    </script>
                                    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
                                    <script src="https://unpkg.com/popper.js/dist/umd/popper.min.js"></script>
                                    <!--<script src="https://unpkg.com/tooltip.js/dist/umd/tooltip.min.js"></script>-->
                                    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="about-club blog_right_sidebar mt-5">
                                <div class="text-center">
                                    <h3>About Club</h3>
                                    <hr>
                                </div>

                                <div class="m-2">
                                    <div class="card" style="">
                                        <img class="card-img-top" src="https://picsum.photos/1920/1080"
                                             alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title">CLB Bóng đá FUDA</h5>
                                            <div>
                                                <p class="card-text">Nơi các thợ săn ống đồng thể hiện kỹ năng săn giò đối
                                                    thủ
                                                </p>
                                            </div>

                                            <div class=" my-5">
                                                <a href="#" class="btn btn-block btn-danger btn-sm"
                                                   style="text-decoration:none ;"> Leave club </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
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
<button id="myBtn" style="">Open Modal</button>
<!-- The Modal -->

<!-- Modal content -->
<div class="modal" aria-hidden="true" tabindex="-1" role="dialog" id="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary">
                <h2 class="modal-title" id="eventName"></h3>
                <button type="button" class="close" id="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body"><div class="row">
                    <h4 class="col-sm-4">Desciption</h4>
                    <h4 style="color:black; font-weight: bold;" id="eventDescription"></h4>
                </div>
                <div class="row">
                    <h3 class="col-sm-4">Date from</h3>
                    <h3 style="color:black; font-weight: bold;" id="dateFrom"></h3>
                </div>
                <div class="row">
                    <h3 class="col-sm-4">Date to</h3>
                    <h3 style="color:black; font-weight: bold;" id="dateTo"></h3>
                </div>
                <div class="row">
                    <h3 class="col-sm-4">Address</h3>
                    <h3 style="color:black; font-weight: bold;" id="eventAddress"></h3>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
                                        // Get the modal
                                        var modal = document.getElementById("myModal");

                                        // Get the button that opens the modal
                                        var btn = document.getElementById("myBtn");

                                        // Get the <span> element that closes the modal
                                        var span = document.getElementById("close");

                                        // When the user clicks the button, open the modal 
                                        btn.onclick = function () {
                                            modal.style.display = "block";
                                        }

                                        // When the user clicks on <span> (x), close the modal
                                        span.onclick = function () {
                                            modal.style.display = "none";
                                        }

                                        // When the user clicks anywhere outside of the modal, close it

    </script>

</body>
</html>

