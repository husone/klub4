/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author sonsi
 */
public class Fund {
    private int fundId;
    private int clubID;
    private String fundName;
    private Date dateCreated;
    private int amount;

    public Fund(int fundId, int clubID, String fundName, Date dateCreated, int amount) {
        this.fundId = fundId;
        this.clubID = clubID;
        this.fundName = fundName;
        this.dateCreated = dateCreated;
        this.amount = amount;
    }

    public Fund(int clubID, String fundName, Date dateCreated, int amount) {
        this.clubID = clubID;
        this.fundName = fundName;
        this.dateCreated = dateCreated;
        this.amount = amount;
    }

    public int getFundId() {
        return fundId;
    }

    public void setFundId(int fundId) {
        this.fundId = fundId;
    }

    public int getClubID() {
        return clubID;
    }

    public void setClubID(int clubID) {
        this.clubID = clubID;
    }

    public String getFundName() {
        return fundName;
    }

    public void setFundName(String fundName) {
        this.fundName = fundName;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
    
    
}
