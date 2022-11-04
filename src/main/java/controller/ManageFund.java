package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClubDAO;
import DAO.FundDAO;
import entity.Fund;
import entity.User;

public class ManageFund extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                System.out.println("Do POST ManageFund called");
        HttpSession session = request.getSession();
        int clubID = (int) session.getAttribute("clubID");
        String fundName = request.getParameter("fundName");
        Date dateCreated = new Date(System.currentTimeMillis());
        int amount = Integer.parseInt(request.getParameter("amount"));
        Fund fund = new Fund(clubID, fundName, dateCreated, amount);
        FundDAO.createFund(fund);
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                System.out.println("Do GET ManageFund called");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userData");
        int clubID = ClubDAO.getClubIDByUserID(user.getUserID());
        List<Fund> funds = FundDAO.getFundByClubID(clubID);
        request.setAttribute("fundList", funds);
        request.setAttribute("clubID", clubID);
        request.getRequestDispatcher("/manager-manage-fund.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
