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
    public static String url = dotenv.get("DTBURL");
    public static String user = dotenv.get("DTBUSERNAME");
    public static String pass = dotenv.get("DTBPASSWORD");
}
