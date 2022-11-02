package com.database;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.sql.Date;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import DAO.UserDAO;


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
}