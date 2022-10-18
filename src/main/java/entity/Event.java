/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author ASUS
 */
public class Event {
    private int eventID;
    private int clubID;
    private String eventName;
    private String location; 
    private int userID;
    private Date dateFrom ;
    private Date dateTo;

    public Event(int eventID, int clubID, String eventName, String location, int userID, Date dateFrom, Date dateTo) {
        this.eventID = eventID;
        this.clubID = clubID;
        this.eventName = eventName;
        this.location = location;
        this.userID = userID;
        this.dateFrom = dateFrom;
        this.dateTo = dateTo;
    }

    public int getEventID() {
        return eventID;
    }

    public void setEventID(int eventID) {
        this.eventID = eventID;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    @Override
    public String toString() {
        return "Event{" + "eventID=" + eventID + ", clubID=" + clubID + ", eventName=" + eventName + ", location=" + location + ", userID=" + userID + ", dateFrom=" + dateFrom + ", dateTo=" + dateTo + '}';
    }
    
    
    
}
