/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import entity.Comment;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import database.ConnectDB;

/**
 *
 * @author kin
 */
public class CommentDAO {
    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = null;
    static PreparedStatement statement = null;
    static ResultSet rs = null;

    public static ArrayList<Comment> getComment() {
        ArrayList<Comment> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [COMMENTS] order by commentID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int commentID = Integer.parseInt(rs.getString(1).trim());
                int userID = Integer.parseInt(rs.getString(2).trim());
                int postID = Integer.parseInt(rs.getString(3).trim());
                Date time = rs.getDate(4);
                String content = rs.getString(5);
                list.add(new Comment(commentID, userID, postID, time, content));
            }

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

    public static void addComment(Comment cmt) {
        // java.sql.Date timeCmt = new java.sql.Date(cmt.getTime().getTime());
        String sql = "INSERT INTO [COMMENTS] (memberID, postID, Time, content)\n" +
                "VALUES (?,?,?,?);";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setInt(1, cmt.getMemberID());
            statement.setInt(2, cmt.getPostID());
            statement.setDate(3, new Date(System.currentTimeMillis()));
            statement.setString(4, cmt.getContent());
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                statement.close();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static boolean deleteComment(int commentID) {
        ArrayList<Comment> list = getComment();
        boolean checkCmt = false;
        // check If we have that ID;
        for (Comment comment : list) {
            if (comment.getCommentID() == commentID) {
                checkCmt = true;
            }
        }
        if (checkCmt) {
            String sql = "DELETE FROM COMMENTS WHERE commentID=?;";
            try {
                con = db.openConnection();
                statement = con.prepareStatement(sql);
                statement.setInt(1, commentID);
                statement.execute();
            } catch (SQLException ex) {
                Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
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

    public static void updateComment(Comment cmt) {
        java.sql.Date timeCmt = new java.sql.Date(cmt.getTime().getTime());
        String sql = "UPDATE COMMENTS\n" + "SET time=?, content=?\n" +
                "WHERE commentID=?;";
        try {
            con = db.openConnection();
            statement = con.prepareStatement(sql);
            statement.setDate(1, timeCmt);
            statement.setString(2, cmt.getContent());
            statement.setInt(3, cmt.getCommentID());
            statement.execute();
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ArrayList<Comment> getPostComments(int postID) {
        ArrayList<Comment> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [COMMENTS] WHERE postID=" + postID + " order by commentID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int commentID = Integer.parseInt(rs.getString(1).trim());
                int userID = Integer.parseInt(rs.getString(2).trim());
                // int postID = Integer.parseInt(rs.getString(3).trim());
                Date time = rs.getDate(4);
                String content = rs.getString(5);
                list.add(new Comment(commentID, userID, postID, time, content));
            }
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


    public static ArrayList<Comment> getPost3Comments(int postID) {
        ArrayList<Comment> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT TOP 3 * FROM [COMMENTS] WHERE postID=" + postID + " order by commentID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int commentID = Integer.parseInt(rs.getString(1).trim());
                int userID = Integer.parseInt(rs.getString(2).trim());
                // int postID = Integer.parseInt(rs.getString(3).trim());
                Date time = rs.getDate(4);
                String content = rs.getString(5);
                list.add(new Comment(commentID, userID, postID, time, content));
            }
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

    public static ArrayList<Comment> getPostNext3Comments(int postID, int next) {
        ArrayList<Comment> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [COMMENTS] WHERE postID=" + postID + " order by commentID OFFSET "+next+" ROWS FETCH NEXT 3 ROWS ONLY";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int commentID = Integer.parseInt(rs.getString(1).trim());
                int userID = Integer.parseInt(rs.getString(2).trim());
                // int postID = Integer.parseInt(rs.getString(3).trim());
                Date time = rs.getDate(4);
                String content = rs.getString(5);
                list.add(new Comment(commentID, userID, postID, time, content));
            }
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

}