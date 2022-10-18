/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author kin
 */
public class Comment {
    private int commentID;
    private int userID;
    private int postID;
    private Date time;
    private String content;

    public Comment(int commentID, int userID, int postID, Date time, String content) {
        this.commentID = commentID;
        this.userID = userID;
        this.postID = postID;
        this.time = time;
        this.content = content;
    }

    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Comment{" + "commentID=" + commentID + ", userID=" + userID + ", postID=" + postID + ", time=" + time + ", content=" + content + '}';
    }
    
    
}
