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
    private int role;
    private int point;
    private Date dayJoined;
    private int membership;
    
    public Member() {
    }

    public Member(int memberID, int userID, int role, int point, Date dayJoined, int membership) {
        this.memberID = memberID;
        this.userID = userID;
        this.role = role;
        this.point = point;
        this.dayJoined = dayJoined;
        this.membership = membership;
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

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
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

    public int getMembership() {
        return membership;
    }

    public void setMembership(int membership) {
        this.membership = membership;
    }
    
    

    
}
