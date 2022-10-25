package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import java.sql.Date;

/**
 *
 * @author quangpao
 * @version 1.0
 *
 */

public class RegisterServlet extends HttpServlet {


    /*
     * Process register request
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name-register");
            String email = request.getParameter("email-register");
            String password = request.getParameter("password-register");
            String passwordConfirm = request.getParameter("passwordConfirm-register");
            String address = request.getParameter("address-register");
            String dob = request.getParameter("dob-register");
            String username = request.getParameter("username-register");

            //change to Date
            Date sqlDate = Date.valueOf(dob);


            boolean isValid = !UserDAO.checkRegister(email);
            boolean isPassword = password.equals(passwordConfirm);
            if (isValid && isPassword) {
                if (UserDAO.registerUser(username, name, email, password, sqlDate, address)) {
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("login.jsp");
                    dispatcher.forward(request, response);
                } else {
                    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("register.jsp");
                    dispatcher.forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
