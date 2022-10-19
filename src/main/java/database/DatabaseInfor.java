/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import io.github.cdimascio.dotenv.Dotenv;

/**
 *
 * @author sonsi
 */
public interface DatabaseInfor {

    Dotenv dotenv = Dotenv.load();
    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String url = ("jdbc:sqlserver://127.0.0.1:1433;databaseName=ClubDB;");
    public static String user = ("sa");
    public static String pass = ("12345");
}
