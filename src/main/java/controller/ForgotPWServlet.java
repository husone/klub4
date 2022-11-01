package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.UserDAO;
import Email.Generate;
import Email.SendEmailTLS;

public class ForgotPWServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String here)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ForgotPWServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPWServlet at " + here + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response, "");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("forgot-email");
        String here = "1";
        String OTP = request.getParameter("OTP");
        String password = request.getParameter("new-password");
        if (OTP == null || OTP.isEmpty()){
        if (UserDAO.checkRegister(email)) {
            // System.out.println("Vo roi ne ");
            here = "2";
            String PIN = Generate.OTP(6);
            UserDAO.setPIN(email, PIN);
            SendEmailTLS.sendEmailResetPassword(email, PIN);
            PrintWriter out = response.getWriter();
            out.println("<form action=\"./ForgotPWServlet\" method=\"post\">");
            out.println("<input type=\"text\" class=\"col-10\" id=\"OTP\" name=\"OTP\" placeholder=\"OTP\"> ");
            out.println("<input type=\"text\" class=\"col-10\" id=\"new-password\" name=\"new-password\" placeholder=\"New password\">");
            out.println("<button type=\"submit\" class=\"col-10 btn btn-secondary\"\n"+"style=\"background-color: #699DEB\">Submit</button>");
            out.println("</form>");
        } 
//        else {
//            if (UserDAO.)
//        }
    }}
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
