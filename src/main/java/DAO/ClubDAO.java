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

    public static void createClub(Club club) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            String sql = "insert into clubs (clubId, clubName, clubType, managerID, description, logo) values (?,?,?,?,?,?,?) ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, club.getClubID());
            statement.setString(2, club.getClubName());
            statement.setString(3, club.getClubType());
            statement.setInt(4, club.getManagerID());
            statement.setString(5, club.getDescription());
            statement.setString(6, club.getLogo());
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void deleteClub(int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
//        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "delete clubs where clubID = ? ;\n"
                    + "delete posts where clubID = ? ;\n"
                    + "delete members where clubID = ? ;";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            statement.setInt(2, clubID);
            statement.setInt(3, clubID);
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void updateClub(Club club) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
//        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "UPDATE Clubs SET "
                    + "clubName = ?,"
                    + "description = ?,"
                    + "logo = ?,"
                    + "where clubID = ?;";
            statement = con.prepareStatement(sql);
            statement.setString(1, club.getClubName());
//            statement.setInt(2, club.getManagerID());
            statement.setString(2, club.getDescription());
            statement.setString(3, club.getLogo());
            statement.setInt(4, club.getClubID());
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void updateManagerClub(Club club) {
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

    public static List<Club> getAllClubs() {
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
                java.util.Date date = new java.util.Date(rs.getDate(5).getTime());
                clubs.add(new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), date, rs.getString(6), rs.getString(7)));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return clubs;
    }

    public static List<Club> get10LatestClubs() {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        List<Club> clubs = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            con = db.openConnection();
            String sql = "SELECT TOP 10 * FROM CLUBS order by DateCreated DESC";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                java.util.Date date = new java.util.Date(rs.getDate(5).getTime());
                clubs.add(new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), date, rs.getString(6), rs.getString(7)));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        if (clubs.isEmpty()) {
            System.out.println("emtpy");
        } else {
            System.out.println("not");
        }
        for (Club club : clubs) {
            System.out.println("" + club.toString());
        }
        return clubs;
    }

    public static Club getClubByID(int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        Club club = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM CLUBS";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                java.util.Date date = new java.util.Date(rs.getDate(5).getTime());
                club = new Club(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), date, rs.getString(6), rs.getString(7));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return club;
    }
}
