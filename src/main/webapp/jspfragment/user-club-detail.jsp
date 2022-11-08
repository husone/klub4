<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="DAO.ClubDAO"%>
<%@page import="entity.Club"%>
<!DOCTYPE html>
<div class="col-md-3">
    <div class="about-club blog_right_sidebar mt-5">
        <c:if test="${currentClubID != null}">
            <div class="text-center">
                <h3>About Club</h3>
                <hr>
            </div>

            <div class="m-2">
                <div class="card" style="">
                    <img class="card-img-top" src="${ClubDAO.getClubByID(currentClubID).logo}"
                         alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${ClubDAO.getClubByID(currentClubID).clubName}</h5>
                        <p class="card-text">${ClubDAO.getClubByID(currentClubID).description}
                        </p>
                        <div class="mt-5">
                            <a href="./LeaveClub?clubID=${currentClubID}" style="padding: 15px 30px; text-decoration: none" class="btn-danger btn-sm"> Leave club </a>
                        </div>

                    </div>
                </div>
            </div>
        </c:if>
            <c:if test="${currentClubID == null}">
                <div class="text-center">
                <h3>Join a club to continue</h3>
                <hr>
            </div>
            </c:if>
    </div>
</div>
