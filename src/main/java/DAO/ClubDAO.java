/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Club;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.ConnectDB;

/**
 *
 * @author sonsi
 */
public class ClubDAO {

    public static void createClub(Club club) throws Exception {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "insert into clubs values (?,?,?,?,?,?,?) ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, club.getClubID());
            statement.setString(2, club.getClubName());
            statement.setInt(3, club.getManagerID());
            statement.setDate(4, sqlDate);
            statement.setString(5, club.getLocation());
            statement.setString(6, club.getDescription());
            statement.setString(7, club.getLogo());
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void delete(Club club) throws Exception {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
//        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "delete clubs where clubID = ? ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, club.getClubID());
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void updateClub(Club club) throws Exception {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
//        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "UPDATE Clubs SET "
                    + "clubName = ?,"
                    + "location = ?,"
                    + "description = ?,"
                    + "logo = ?,"
                    + "where clubID = ?;";
            statement = con.prepareStatement(sql);
            statement.setString(1, club.getClubName());
//            statement.setInt(2, club.getManagerID());
            statement.setString(2, club.getLocation());
            statement.setString(3, club.getDescription());
            statement.setString(4, club.getLogo());
            statement.setInt(5, club.getClubID());
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void updateManagerClub(Club club) throws Exception {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
//        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "UPDATE Clubs SET "
                    + "managerID = ?"
                    + "where clubID = ?;";
            statement = con.prepareStatement(sql);
            statement.setInt(1, club.getManagerID());
            statement.setInt(2, club.getClubID());
            con.close();
        } catch (Exception e) {
            return;
        }
    }
    
    public static List<Club> getAllClubs() throws Exception {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        List<Club> clubs = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM CLUBS";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                java.util.Date  date = new java.util.Date(rs.getDate(4).getTime());
                clubs.add(new Club(rs.getInt(1),rs.getString(2),rs.getInt(3),date,rs.getString(5),rs.getString(6),rs.getString(7)));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return clubs;
    }
}
