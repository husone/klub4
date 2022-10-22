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
        String password = "123456";
        System.out.println(""+password);
        System.out.println(BCrypt.hashpw(password, BCrypt.gensalt()));
        System.out.println(BCrypt.hashpw("1567723", BCrypt.gensalt()));
        System.out.println(BCrypt.hashpw(password, BCrypt.gensalt()));
        System.out.println(BCrypt.hashpw(password, BCrypt.gensalt()));
        System.out.println(BCrypt.hashpw(password, BCrypt.gensalt()));
    }
}
