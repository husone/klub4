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
    private int memberID;
    private int postID;
    private Date time;
    private String content;

    public Comment(int commentID, int memberID, int postID, Date time, String content) {
        this.commentID = commentID;
        this.memberID = memberID;
        this.postID = postID;
        this.time = time;
        this.content = content;
    }

    public Comment(int memberID, int postID, String content) {
        this.memberID = memberID;
        this.postID = postID;
        this.content = content;
    }
    
    public int getCommentID() {
        return commentID;
    }

    public void setCommentID(int commentID) {
        this.commentID = commentID;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
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

    //time to string
    public String getTimeString() {
        return time.toString();
    }
    
    
}
