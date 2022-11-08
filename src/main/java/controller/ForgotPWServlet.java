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
import entity.User;

public class ForgotPWServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response, String here)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
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
        String password = request.getParameter("newPassword");
        System.out.println("here" + email + OTP + password);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (!UserDAO.checkRegister(email)) {
            out.print("Email not found");
        } else {
            if (OTP.isEmpty()){
            String PIN = Generate.OTP(6);
            UserDAO.setPIN(email, PIN);
            SendEmailTLS.sendEmailResetPassword(email, PIN);
            out.print("OTP sent!");
        }
            else {
                User user = UserDAO.getUserByEmail(email);
                System.out.println(user.getOTP() + " " +OTP);
                if (OTP.equals(user.getOTP())){
                    UserDAO.updatePW(user.getUserID(), password);
                    UserDAO.deletePIN(email, "");
                    out.print("Password changed!");
                }
                else {
                    out.print("Wrong OTP");
                }
            }
//        } 
//        else {
//            if (UserDAO.)
//        }
    }
}

@Override
public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
