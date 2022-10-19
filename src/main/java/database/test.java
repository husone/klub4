/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import io.github.cdimascio.dotenv.Dotenv;

import java.util.ArrayList;

import org.mindrot.jbcrypt.*;

import DAO.UserDAO;
import Email.Generate;
import entity.User;

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

        ArrayList<User> list = UserDAO.getUsers();
        for (User user : list) {
            System.out.println(">>>"+user);
        }
        System.out.println(UserDAO.checkLogin("qbao@gmail.com", "12345"));
    }
}
