package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClubDAO;
import DAO.EventDAO;
import entity.Event;
import entity.User;

public class ManageEvent extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userData");
        if (user == null) {
            response.sendRedirect("login.jsp");
        } else {
            int userID = user.getUserID();
            int clubID = ClubDAO.getClubIDByUserID(userID);
            session.setAttribute("clubID", clubID);
            List<Event> events = EventDAO.getAllEventsByClubID(clubID);
            request.setAttribute("eventList", events);
            request.getRequestDispatcher("/manager-manage-event.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userData");
        if (user == null) {
            response.sendRedirect("login.jsp");
        } else {
            int userID = user.getUserID();
            int clubID = ClubDAO.getClubIDByUserID(userID);
            session.setAttribute("clubID", clubID);
            List<Event> events = EventDAO.getAllEventsByClubID(clubID);
            request.setAttribute("eventList", events);
            request.getRequestDispatcher("/manager-manage-event.jsp").forward(request, response);
        }

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