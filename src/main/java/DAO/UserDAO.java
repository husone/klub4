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

import org.mindrot.jbcrypt.BCrypt;

import database.ConnectDB;
import entity.User;

/**
 *
 * @author kin, quangpao
 * @version 1.2
 */
public class UserDAO {

    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = db.openConnection();
    static PreparedStatement statement = null;
    static ResultSet rs = null;


    /**
     * Get all user
     * @return: ArrayList<User>
     */
    public static ArrayList<User> getUsers() {
        ArrayList<User> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [USERS] order by userID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int userID = Integer.parseInt(rs.getString(1).trim());
                String username = rs.getString(2);
                String name = rs.getString(3).trim();
                String email = rs.getString(4).trim();
                String password = rs.getString(5).trim();
                Date dOB = rs.getDate(6);
                String address = rs.getString(7);
                String avatar = rs.getString(8);
                list.add(new User(userID, username, name, email, password, dOB, address, avatar));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "UserDAO getUsersMethod", ex);
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

    /**
     * Delete User by userID
     * @param userID
     * @return: true if delete success |
     *        false if delete fail
     */
    public static boolean deleteUser(int userID) {
        ArrayList<User> list = getUsers();
        boolean checkUser = false;

        boolean checkDelete = false;
        // check If we have User ID
        for (User user : list) {
            if (user.getUserID() == userID) {
                checkUser = true;
            }
        }
        if (checkUser) {
            String sql = "DELETE FROM USERS WHERE userID=?;";
            try {
                con = db.openConnection();
                statement = con.prepareStatement(sql);
                statement.setInt(1, userID);
                if (statement.executeUpdate() != 0) {
                    checkDelete = true;
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                con.close();
                statement.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return checkDelete;
    }

    /**
     * Update User
     * @param user
     * @return: true if update success |
     *        false if update fail
     */
    public static boolean updateUser(User user) {

        boolean checkUpdate = false;

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
            statement.setString(6, user.getAddress());
            statement.setInt(7, user.getUserID());
            statement.setString(8, user.getAvatar());
            checkUpdate = statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return checkUpdate;
    }

    /**
     * Check Login
     * @param email
     * @param password
     * @return true if email and password is correct |
     *         false if email and password is incorrect
     */
    public static boolean checkLogin(String email, String password) {
        System.out.println("email: " + email);
        System.out.println("password: " + password);
        boolean checkLogin = false;
        String sql = "SELECT * FROM USERS WHERE email = ? AND password = ?;";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, password);
            rs = statement.executeQuery();
            if(rs.next()) {
                checkLogin = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("checkLogin: " + checkLogin);
        return checkLogin;
    }

    /**
     * Check if email is existed in the database
     * @param email
     * @return true if email is existed |
     *       false if email is not existed
     */
    public static boolean checkRegister(String email) {

        boolean checkRegister = false;
        String sql = "SELECT * FROM USERS WHERE email = ?;";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            rs = statement.executeQuery();
            if (rs.next()) {
                checkRegister = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return checkRegister;
    }

    /**
     * Get User by email
     * @param email
     * @return User
     */
    public static User getUserByEmail(String email) {
        User user = null;
        String sql = "SELECT * FROM USERS WHERE email = ?;";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            rs = statement.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt("userID"), rs.getString("username"), rs.getString("name"), rs.getString("email"), rs.getString("password"), rs.getDate("dOB"), rs.getString("address"), rs.getString("avatar"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    /**
     * Register User
     * @param name
     * @param email
     * @param password
     * @return: true if register success |
     *       false if register fail
     */
    public static boolean registerUser(String name, String email, String password) {
        boolean checkRegister = false;
        String sql = "INSERT INTO USERS (name, email, password) VALUES (?, ?, ?);";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, password);
            if (statement.executeUpdate() != 0) {
                checkRegister = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return checkRegister;
    }
}