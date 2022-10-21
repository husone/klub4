package com.database;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mindrot.jbcrypt.BCrypt;


public class DatabaseTests {
    
    @Test
    @DisplayName("Test database connection")
    void testDatabaseConnection() {
    }

    @Test
    @DisplayName("Test BCrypt")
    void testBCrypt() {
        String password = "1292131232";
        String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
        assertNotEquals(password, hash);
        assertEquals(true, BCrypt.checkpw(password, hash));
        
    }

}
