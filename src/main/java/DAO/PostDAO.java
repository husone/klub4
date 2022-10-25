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
 * @version 1.2
 */

public class PostDAO {
    
    static ConnectDB db = ConnectDB.getInstance();
    static Connection con = db.openConnection();
    static PreparedStatement statement = null;
    static ResultSet rs = null;

    /**
     * Get all post
     * @return: ArrayList<Post>
     */
    public static ArrayList<Post> getPosts() {
        ArrayList<Post> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] order by postID";
            statement = con.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postID = Integer.parseInt(rs.getString(1).trim());
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(4);
                int clubID = Integer.parseInt(rs.getString(5).trim());
                int userID = Integer.parseInt(rs.getString(6).trim());
                String image = rs.getString(7);
                list.add(new Post(postID, title, content, time, clubID, userID, image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
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
        Post post = null;
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] WHERE postID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, postID);
            rs = statement.executeQuery();
            while (rs.next()) {
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(4);
                int clubID = Integer.parseInt(rs.getString(5).trim());
                int userID = Integer.parseInt(rs.getString(6).trim());
                String image = rs.getString(7);
                post = new Post(postID, title, content, time, clubID, userID, image);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostByIDMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
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
        ArrayList<Post> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] WHERE clubID = ? order by postID";
            statement = con.prepareStatement(sql);
            statement.setInt(1, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postID = Integer.parseInt(rs.getString(1).trim());
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(4);
                int userID = Integer.parseInt(rs.getString(6).trim());
                String image = rs.getString(7);
                list.add(new Post(postID, title, content, time, clubID, userID, image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByClubIDMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByClubIDMethod", ex);
        }
        return list;
    }

    /**
     * Get post by userID
     * @param userID
     * @return: ArrayList<Post>
     */
    public static ArrayList<Post> getPostsByUserID(int userID) {
        ArrayList<Post> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] WHERE userID = ? order by postID";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postID = Integer.parseInt(rs.getString(1).trim());
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(4);
                int clubID = Integer.parseInt(rs.getString(5).trim());
                String image = rs.getString(7);
                list.add(new Post(postID, title, content, time, clubID, userID, image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByUserIDMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByUserIDMethod", ex);
        }
        return list;
    }

    /**
     * Get post by userID and clubID
     * @param userID
     * @param clubID
     * @return: ArrayList<Post>
     */
    public static ArrayList<Post> getPostsByUserIDAndClubID(int userID, int clubID) {
        ArrayList<Post> list = new ArrayList<>();
        try {
            con = db.openConnection();
            String sql = "SELECT * FROM [POSTS] WHERE userID = ? AND clubID = ? order by postID";
            statement = con.prepareStatement(sql);
            statement.setInt(1, userID);
            statement.setInt(2, clubID);
            rs = statement.executeQuery();
            while (rs.next()) {
                int postID = Integer.parseInt(rs.getString(1).trim());
                String title = rs.getString(2);
                String content = rs.getString(3).trim();
                Date time = rs.getDate(4);
                String image = rs.getString(7);
                list.add(new Post(postID, title, content, time, clubID, userID, image));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByUserIDAndClubIDMethod", ex);
        }
        try {
            rs.close();
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO getPostsByUserIDAndClubIDMethod", ex);
        }
        return list;
    }

    /**
     * Create new post
     * @return: boolean
     */
    public static boolean createPost(Post post) {
        try {
            con = db.openConnection();
            String sql = "INSERT INTO [POSTS] VALUES(?,?,?,?,?,?,?)";
            statement = con.prepareStatement(sql);
            statement.setInt(1, post.getPostID());
            statement.setString(2, post.getTitle());
            statement.setString(3, post.getContent());
            statement.setDate(4, post.getTime());
            statement.setInt(5, post.getClubID());
            statement.setInt(6, post.getUserID());
            statement.setString(7, post.getImage());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO createPostMethod", ex);
            return false;
        }
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO createPostMethod", ex);
        }
        return true;
    }

    /**
     * Update post
     * @return: boolean
     */
    public static boolean updatePost(Post post) {
        try {
            con = db.openConnection();
            String sql = "UPDATE [POSTS] SET title = ?, content = ?, time = ?, clubID = ?, userID = ?, image = ? WHERE postID = ?";
            statement = con.prepareStatement(sql);
            statement.setString(1, post.getTitle());
            statement.setString(2, post.getContent());
            statement.setDate(3, post.getTime());
            statement.setInt(4, post.getClubID());
            statement.setInt(5, post.getUserID());
            statement.setString(6, post.getImage());
            statement.setInt(7, post.getPostID());
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO updatePostMethod", ex);
            return false;
        }
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO updatePostMethod", ex);
        }
        return true;
    }

    /**
     * Delete post
     * @return: boolean
     */
    public static boolean deletePost(int postID) {
        try {
            con = db.openConnection();
            String sql = "DELETE FROM [POSTS] WHERE postID = ?";
            statement = con.prepareStatement(sql);
            statement.setInt(1, postID);
            statement.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO deletePostMethod", ex);
            return false;
        }
        try {
            statement.close();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, "PostDAO deletePostMethod", ex);
        }
        return true;
    }



}
