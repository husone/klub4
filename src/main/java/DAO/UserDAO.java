/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.ConnectDB;
import entity.User;

/**
 *
 * author kin
 */
public class UserDAO {

    ConnectDB db = ConnectDB.getInstance();
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet rs = null;
    
    public ArrayList<User> getUser() {
        ArrayList<User> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [USERS] order by userID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int userID = Integer.parseInt(rs.getString(1).trim());
                String username = rs.getString(2).trim();
                String name = rs.getString(3).trim();
                String email = rs.getString(4).trim();
                String password = rs.getString(5).trim();
                Date dOB = rs.getDate(6);
                String address = rs.getString(7).trim();
                String avatar = rs.getString(8).trim();
                list.add(new User(userID, username, name, email, password, dOB, address,avatar));
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
    public void addUser(User user) {
        String sql = "INSERT INTO [USERS] (userID, username, name, email, password, dob, address, avatar)\n"+
                "VALUES (?,?,?,?,?,?,?,?);";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setInt(1, user.getUserID());
            statement.setString(2, user.getUsername());
            statement.setString(3, user.getName());
            statement.setString(4, user.getEmail());
            statement.setString(5, user.getPassword());
            statement.setDate(6, user.getdOB());
            statement.setString(7, user.getAddress());
            statement.setString(8, user.getAvatar());
            statement.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    public boolean deleteUser(int userID) {
        ArrayList<User> list = getUser();
        boolean checkUser = false;
        //check If we have User ID
        for (User user : list) {
            if(user.getUserID()==userID) {
                checkUser=true;
            }
        }
        if(checkUser) {
            String sql="DELETE FROM USERS WHERE userID=?;";
            try {
                con = db.openConnection();               
                statement = con.prepareStatement(sql);
                statement.setInt(1, userID);
                statement.execute();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
                statement.close();
                return true;
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    public void updateUser(User user) {
        String sql = "UPDATE USERS\n"
                + "SET username = ?, name = ?, email = ?, password = ?, dOB = ?, address = ?, avatar = ?\n"
                + "WHERE userID = ?;";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getName());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
            statement.setDate(5, user.getdOB());
            statement.setString(6,user.getAddress());
            statement.setInt(7, user.getUserID());
            statement.setString(8, user.getAvatar());
            statement.execute();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();
        ArrayList<User> list = userDAO.getUser();
        for (User user : list) {
            System.out.println(user);
        }
    }

}
