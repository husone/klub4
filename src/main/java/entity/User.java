/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author kin
 */
public class User {
    private int userID;
    private String name;
    private String email;
    private String password;
    private Date dOB;
    private String address;
    private String OTP;
    private String avatar;

    public User(int userID, String name, String email, String password, Date dOB, String address, String OTP, String avatar) {
        this.userID = userID;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dOB = dOB;
        this.address = address;
        this.OTP = OTP;
        this.avatar = avatar;
    } 

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getdOB() {
        return dOB;
    }

    public void setdOB(Date dOB) {
        this.dOB = dOB;
    }

    //Get Date of Birth in String format (dd/MM/yyyy)
    public String getdOBString() {
        return dOB.toString();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOTP() {
        return OTP;
    }

    public void setOTP(String OTP) {
        this.OTP = OTP;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
}
