package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.FundDAO;
import entity.Fund;

/**
 * @author quangpao
 * @version 1.0
 */

public class FundManagerServlet extends HttpServlet {

    protected void processCreateRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();

            int clubID = (int) session.getAttribute("clubID");
            String fundName = request.getParameter("fundName");
            Date dateCreated = new Date(System.currentTimeMillis());
            int amount = Integer.parseInt(request.getParameter("amount"));
            Fund fund = new Fund(clubID, fundName, dateCreated, amount);
            FundDAO.createFund(fund);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeOfRequest = request.getParameter("typeOfRequest");
        switch (typeOfRequest) {
            case "createFund":
                processCreateRequest(request, response);
                break;
            default:
                break;
        }
        RequestDispatcher rd = request.getRequestDispatcher("club.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeOfRequest = request.getParameter("typeOfRequest");
        switch (typeOfRequest) {
            case "createFund":
                processCreateRequest(request, response);
                break;
            default:
                break;
        }
        RequestDispatcher rd = request.getRequestDispatcher("club.jsp");
        rd.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
