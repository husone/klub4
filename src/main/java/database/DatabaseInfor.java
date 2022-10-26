/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;


/**
 *
 * @author sonsi
 */
public interface DatabaseInfor {


    public static String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public static String url = readENV.get("DTBURL");
    public static String user = readENV.get("DTBUSERNAME");
    public static String pass = readENV.get("DTBPASSWORD");
}
