package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.ConnectDB;
import entity.Event;

/**
 *
 * @author quangpao
 * @version 1.0
 */


public class EventDAO {
    
    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = db.openConnection();
    static PreparedStatement statement = null;
    static ResultSet rs = null;

    /**
     * Get all events
     * @return ArrayList<Event>
     */
    public static ArrayList<Event> getAllEvents() {
        ArrayList<Event> events = new ArrayList<>();
        try {
            String sql = "SELECT * FROM event";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("eventID");
                int clubID = rs.getInt("clubID");
                String eventName = rs.getString("eventName");
                String description = rs.getString("description");
                String location = rs.getString("location");
                Date dateFrom = rs.getDate("dateFrom");
                Date dateTo = rs.getDate("dateTo");
                Event event = new Event(eventID, clubID, eventName, description, location, dateFrom, dateTo);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

    /**
     * Get all events by clubID
     * @param clubID
     * @return ArrayList<Event>
     */
    public static ArrayList<Event> getAllEventsByClubID(int clubID) {
        ArrayList<Event> events = new ArrayList<>();
        try {
            String sql = "SELECT * FROM event WHERE clubID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("eventID");
                String eventName = rs.getString("eventName");
                String description = rs.getString("description");
                String location = rs.getString("location");
                Date dateFrom = rs.getDate("dateFrom");
                Date dateTo = rs.getDate("dateTo");
                Event event = new Event(eventID, clubID, eventName, description, location, dateFrom, dateTo);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

    /**
     * Get event by eventID
     * @param eventID
     * @return Event
     */
    public static Event getEventByEventID(int eventID) {
        Event event = null;
        try {
            String sql = "SELECT * FROM event WHERE eventID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, eventID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int clubID = rs.getInt("clubID");
                String eventName = rs.getString("eventName");
                String description = rs.getString("description");
                String location = rs.getString("location");
                Date dateFrom = rs.getDate("dateFrom");
                Date dateTo = rs.getDate("dateTo");
                event = new Event(eventID, clubID, eventName, description, location, dateFrom, dateTo);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return event;
    }

    /**
     * Add new event
     * @param event
     * @return boolean
     */
    public static boolean addEvent(Event event) {
        try {
            String sql = "INSERT INTO event(clubID, eventName, description, location, dateFrom, dateTo) VALUES(?, ?, ?, ?, ?, ?)";
            statement = con.prepareStatement(sql);
            statement.setInt(1, event.getClubID());
            statement.setString(2, event.getEventName());
            statement.setString(3, event.getDescription());
            statement.setString(4, event.getLocation());
            statement.setDate(5, event.getDateFrom());
            statement.setDate(6, event.getDateTo());
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Update event
     * @param event
     * @return boolean
     */
    public static boolean updateEvent(Event event) {
        try {
            String sql = "UPDATE event SET eventName = ?, description = ?, location = ?, dateFrom = ?, dateTo = ? WHERE eventID = ?";
            statement = con.prepareStatement(sql);
            statement.setString(1, event.getEventName());
            statement.setString(2, event.getDescription());
            statement.setString(3, event.getLocation());
            statement.setDate(4, event.getDateFrom());
            statement.setDate(5, event.getDateTo());
            statement.setInt(6, event.getEventID());
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Delete event
     * @param eventID
     * @return boolean
     */
    public static boolean deleteEvent(int eventID) {
        try {
            String sql = "DELETE FROM event WHERE eventID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, eventID);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    /**
     * Get all events by clubID and date
     * @param clubID
     * @param date
     * @return ArrayList<Event>
     */
    public static ArrayList<Event> getAllEventsByClubIDAndDate(int clubID, Date date) {
        ArrayList<Event> events = new ArrayList<>();
        try {
            String sql = "SELECT * FROM event WHERE clubID = ? AND dateFrom <= ? AND dateTo >= ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            statement.setDate(2, date);
            statement.setDate(3, date);
            rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("eventID");
                String eventName = rs.getString("eventName");
                String description = rs.getString("description");
                String location = rs.getString("location");
                Date dateFrom = rs.getDate("dateFrom");
                Date dateTo = rs.getDate("dateTo");
                Event event = new Event(eventID, clubID, eventName, description, location, dateFrom, dateTo);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }

    /**
     * Get all events by date
     * @param date
     * @return ArrayList<Event>
     */
    public static ArrayList<Event> getAllEventsByDate(Date date) {
        ArrayList<Event> events = new ArrayList<>();
        try {
            String sql = "SELECT * FROM event WHERE dateFrom <= ? AND dateTo >= ?";
            statement = con.prepareStatement(sql);
            statement.setDate(1, date);
            statement.setDate(2, date);
            rs = statement.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt("eventID");
                int clubID = rs.getInt("clubID");
                String eventName = rs.getString("eventName");
                String description = rs.getString("description");
                String location = rs.getString("location");
                Date dateFrom = rs.getDate("dateFrom");
                Date dateTo = rs.getDate("dateTo");
                Event event = new Event(eventID, clubID, eventName, description, location, dateFrom, dateTo);
                events.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return events;
    }
}
