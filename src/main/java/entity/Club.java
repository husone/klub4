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
public class Club {
    private int clubID;
    private String clubName;
    private int managerID;
    private Date datedCreated;
    private String location;
    private String description;
    private String logo;

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public Club() {
    }

    public Club(int clubID, String clubName, int managerID, Date datedCreated, String location, String description, String logo) {
        this.clubID = clubID;
        this.clubName = clubName;
        this.managerID = managerID;
        this.datedCreated = datedCreated;
        this.location = location;
        this.description = description;
        this.logo = logo;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public String getClubName() {
        return clubName;
    }

    public void setClubName(String clubName) {
        this.clubName = clubName;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    public Date getDatedCreated() {
        return datedCreated;
    }

    public void setDatedCreated(Date datedCreated) {
        this.datedCreated = datedCreated;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
