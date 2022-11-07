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
import entity.ContributeFund;

/**
 * @author quangpao
 * @version 1.0
 * @since 2022-11-01
 */

public class ContributeFundDAO {
    
    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = null;
    static PreparedStatement statement = null;
    static ResultSet rs = null;

    /**
     * Get all contribute fund
     * @return: ArrayList<ContributeFund>
     */
    public static ArrayList<ContributeFund> getContributeFunds() {
        ArrayList<ContributeFund> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM contributefunds order by fundID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int fundID = Integer.parseInt(rs.getString(1).trim());
                int memberID = Integer.parseInt(rs.getString(2).trim());
                Date time = rs.getDate(3);
                list.add(new ContributeFund(fundID, memberID, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO getContributeFundsMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO getContributeFundsMethod", ex);
        }
        return list;
    }

    /**
     * Get contribute fund by fundID
     * @param fundID
     * @return: ArrayList<ContributeFund>
     */
    public static ArrayList<ContributeFund> getContributeFundByFundID(int fundID) {
        ArrayList<ContributeFund> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM contributefunds WHERE fundID = ? order by fundID";
            statement = con.prepareStatement(sql);
            statement.setInt(1, fundID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int memberID = Integer.parseInt(rs.getString(2).trim());
                Date time = rs.getDate(3);
                list.add(new ContributeFund(fundID, memberID, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO getContributeFundByFundIDMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO getContributeFundByFundIDMethod", ex);
        }
        return list;
    }

    /**
     * Get contribute fund by memberID
     * @param memberID
     * @return: ArrayList<ContributeFund>
     */
    public static ArrayList<ContributeFund> getContributeFundByMemberID(int memberID) {
        ArrayList<ContributeFund> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM contributefunds WHERE memberID = ? order by fundID";
            statement = con.prepareStatement(sql);
            statement.setInt(1, memberID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int fundID = Integer.parseInt(rs.getString(1).trim());
                Date time = rs.getDate(3);
                list.add(new ContributeFund(fundID, memberID, time));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO getContributeFundByMemberIDMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO getContributeFundByMemberIDMethod", ex);
        }
        return list;
    }

    /**
     * Contribute fund
     * @param fundID
     * @param memberID
     * @return: boolean
     */
    public static boolean contributeFund(int fundID, int memberID) {
        try {
            con = db.openConnection();
            String sql = "INSERT INTO contributefunds (memberID, fundID, time) values (? , ?, ?)";
            statement = con.prepareStatement(sql);
            statement.setInt(1, memberID);
            statement.setInt(2, fundID);
            statement.setDate(3, new Date(System.currentTimeMillis()));
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO contributeFundMethod", ex);
        }
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO contributeFundMethod", ex);
        }
        return false;
    }
    
    public static boolean isContributeFund(int fundID, int memberID) {
        try {
            con = db.openConnection();
            String sql = "SELECT *  FROM CONTRIBUTEFUNDS WHERE fundID = ? and memberID = ? ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, fundID);
            statement.setInt(2, memberID);
            System.out.println(""+fundID+ " "+ memberID);
            rs = statement.executeQuery();
            while (rs.next()) {
                return true;
            }
            return false;
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO contributeFundMethod", ex);
        }
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ContributeFundDAO.class.getName()).log(Level.SEVERE, "ContributeFundDAO contributeFundMethod", ex);
        }
        return false;
    }
}
