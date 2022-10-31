package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.EventDAO;
import entity.Event;

/**
 * @author quangpao
 * @version 1.0
 */

public class EventServlet extends HttpServlet {

    protected void processCreateEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            HttpSession session = request.getSession();

            String eventName = request.getParameter("eventName");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String dateFrom = request.getParameter("dateFrom");
            String dateTo = request.getParameter("dateTo");

            // convert date from string to date
            Date dateFrom1 = Date.valueOf(dateFrom);
            Date dateTo1 = Date.valueOf(dateTo);

            int clubID = (int) session.getAttribute("clubID");

            Event event = new Event(clubID, eventName, description, location, dateFrom1, dateTo1);

            EventDAO.addEvent(event);
        }
    }

    protected void processUpdateEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String eventName = request.getParameter("eventName");
            String description = request.getParameter("description");
            String location = request.getParameter("location");
            String dateFrom = request.getParameter("dateFrom");
            String dateTo = request.getParameter("dateTo");
            int eventID = Integer.parseInt(request.getParameter("eventID"));
            // convert date from string to date
            Date dateFrom1 = Date.valueOf(dateFrom);
            Date dateTo1 = Date.valueOf(dateTo);

            Event event = new Event(eventName, description, location, dateFrom1, dateTo1, eventID);

            EventDAO.updateEvent(event);
        }
    }

    protected void processDeleteEvent(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            int eventID = Integer.parseInt(request.getParameter("eventID"));

            EventDAO.deleteEvent(eventID);

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeOfRequest = request.getParameter("eventRq");
        switch (typeOfRequest) {
            case "createEvent":
                processCreateEvent(request, response);
                break;
            case "updateEvent":
                processUpdateEvent(request, response);
                break;
            case "deleteEvent":
                processDeleteEvent(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String typeOfRequest = request.getParameter("eventRq");
        switch (typeOfRequest) {
            case "createEvent":
                processCreateEvent(request, response);
                break;
            case "updateEvent":
                processUpdateEvent(request, response);
                break;
            case "deleteEvent":
                processDeleteEvent(request, response);
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
