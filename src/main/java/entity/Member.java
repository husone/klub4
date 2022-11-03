/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.Date;

/**
 *
 * @author sonsi
 */
public class Member {
    private int memberID;
    private int userID;
    private int clubID;
    private int point;
    private Date dayJoined;

    public Member(int memberID, int userID, int clubID, int point, Date dayJoined) {
        this.memberID = memberID;
        this.userID = userID;
        this.clubID = clubID;
        this.point = point;
        this.dayJoined = dayJoined;
    }

    public Member(int userID, int clubID, int point, Date dayJoined) {
        this.userID = userID;
        this.clubID = clubID;
        this.point = point;
        this.dayJoined = dayJoined;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public Date getDayJoined() {
        return dayJoined;
    }

    public void setDayJoined(Date dayJoined) {
        this.dayJoined = dayJoined;
    }
    
    
}
