package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.UserDAO;

/**
 *
 * @author quangpao
 * @version 1.0
 *
 */

public class LoginServlet extends HttpServlet {

    /*
     * Process login request
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest    request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("login-email");
        String password = request.getParameter("login-password");
        boolean isValid = UserDAO.checkLogin(email, password);
        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("userData", UserDAO.getUserByEmail(email));
            if (email.equals("admin")){
                request.getRequestDispatcher("/admin-hello.jsp").forward(request, response);
            }
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/club_home.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
        }
    }
}