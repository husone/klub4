/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;
import java.util.Calendar;

/**
 *
 * @author quangpao
 */

public class Post {
    
    private int postID;
    private String title;
    private String content;
    private Date time;
    private int clubID;
    private String image;
    
    // constructor with postID, title, description, content, time, clubID, userID
    public Post(int postID, String title, String content, Date time, int clubID) {
        this.postID = postID;
        this.content = content;
        this.time = time;
        this.clubID = clubID;
    }

    public Post(String title, String content, Date time, int clubID, String image) {
        this.title = title;
        this.content = content;
        this.time = time;
        this.clubID = clubID;
        this.image = image;
    }

    // constructor with postID, title, content, time, clubID, userID, image
    public Post(int postID, String title, String content, Date time, int clubID, String image) {
        this.postID = postID;
        this.title = title;
        this.content = content;
        this.time = time;
        this.clubID = clubID;
        this.image = image;
    }

    // constructor with postID, title, content, time, clubID, userID, image, comments
    public Post(int postID, String title, String content, Date time, int clubID, int userID, String image) {
        this.postID = postID;
        this.title = title;
        this.content = content;
        this.time = time;
        this.clubID = clubID;
        this.image = image;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPostID() {
        return postID;
    }

    public String getTitle() {
        return title;
    }

    public String getContent() {
        return content;
    }

    public Date getTime() {
        return time;
    }

    public int getClubID() {
        return clubID;
    }

    public String getImage() {
        return image;
    }
 
    
    public String getDateCreatedString() {
        return time.toString();
    }

    // get time in format: MMM
    public String getMonth() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        int month = cal.get(Calendar.MONTH);
        String monthString = "";
        switch (month) {
            case 0:
                monthString = "Jan";
                break;
            case 1:
                monthString = "Feb";
                break;
            case 2:
                monthString = "Mar";
                break;
            case 3:
                monthString = "Apr";
                break;
            case 4:
                monthString = "May";
                break;
            case 5:
                monthString = "Jun";
                break;
            case 6:
                monthString = "Jul";
                break;
            case 7:
                monthString = "Aug";
                break;
            case 8:
                monthString = "Sep";
                break;
            case 9:
                monthString = "Oct";
                break;
            case 10:
                monthString = "Nov";
                break;
            case 11:
                monthString = "Dec";
                break;
        }
        return monthString;
    }


    // get time in format: dd
    public String getDay() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        int day = cal.get(Calendar.DAY_OF_MONTH);
        return String.valueOf(day);
    }
}
