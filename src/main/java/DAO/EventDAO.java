/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Event;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.ConnectDB;

/**
 *
 * @author ASUS
 */
public class EventDAO {

    public List<Event> getListEvent() {
        List<Event> list = new ArrayList<>();
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String query = "SELECT TOP (1000) [eventID]\n"
                + "      ,[clubID]\n"
                + "      ,[eventName]\n"
                + "      ,[location]\n"
                + "      ,[userID]\n"
                + "      ,[dateFrom]\n"
                + "      ,[dateTo]\n"
                + "  FROM [ClubDB].[dbo].[EVENTS]";

        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int eventID = rs.getInt(1);
                int clubID = rs.getInt(2);
                String eventName = rs.getString(3);
                String location = rs.getString(4);
                int userID = rs.getInt(5);
                Date dateFrom = rs.getDate(6);
                Date dateTo = rs.getDate(7);
                list.add(new Event(eventID, clubID, eventName, location, userID, dateFrom, dateTo));
            }
        } catch (Exception e) {
        }
        return list;

    }

    public void createEvent(Event event) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;

        String query = "INSERT [dbo].[EVENTS] ([eventID], [clubID], [eventName], [location], [userID], [dateFrom], [dateTo]) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, event.getEventID());
            ps.setInt(2, event.getClubID());
            ps.setString(3, event.getEventName());
            ps.setString(4, event.getLocation());
            ps.setInt(5, event.getUserID());
            ps.setDate(6, event.getDateFrom());
            ps.setDate(7, event.getDateTo());

            ps.execute();

        } catch (Exception e) {
        } finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateEvent(Event event) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;

        String query = "UPDATE EVENTS\n"
                + "SET eventID =?, clubID=?, eventName=?, location=? , userID=?, dateFrom=?, dateTo=?\n"
                + "WHERE eventID = ?;";
        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, event.getEventID());
            ps.setInt(2, event.getClubID());
            ps.setString(3, event.getEventName());
            ps.setString(4, event.getLocation());
            ps.setInt(5, event.getUserID());
            ps.setDate(6, event.getDateFrom());
            ps.setDate(7, event.getDateTo());
            ps.setInt(8, event.getEventID());

            ps.execute();

        } catch (Exception e) {
        } finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void deleteEvent(Event event) {
        ConnectDB db = ConnectDB.getInstance();
        Connection conn = null;
        PreparedStatement ps = null;

        String query = "DELETE FROM EVENTS WHERE eventID= ?";
        try {
            conn = db.openConnection();
            ps = conn.prepareStatement(query);

            ps.setInt(1, event.getEventID());

            ps.execute();
        } catch (Exception e) {
        } finally {
            try {
                ps.close();
                conn.close();
            } catch (SQLException ex) {
                Logger.getLogger(EventDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}