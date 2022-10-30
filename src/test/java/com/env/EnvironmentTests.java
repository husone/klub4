package com.env;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import database.readENV;


public class EnvironmentTests {
    
    @Test
    @DisplayName("Test environment")
    void testEnvironment() {
        String email_username = readENV.get("EMAIL_USERNAME");
        assertEquals("sonsieusen1@gmail.com", email_username);
    }

}
