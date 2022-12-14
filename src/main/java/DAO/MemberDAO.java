/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Club;
import entity.Member;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import database.ConnectDB;

/**
 *
 * @author sonsi
 */
public class MemberDAO {

    public static void addMember(Member member) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
        // java.sql.Date sqlDate = new java.sql.Date(member.getDayJoined().getTime());
        try {
            con = db.openConnection();
            String sql = "insert into members (userID, clubID)values (?,?) ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, member.getUserID());
            statement.setInt(2, member.getClubID());
            statement.execute();
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static void delete(int memberID, int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        PreparedStatement statement = null;
//        java.sql.Date sqlDate = new java.sql.Date(club.getDatedCreated().getTime());
        try {
            con = db.openConnection();
            String sql = "DELETE FROM MEMBERS where userID = ? AND clubID = ? ;";
            statement = con.prepareStatement(sql);
            statement.setInt(1, memberID);
            statement.setInt(2, clubID);
            statement.execute();
            con.close();
        } catch (Exception e) {
            return;
        }
    }

    public static List<Member> getAllMembers() {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        List<Member> members = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM MEMBERS";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Date date = rs.getDate(5);
                members.add(new Member(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), date));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return members;
    }

    public static List<Member> getMembersInClub(int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        List<Member> members = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM MEMBERS WHERE clubID = ? ";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                java.util.Date date = new java.util.Date(rs.getDate(5).getTime());
                members.add(new Member(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), date));
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return members;
    }

    //get clubs a member is in
    public static List<Club> getClubsOfMember(int userID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        List<Club> clubs = new ArrayList<>();
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT clubID FROM MEMBERS WHERE userID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            rs = statement.executeQuery();
            while (rs.next()) {
                clubs.add(ClubDAO.getClubByID(rs.getInt(1)));
                System.out.println(""+rs.getInt(1));
            }
            System.out.println(""+userID);
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return clubs;
    }

    public static boolean leaveClub(int userID, int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
//        List<Club> clubs = new ArrayList<>();
        System.out.println("" + userID + " " + clubID);
        PreparedStatement statement = null;
        try {
            con = db.openConnection();
            String sql = "DELETE FROM MEMBERS WHERE userID = ? and clubID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, clubID);

            statement.execute();
            con.close();
            return true;

        } catch (Exception e) {
            return false;
        }
    }

    //get member by userID and clubID
    public static Member getMember(int userID, int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        Member member = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM MEMBERS WHERE userID = ? AND clubID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                Date date = new Date(rs.getDate(5).getTime());
                member = new Member(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getInt(4), date);
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return null;
        }
        return member;
    }

    //get memberID by userID and clubID
    public static int getMemberID(int userID, int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        int memberID = 0;
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT memberID FROM MEMBERS WHERE userID = ? AND clubID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                memberID = rs.getInt(1);
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return 0;
        }
        return memberID;
    }

    //get userID by memberID
    public static int getUserID(int memberID) {
        ConnectDB db = ConnectDB.getInstance();
        Connection con = null;
        int userID = 0;
        PreparedStatement statement = null;
        ResultSet rs = null;
//        String check = null;
        try {
            con = db.openConnection();
            String sql = "SELECT userID FROM MEMBERS WHERE memberID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, memberID);
            rs = statement.executeQuery();
            while (rs.next()) {
                userID = rs.getInt(1);
            }
            rs.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            return 0;
        }
        return userID;
    }

    public static void main(String[] args) {
        List<Member> members = getAllMembers();
        for (Member member : members) {
            System.out.println(member.getUserID());
        }
    }

}
