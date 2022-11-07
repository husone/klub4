<%@page import="DAO.PostDAO"%>
<%@page import="DAO.UserDAO"%>
<%@page import="DAO.MemberDAO"%>
<%@page import="DAO.CommentDAO"%>
<%@page import="java.util.List"%>
<%@page import="entity.Post"%>
<%@page import="entity.Comment"%>
<%@page import="entity.User"%>
<%@page import="entity.Member"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:forEach items="${PostDAO.getPostsByClubID(param.clubID)}" var="post">
    <article class="blog_item rounded" style="background-color:white; border: 0.5px solid #e9e2e2">
        <div class="blog_item_img">
            <img class="card-img " src="${post.image}" alt=""
                style="border-top-left-radius:10px;border-top-right-radius:10px">
            <a href="#" class="blog_item_date">
                <h3>${post.getDay()}</h3>
                <p>${post.getMonth()}</p>
            </a>
        </div>
        <div class="blog_details">
            <a class="d-inline-block" href="blog_details.html">
                <h2 class="blog-head" style="color: #2d2d2d;">${post.title}</h2>
            </a>
            <p style="color: #2d2d2d ;">${post.content}</p>


            <div class="comment-form mx-2 my-0">
                <h4 class="mb-0">Leave a comment</h4>
                <form class="form-contact comment_form form-group" action="./CommentServlet" method="POST"
                    id="commentForm">
                    <input type="text" class="form-control" name="comment" placeholder="Write your comment">
                    <input type="hidden" name="postID" value="${post.postID}">
                    <input type="hidden" name="memberID" value="${param.memberID}">
                </form>
            </div>


            <div class="comments-area mx-2 my-0" style="">
                <h4>Comments</h4>

                <c:if test="${CommentDAO.getPostComments(post.postID).size() == 0}">
                    <p>No comments yet</p>
                </c:if>
                <c:if test="${CommentDAO.getPostComments(post.postID).size() != 0}">
                    <c:forEach items="${CommentDAO.getPostComments(post.postID)}" var="comment">
                        <div class="comment-list">
                            <div class="single-comment justify-content-between d-flex"
                                style="border-bottom: solid 1px bla ;">
                                <div class="user justify-content-between d-flex">
                                    <div class="thumb">
                                        <img src="${UserDAO.getUserByID(MemberDAO.getUserID(comment.memberID)).getAvatar()}"
                                            alt="">
                                    </div>
                                    <div class="desc">

                                        <p class="comment" style="line-height: 16px; font-size: smaller;">
                                            ${comment.content}
                                        </p>


                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h5>
                                                    <a
                                                        href="#">${UserDAO.getUserByID(MemberDAO.getUserID(comment.memberID)).getName()}</a>
                                                </h5>
                                                <p class="date">${comment.getTimeString()} </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr />
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>
    </article>
</c:forEach>