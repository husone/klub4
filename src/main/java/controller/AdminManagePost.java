/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PostDAO;
import entity.Post;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sonsi
 */
public class AdminManagePost extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminManagePost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminManagePost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        List<Post> postList = PostDAO.getPosts();
        request.setAttribute("content", postList);
//        System.out.println(postList.size());
//        for (Post post : postList) {
//            System.out.println(post.getTitle());
//        }
//        System.out.println("here");
//System.out.println("<div class=\"col-md-4 stretch-card grid-margin\">\n" +
//"                            <div class=\"card\">\n" +
//"                                <div class=\"card-body\">\n" +
//"                                    <img src=\""+ post.getImage()) +"\" style=\"border-radius:10px ;\"\n" +
//"                                         alt=\"group-01\" class=\"img-fluid\">\n" +
//"                                    <div class=\"text-md-left mt-1\">\n" +
//"                                        <h2>"+post.getTitle()+"</h2>\n" +
//"                                        <h5>"</h5>\n" +
//"                                        <h5>Tao ngay: </h5>\n" +
//"                                    </div>\n" +
//"                                    <div class=\"row d-flex justify-content-center\">\n" +
//"                                        <div>\n" +
//"                                            <button type=\"button\" class=\"btn btn-danger btn-sm deleteBtn${i.getPostID}\"\n" +
//"                                                    style=\"height: 40px; width:auto\"><i\n" +
//"                                                    class=\"ti-trash\"></i>Delete</button>\n" +
//"                                            <button type=\"button\" class=\"btn btn-info btn-sm detailBtn\"\n" +
//"                                                    style=\"height: 40px; width:auto\"><i\n" +
//"                                                    class=\"ti-info\"></i>Detail</button>\n" +
//"                                        </div>\n" +
//"                                    </div>\n" +
//"                                </div>\n" +
//"                            </div>\n" +
//"                        </div>");
        request.getRequestDispatcher("/admin-manage-post.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
