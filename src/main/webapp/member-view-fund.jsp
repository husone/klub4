<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.FundDAO"%>
<%@page import="DAO.ContributeFundDAO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="entity.Fund"%>
<%@page import="java.util.List"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Klub4 Manager</title>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://unpkg.com/@metamask/legacy-web3@latest/dist/metamask.web3.min.js"></script>

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
            <%
                int clubID = (int) request.getSession().getAttribute("currentClubID");

                List<Fund> fundList = FundDAO.getFundByClubID(clubID);
                if (!fundList.isEmpty())
                    request.setAttribute("fl", fundList);
            %>

            <section class="blog_area mt-5 " style="background-color: #FFFFFF">
                <div class="pt-2">
                    <div class="row">

                        <jsp:include page="./jspfragment/user-joined-club.jsp"/>
                        <div class="col-md-6 mb-5 mb-lg-0 rounded" style="overflow-y :scroll; height:100vh">
                            <c:if test="${fl == null}">
                                <h2>
                                    Don't have any fund contributions.
                                </h2>
                            </c:if>
                            <c:if test="${fl != null}">
                                <c:forEach var="f" items="${fl}" >
                                    <div class="blog_left_sidebar bt-3 pt-5 mx-5">
                                        <div class="col-12 row justify-content-center">
                                            <div class="col-7" style=" border-radius: 10px;box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)"> 
                                                <div class="card">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${f.fundName}</h5>
                                                        <hr>
                                                        <p>Amount of money you have to contribute: <b class="text-danger" >${f.amount}.000 VND</b> </p>
                                                        <div class="text-center mt-5">
                                                            <c:if test="${ContributeFundDAO.isContributeFund(f.fundId,MemberDAO.getMember(userData.userID,currentClubID).memberID)}">
                                                                <button href="" class="btn btn-success" disabled>Contributed</button>
                                                            </c:if>
                                                            <c:if test="${ContributeFundDAO.isContributeFund(f.fundId,MemberDAO.getMember(userData.userID,currentClubID).memberID)==false}">
                                                                <button href="" class="btn btn-primary pay-button${f.fundId}" id="pay-button${f.fundId}"><b class="text-white">Pay with 
                                                                        <span id="amountETH"></span> ETH</b></button>
                                                                <div id="status"></div>
                                                            </c:if>
                                                        </div>


                                                        <script type="text/javascript">
                                                            let test = (${f.amount} / 3600);
                                                            test = test.toFixed(4);
                                                            document.getElementById("amountETH").innerHTML = test;
                                                            console.log(typeof test)
                                                            window.addEventListener('load', async () => {
                                                                if (window.ethereum) {
                                                                    window.web3 = new Web3(ethereum);
                                                                    try {
                                                                        await ethereum.enable();

                                                                    } catch (err) {
                                                                        $('#status').html('User denied account access', err)
                                                                    }
                                                                } else if (window.web3) {
                                                                    window.web3 = new Web3(web3.currentProvider)

                                                                } else {
                                                                    $('#status').html('No Metamask (or other Web3 Provider) installed')
                                                                }
                                                            })

                                                            $('.pay-button${f.fundId}').click(() => {
                                                                // paymentAddress is where funds will be send to
                                                                const paymentAddress = '0x42204448154CBC4E4d9e74aB08fd2A66dbc33999'
                                                                const amountEth = ${f.amount} / 3600;
                                                                console.log(amountEth)
                                                                web3.eth.sendTransaction({
                                                                    to: paymentAddress,
                                                                    value: web3.toWei(amountEth, 'ether')
                                                                }, (err, transactionId) => {
                                                                    if (err) {
                                                                        console.log('Payment failed', err)
                                                                        $('#status').html('Payment failed')
                                                                    } else {
                                                                        console.log('Payment successful', transactionId)
                                                                        $('.pay-button${f.fundId}').html('Payment successful')
                                                                        document.getElementById("pay-button${f.fundId}").setAttribute("disabled", "");
                                                                        $('#status').html('')
                                                                        $.ajax({
                                                                            type: 'POST',
                                                                            url: '/klub4/ContributeFund',
                                                                            data: 'memberID=' +${MemberDAO.getMember(userData.userID,currentClubID).memberID} + '&fundID=' + ${f.fundId},
                                                                            error: function (response) {
                                                                                console.log("response")
                                                                            },
                                                                            success: function (response) {
                                                                                console.log("call")
                                                                            }
                                                                        })
                                                                    }
                                                                })
                                                            })

                                                        </script>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                        <jsp:include page="./jspfragment/user-club-detail.jsp"/>
                    </div>
                </div>
            </section>
            <!-- Blog Area End -->
        </main>


        <!-- Scroll Up -->

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

