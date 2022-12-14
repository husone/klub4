package controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClubDAO;
import DAO.PostDAO;
import entity.Post;
import entity.User;

/**
 * @author quangpao
 * @version 1.0
 */

public class PostServlet extends HttpServlet {

    protected void processCreateRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Called processCreatePost request");

        HttpSession session = request.getSession();

        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image-url");

        User user = (User) session.getAttribute("userData");
        int userID = user.getUserID();
        int clubID = ClubDAO.getClubIDByUserID(userID);
        // Get Date from system
        Date time = new Date(System.currentTimeMillis());

        Post post = new Post(title, content, time, clubID, image);

        PostDAO.createPost(post);

    }

    protected void processUpdateRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("Called processUpdatePost request");

        HttpSession session = request.getSession();
        int postID = Integer.parseInt(request.getParameter("postID"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String image = request.getParameter("image-url");

        User user = (User) session.getAttribute("userData");
        int userID = user.getUserID();
        int clubID = ClubDAO.getClubIDByUserID(userID);
        // Get Date from system
        Date time = new Date(System.currentTimeMillis());

        Post post = new Post(postID, title, content, time, clubID, image);

        PostDAO.updatePost(post);

    }

    protected void processDeleteRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        int postID = Integer.parseInt(request.getParameter("postID"));
        PostDAO.deletePost(postID);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd = request.getRequestDispatcher("manager-manage-post-create.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String typeOfRequest = request.getParameter("typeOfRequest");

        switch (typeOfRequest) {
            case "createPost":
                processCreateRequest(request, response);
                break;
            case "updatePost":
                processUpdateRequest(request, response);
                break;
            case "deletePost":
                processDeleteRequest(request, response);
                break;
            default:
                break;
        }
        response.sendRedirect("ManagePost");
    }
}
