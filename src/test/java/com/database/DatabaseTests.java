package com.database;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import DAO.ClubDAO;
import DAO.MemberDAO;
import DAO.UserDAO;
import entity.Club;
import entity.Member;
import entity.User;


public class DatabaseTests {
    
    @Test
    @DisplayName("Test database connection")
    void testDatabaseConnection() {

        assertEquals(true, UserDAO.checkRegister("database@gmail.com"));

    }

    @Test
    @DisplayName("Insert user")
    void testInsertUser() {
        String password = "1292131232";
        assertEquals(true, UserDAO.registerUser("Thử Database", "database@gmail.com", password, Date.valueOf("1999-12-12"), "Hà Nội"));
    }
    @Test
    @DisplayName("Test BCrypt")
    void testBCrypt() {
        String password = "1292131232";
        assertEquals(true, UserDAO.checkLogin("database@gmail.com", password));
        
    }

    @Test
    @DisplayName("Delete user")
    void testDeleteUser() {
        assertEquals(true, UserDAO.deleteUser(
                UserDAO.getUserByEmail("database@gmail.com").getUserID()));

    }

    @Test
    @DisplayName("Insert user")
    void InsertUser() {
        String password = "123456";
        if (!UserDAO.checkRegister("quangbao@gmail.com")) {
            assertEquals(true, UserDAO.registerUser("Đặng Đỗ Quang Bảo", "quangbao@gmail.com", password, Date.valueOf("2022-01-09"), "Đà Nẵng"));
        }
        if (!UserDAO.checkRegister("member1@gmail.com")) {
            assertEquals(true, UserDAO.registerUser("Member A", "member1@gmail.com", password, Date.valueOf("2022-09-02"), "Đà Nẵng"));
        }
        
        if (!UserDAO.checkRegister("member2@gmail.com")) {
        assertEquals(true, UserDAO.registerUser("Member B", "member2@gmail.com", password, Date.valueOf("2022-09-03"), "Đà Nẵng"));
        }
    }


    @Test
    @DisplayName("quangbao Create Club")
    void createClub() {
        User u = UserDAO.getUserByEmail("quangbao@gmail.com");
        System.out.println(ClubDAO.getClubIDByUserID(u.getUserID()));
        if(ClubDAO.getClubIDByUserID(u.getUserID()) == -1) {
            Date date = new Date(System.currentTimeMillis());
            Club c = new Club("Club A", "Club Test", u.getUserID(), date, "Club này để test", null); 
            ClubDAO.createClub(c);
        }
    }

    @Test
    @DisplayName("test join club")
    void testJoinClub() {
        User u = UserDAO.getUserByEmail("member1@gmail.com");
        User u2 = UserDAO.getUserByEmail("member2@gmail.com");
        User manager = UserDAO.getUserByEmail("quangbao@gmail.com");
        int clubID = ClubDAO.getClubIDByUserID(manager.getUserID());

        int size = MemberDAO.getMembersInClub(clubID).size();

        Member m1 = new Member(u.getUserID(), clubID, 0,  new Date(System.currentTimeMillis()));
        Member m2 = new Member(u2.getUserID(), clubID, 0,  new Date(System.currentTimeMillis()));
        if (clubID != -1 && size == 0) {
            MemberDAO.addMember(m1);
            MemberDAO.addMember(m2);
        }
    }
}