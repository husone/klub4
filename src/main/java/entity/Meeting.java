/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

/**
 *
 * @author quangpao
 */
public class Meeting {
    
    private int postID;
    private String location;
    private Date time;

    public Meeting() {
    }

    public Meeting(int postID, String location, Date time) {
        this.postID = postID;
        this.location = location;
        this.time = time;
    }
    
    
    
    //set method
    public void setPostID(int postID) {
        this.postID = postID;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public void setTime(Date time) {
        this.time = time;
    }
    
    //get method
    public int getPostID() {
        return postID;
    }

    public String getLocation() {
        return location;
    }

    public Date getTime() {
        return time;
    }
    
    
}
