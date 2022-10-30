package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.PostDAO;
import entity.Post;
import entity.User;

public class PostServlet extends HttpServlet {

    protected void processCreateRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            HttpSession session = request.getSession();

            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String image = request.getParameter("image");

            User user = (User) session.getAttribute("userData");
            int userID = user.getUserID();
            int clubID = (int) session.getAttribute("clubID");
            //Get Date from system
            Date time = new Date(System.currentTimeMillis());

            Post post = new Post(title, content, time, clubID, userID, image);
            
            PostDAO.createPost(post);

        }
    }

    protected void processUpdateRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                
                HttpSession session = request.getSession();
    
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String image = request.getParameter("image");
    
                User user = (User) session.getAttribute("userData");
                int userID = user.getUserID();
                int clubID = (int) session.getAttribute("clubID");
                //Get Date from system
                Date time = new Date(System.currentTimeMillis());
    
                Post post = new Post(title, content, time, clubID, userID, image);
                
                PostDAO.updatePost(post);
    
        }
    }

    protected void processDeleteRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                    
                    int postID = Integer.parseInt(request.getParameter("postID"));
                    PostDAO.deletePost(postID);
        
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeOfRequest = request.getParameter("typeOfRequest");

        switch (typeOfRequest) {
            case "create":
                processCreateRequest(request, response);
                break;
            case "update":
                processUpdateRequest(request, response);
                break;
            case "delete":
                processDeleteRequest(request, response);
                break;
            default:
                break;
        }

        response.sendRedirect("/blog.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String typeOfRequest = request.getParameter("typeOfRequest");

        switch (typeOfRequest) {
            case "create":
                processCreateRequest(request, response);
                break;
            case "update":
                processUpdateRequest(request, response);
                break;
            case "delete":
                processDeleteRequest(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
