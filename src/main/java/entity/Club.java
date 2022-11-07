/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;

/**
 *
 * @author sonsi
 */
public class Club {
    private int clubID;
    private String clubName;
    private String clubType;
    private int managerID;
    private Date dateCreated;
    private String description;
    private String logo;

    public Club(int clubID, String clubName, String clubType, int managerID, String description, String logo) {
        this.clubID = clubID;
        this.clubName = clubName;
        this.clubType = clubType;
        this.managerID = managerID;
        this.description = description;
        this.logo = logo;
    }

    public Club(int clubID, String clubName, String clubType, int managerID, Date dateCreated, String description, String logo) {
        this.clubID = clubID;
        this.clubName = clubName;
        this.clubType = clubType;
        this.managerID = managerID;
        this.dateCreated = dateCreated;
        this.description = description;
        this.logo = logo;
    }

    public Club(String clubName, String clubType, int managerID, Date dateCreated, String description, String logo) {
        this.clubName = clubName;
        this.clubType = clubType;
        this.managerID = managerID;
        this.dateCreated = dateCreated;
        this.description = description;
        this.logo = logo;
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

    public String getClubType() {
        return clubType;
    }

    public void setClubType(String clubType) {
        this.clubType = clubType;
    }

    public int getManagerID() {
        return managerID;
    }

    public void setManagerID(int managerID) {
        this.managerID = managerID;
    }

    public Date getdateCreated() {
        return dateCreated;
    }

    public void setdateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    @Override
    public String toString() {
        return "Club{" + "clubID=" + clubID + ", clubName=" + clubName + ", clubType=" + clubType + ", managerID=" + managerID + ", dateCreated=" + dateCreated + ", description=" + description + ", logo=" + logo + '}';
    }
    
    
    
}
