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


    public String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public String url = "jdbc:sqlserver://quangpao.database.windows.net:1433;database=ClubDB;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
    public String user = "CloudSA8b57ce08";
    public String pass = "123456Aa";
}
