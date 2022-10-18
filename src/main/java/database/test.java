/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import io.github.cdimascio.dotenv.Dotenv;
import org.mindrot.jbcrypt.*;
import Email.Generate;

/**
 *
 * @author sonsi
 */
public class test {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Dotenv dotenv = Dotenv.load();
        String password = dotenv.get("test");
        System.out.println(""+password);
        String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
        System.out.println(BCrypt.hashpw(password, BCrypt.gensalt(12)));
        System.out.println("BCrypt hash: " + hash);
        System.out.println(Generate.OTP(6));
    }
}
