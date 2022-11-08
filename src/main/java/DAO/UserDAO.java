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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.mindrot.jbcrypt.BCrypt;

import database.ConnectDB;
import entity.Member;
import entity.User;

/**
 *
 * @author kin, quangpao
 * @version 1.3
 */
public class UserDAO {

    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = null;
    static PreparedStatement statement = null;
    static ResultSet rs = null;

    /**
     * Get all user
     *
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
                String name = rs.getString(2).trim();
                String email = rs.getString(3).trim();
                String password = rs.getString(4).trim();
                Date dOB = rs.getDate(5);
                String address = rs.getString(6);
                String PIN = rs.getString(7);
                String avatar = rs.getString(8);
                list.add(new User(userID, name, email, password, dOB, address, PIN, avatar));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "UserDAO getUsersMethod", ex);
        }
        return list;
    }

    /**
     * Get user by userID
     *
     * @param userID
     * @return: User
     */
    public static User getUserByID(int userID) {
        User user = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [USERS] WHERE userID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            rs = statement.executeQuery();
            while (rs.next()) {
                String name = rs.getString(2).trim();
                String email = rs.getString(3).trim();
                String password = rs.getString(4).trim();
                Date dOB = rs.getDate(5);
                String address = rs.getString(6);
                String PIN = rs.getString(7);
                String avatar = rs.getString(8);
                user = new User(userID, name, email, password, dOB, address, PIN, avatar);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "UserDAO getUserByIDMethod", ex);
        }
        return user;
    }

    public static ArrayList<User> get10LatestUsers() {
        ArrayList<User> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT TOP 10 * FROM [USERS] order by userID DESC ";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int userID = Integer.parseInt(rs.getString(1).trim());
                String name = rs.getString(2).trim();
                String email = rs.getString(3).trim();
                String password = rs.getString(4).trim();
                Date dOB = rs.getDate(5);
                String address = rs.getString(6);
                String PIN = rs.getString(7);
                String avatar = rs.getString(8);
                list.add(new User(userID, name, email, password, dOB, address, PIN, avatar));
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
     *
     * @param userID
     * @return: true if delete success | false if delete fail
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
            String sql = "delete comments from comments inner join members on comments.memberID = members.memberID where members.memberID = ?;"
                    + "delete from members where userID = ?;"
                    + "DELETE FROM USERS WHERE userID=?;";
            try {

                con = db.openConnection();
                statement = con.prepareStatement(sql);
                statement.setInt(1, userID);
                statement.setInt(2, userID);
                statement.setInt(3, userID);
                if (statement.executeUpdate() != 0) {
                    checkDelete = true;
                }
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return checkDelete;
    }

    /**
     * Update User
     *
     * @param user
     * @return: true if update success | false if update fail
     */
    public static boolean updateUser(User user) {
        boolean checkUpdate = false;

        String sql = "UPDATE USERS\n"
                + "SET name = ?, dOB = ?, address = ?, avatar = ? \n"
                + "WHERE userID = ?;";
        try {

            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setDate(2, user.getdOB());
            statement.setString(3, user.getAddress());
            statement.setString(4, user.getAvatar());
            statement.setInt(5, user.getUserID());
            checkUpdate = statement.execute();
            System.out.println("Done");
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("failed");
        }
        return checkUpdate;
    }

    public static boolean updatePW(int userID, String pw) {
        boolean checkUpdate = false;

        String sql = "UPDATE USERS\n"
                + "SET password = ? \n"
                + "WHERE userID = ?;";
        try {

            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, BCrypt.hashpw(pw, BCrypt.gensalt(12)));
            statement.setInt(2, userID);
            checkUpdate = statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return checkUpdate;
    }

    /**
     * Check Login
     *
     * @param email
     * @param password Didn't hashing password
     * @return true if email and password is correct | false if email and
     * password is incorrect
     */
    public static boolean checkLogin(String email, String password) {
        System.out.println("email: " + email);
        System.out.println("password: " + password);
        boolean checkLogin = false;
        String sql = "SELECT password FROM USERS WHERE email = ?;";
        try {

            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            rs = statement.executeQuery();
            if (rs.next()) {
                String hashed = rs.getString(1);
                if (BCrypt.checkpw(password, hashed.trim())) {
                    checkLogin = true;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("checkLogin: " + checkLogin);
        return checkLogin;
    }

    /**
     * Check if email is existed in the database
     *
     * @param email
     * @return true if email is existed | false if email is not existed
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
     *
     * @param email
     * @return User
     */
    public static User getUserByEmail(String email) {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        ResultSet rs = null;
        User user = null;
        String sql = "SELECT * FROM USERS WHERE email = ?;";
        try {

            Connection con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, email);
            rs = statement.executeQuery();
            if (rs.next()) {
                user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5),
                        rs.getString(6), rs.getString(7), rs.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    /**
     * Register User
     *
     * @param name
     * @param email
     * @param password
     * @return: true if register success | false if register fail
     */
    public static boolean registerUser(String name, String email, String password, Date dob, String address) {
        boolean checkRegister = false;
        String sql = "INSERT INTO USERS (name, email, password, dOB, address) VALUES (?, ?, ?, ?, ?);";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, BCrypt.hashpw(password, BCrypt.gensalt(12)));
            statement.setDate(4, dob);
            statement.setString(5, address);
            if (statement.executeUpdate() != 0) {
                checkRegister = true;
                System.out.println("add user");
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return checkRegister;
    }

    public static boolean setPIN(String email, String PIN) {

        String sql = "UPDATE USERS SET PIN= ? WHERE EMAIL = ? ;";
        try {
            Connection con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setString(1, PIN);
            statement.setString(2, email);
//            System.out.println("set pin -ing");
//            System.out.println(""+PIN + email);
            statement.executeUpdate();
            System.out.println("set pin -done");

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public static boolean deletePIN(String email, String PIN) {
        return setPIN(email, "");
    }

    /**
     * Get User List from members table
     *
     * @param Array<Member> members
     * @return List of User
     */
    public static ArrayList<User> getUserList(List<Member> members) {
        ArrayList<User> users = new ArrayList<>();
        for (Member member : members) {
            users.add(getUserByID(member.getUserID()));
        }
        return users;
    }

}
