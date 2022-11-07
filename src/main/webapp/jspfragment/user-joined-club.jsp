<%@page import="entity.Club"%>
<%@page import="entity.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="DAO.FundDAO"%>
<%@page import="DAO.MemberDAO"%>
<div class="col-md-3" style="overflow-y :scroll; height:100vh">

    <nav class="club-joined sidebar pl-3" style="width:100% ;" id="sidebar">
        <%  User user = (User) request.getSession().getAttribute("userData");

            List<Club> clubList = MemberDAO.getClubsOfMember(user.getUserID());
            if (!clubList.isEmpty())
                request.setAttribute("cl", clubList);
        %>
        <c:if test="${cl == null}">
            <div class="col-12">
                <h3 class="col-12">You did not join any clubs</h3>
            </div>
        </c:if>
        <c:if test="${cl != null}">
            <ul class="nav">
                <div class="col-12">
                    <h3 class="col-12">Club you's joined</h3>
                </div>
                <c:forEach var="i" items="${cl}">
                    <li class="nav-item py-0" style="width:100% ;">
                        <a class="nav-link py-1" href="./UserViewClub?clubID=${i.clubID}" style="width:100%">
                            <div class="row">
                                <div class="col-4">
                                    <img src="${i.logo}"
                                         style="width:50px ; height:50px;" class="rounded-circle border" alt="">
                                </div>
                                <div class="offset-2 col-6 my-auto">
                                    <span class="menu-title">${i.clubName}</span>
                                </div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </c:if> 
        </ul>
    </nav>
</div>