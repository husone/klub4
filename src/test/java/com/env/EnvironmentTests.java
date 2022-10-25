package com.env;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import io.github.cdimascio.dotenv.Dotenv;

public class EnvironmentTests {
    
    @Test
    @DisplayName("Test environment")
    void testEnvironment() {
        Dotenv dotenv = Dotenv.load();
        String email_username = dotenv.get("EMAIL_USERNAME");
        assertEquals("sonsieusen1@gmail.com", email_username);
    }

}
