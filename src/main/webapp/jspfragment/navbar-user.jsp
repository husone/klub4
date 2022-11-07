<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="DAO.ClubDAO"%>
<nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row row">
    <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center col-md-3">
        <a href="./club_home.jsp" class="navbar-brand brand-logo mr-5" href=""><img src="./assets/img/logo/loder.png" class="mr-2"
            alt="logo" /></a>
    </div>
    <div class="navbar-menu-wrapper d-flex align-items-center col-md-9 row">
        <div class="col-md-7 d-flex justify-content-center col-12 fixed-botton">
            <nav>
                <ul class="navbar-nav mr-lg-2">
                    <li class="nav-item nav-search">
                        <span><a href="./club_home.jsp"><i style="font-size:35px ;" class="fa fa-home"></i></a>
                    </li>
                    <li class="nav-item nav-search">
                        <span><a href="./user-view-category.jsp"><i style="font-size:35px;;" class="fa fa-solid fa-globe "></i></a></span>
                    </li>  
                    <li class="nav-item nav-search">
                        <span ><a href="./member-view-fund.jsp"><i style="font-size:35px;;" class="fa fa-money-bill-alt "></i></a></span>
                   </li>  
                    <li class="nav-item nav-search">
                        <span><a href="./member-view-event.jsp "><i style="font-size:35px;;" class="fa fa-calendar-alt "></i></a></span>
                   </li> 
                </ul>
            </nav>
        </div>
        <div class="col-md-4 ">
            <div class="d-flex justify-content-end">
                <ul class="navbar-nav navbar-nav-right">                    
                    <li class="nav-item nav-profile dropdown">
                        <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown"
                            id="profileDropdown">
                            <img src="${userData.avatar}" alt="profile" />
                        </a>
                        <div class="dropdown-menu dropdown-menu-right navbar-dropdown"
                            aria-labelledby="profileDropdown">
                            <a class="dropdown-item" href="./user-view-profile.jsp">
                                <i class="ti-id-badge text-primary"></i>
                                           Profile
                            </a>
                            <c:if test="${ClubDAO.getClubIDByUserID(userData.userID)!=-1}">                         
                            <a class="dropdown-item" href="./ManageMember">
                                <i class="ti-layout-grid2-thumb text-primary"></i>
                                Your own club
                            </a>
                            </c:if>
                             <c:if test="${ClubDAO.getClubIDByUserID(userData.userID)==-1}">
                            <a class="dropdown-item" href="./user-create-club.jsp">
                                <i class="ti-layout-grid2-thumb text-primary"></i>
                                    Create your own club
                            </a>
                            </c:if>
                            <a class="dropdown-item" href="./user-change-password.jsp">
                                <i class="ti-shield text-primary"></i>
                                    Change password
                            </a>
                            <a class="dropdown-item" href="./LogoutServlet">
                                <i class="ti-power-off text-primary"></i>
                                    Logout
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                data-toggle="offcanvas">
            <span class="icon-menu"></span>
        </button>
    </div>
</nav>