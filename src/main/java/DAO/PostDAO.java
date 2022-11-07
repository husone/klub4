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
import entity.Post;

/**
 *
 * @author quangpao
 * @version 1.3
 */

public class PostDAO {

    /**
     * Get all post
     * @return: ArrayList<Post>
     */
    public static ArrayList<Post> getPosts() {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Post> list = new ArrayList<>();
        try {
            Connection con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] order by postID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postID = Integer.parseInt(rs.getString(1).trim());
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(5);
                int clubID = Integer.parseInt(rs.getString(4).trim());
                String image = rs.getString(6);
                list.add(new Post(postID, title, content, time, clubID, image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsMethod", ex);
        }
        return list;
    }

    /**
     * Get post by postID
     * @param postID
     * @return: Post
     */
    public static Post getPostByID(int postID) {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        ResultSet rs = null;
        Post post = null;
        try {
            Connection con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] WHERE postID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, postID);
            rs = statement.executeQuery();
            while (rs.next()) {
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(5);
                int clubID = Integer.parseInt(rs.getString(4).trim());
                String image = rs.getString(6);
                post = new Post(postID, title, content, time, clubID, image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostByIDMethod", ex);
        }
        return post;
    }

    /**
     * Get post by clubID
     * @param clubID
     * @return: ArrayList<Post>
     */
    public static ArrayList<Post> getPostsByClubID(int clubID) {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        ResultSet rs = null;
        ArrayList<Post> list = new ArrayList<>();
        try {
            Connection con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] WHERE clubID = ? order by postID";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postID = Integer.parseInt(rs.getString(1).trim());
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(5);
                String image = rs.getString(6);
                list.add(new Post(postID, title, content, time, clubID, image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByClubIDMethod", ex);
        }
        return list;
    }

    /**
     * Create new post
     * @return: boolean
     */
    public static boolean createPost(Post post) {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        try {
            Connection con = db.openConnection();
            String sql = "INSERT INTO [POSTS] VALUES(?,?,?,?,?)";
            statement = con.prepareStatement(sql);
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContent());
            statement.setDate(4, post.getTime());
            statement.setInt(3, post.getClubID());
            statement.setString(5, post.getImage());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO createPostMethod", ex);
            return false;
        }
        return true;
    }

    /**
     * Update post
     * @return: boolean
     */
    public static boolean updatePost(Post post) {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        try {
            Connection con = db.openConnection();
            String sql = "UPDATE [POSTS] SET title = ?, content = ?, time = ?, image = ? WHERE postID = ?";
            statement = con.prepareStatement(sql);
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContent());
            statement.setDate(3, post.getTime());
            statement.setString(4, post.getImage());
            statement.setInt(5, post.getPostID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO updatePostMethod", ex);
            return false;
        }
        return true;
    }

    /**
     * Delete post
     * @return: boolean
     */
    public static boolean deletePost(int postID) {
        ConnectDB db = ConnectDB.getInstance();
        PreparedStatement statement = null;
        try {
            Connection con = db.openConnection();
            String sql = "DELETE FROM [POSTS] WHERE postID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, postID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO deletePostMethod", ex);
            return false;
        }
        return true;
    }



}
