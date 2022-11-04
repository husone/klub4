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
import entity.Fund;

/**
 * @author quangpao
 * @version 1.0
 * @since 2022-11-01
 */

public class FundDAO {
    
    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = null;
    static PreparedStatement statement = null;
    static ResultSet rs = null;

    /**
     * Get all fund
     * @return: ArrayList<Fund>
     */
    public static ArrayList<Fund> getFunds() {
        ArrayList<Fund> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [FUNDS] order by fundID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int fundID = Integer.parseInt(rs.getString(1).trim());
                int clubID = Integer.parseInt(rs.getString(2).trim());
                String fundName = rs.getString(3).trim();
                Date dateCreated = rs.getDate(4);
                int amount = Integer.parseInt(rs.getString(5).trim());
                list.add(new Fund(fundID, clubID, fundName, dateCreated, amount));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FundDAO.class.getName()).log(Level.SEVERE, "FundDAO getFundsMethod", ex);
        }
        return list;
    }

    /**
     * Get fund by fundID
     * @param fundID
     * @return: Fund
     */
    public static Fund getFundByID(int fundID) {
        Fund fund = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [FUNDS] WHERE fundID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, fundID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int clubID = Integer.parseInt(rs.getString(2).trim());
                String fundName = rs.getString(3).trim();
                Date dateCreated = rs.getDate(4);
                int amount = Integer.parseInt(rs.getString(5).trim());
                fund = new Fund(fundID, clubID, fundName, dateCreated, amount);
            }
        } catch (SQLException ex) {
            Logger.getLogger(FundDAO.class.getName()).log(Level.SEVERE, "FundDAO getFundByIDMethod", ex);
        }
        return fund;
    }

    /**
     * Get fund by clubID
     * @param clubID
     * @return: ArrayList<Fund>
     */
    public static ArrayList<Fund> getFundByClubID(int clubID) {
        ArrayList<Fund> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [FUNDS] WHERE clubID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int fundID = Integer.parseInt(rs.getString(1).trim());
                String fundName = rs.getString(3).trim();
                Date dateCreated = rs.getDate(4);
                int amount = Integer.parseInt(rs.getString(5).trim());
                list.add(new Fund(fundID, clubID, fundName, dateCreated, amount));
            }
        } catch (SQLException ex) {
            Logger.getLogger(FundDAO.class.getName()).log(Level.SEVERE, "FundDAO getFundByClubIDMethod", ex);
        }
        return list;
    }

    /**
     * Create new fund
     * @param fund
     * @return: boolean
     */
    public static boolean createFund(Fund fund) {
        try {
            con = db.openConnection();
            String sql = "INSERT INTO [FUNDS] VALUES(?, ?, ?, ?)";
            statement = con.prepareStatement(sql);
            statement.setInt(1, fund.getClubID());
            statement.setString(2, fund.getFundName());
            statement.setDate(3, fund.getDateCreated());
            statement.setInt(4, fund.getAmount());
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(FundDAO.class.getName()).log(Level.SEVERE, "FundDAO createFundMethod", ex);
        }
        return false;
    }

    /**
     * Update fund
     * @param fund
     * @return: boolean
     */
    public static boolean updateFund(Fund fund) {
        try {
            con = db.openConnection();
            String sql = "UPDATE [FUNDS] SET clubID = ?, fundName = ?, dateCreated = ?, amount = ? WHERE fundID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, fund.getClubID());
            statement.setString(2, fund.getFundName());
            statement.setDate(3, fund.getDateCreated());
            statement.setInt(4, fund.getAmount());
            statement.setInt(5, fund.getFundId());
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(FundDAO.class.getName()).log(Level.SEVERE, "FundDAO updateFundMethod", ex);
        }
        return false;
    }

    /**
     * Delete fund
     * @param fundID
     * @return: boolean
     */
    public static boolean deleteFund(int fundID) {
        try {
            con = db.openConnection();
            String sql = "DELETE FROM [FUNDS] WHERE fundID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, fundID);
            statement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(FundDAO.class.getName()).log(Level.SEVERE, "FundDAO deleteFundMethod", ex);
        }
        return false;
    }
}
