/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectDB implements DatabaseInfor {

    private static ConnectDB instance;

    public Connection openConnection() {
        Connection con = null;
        try {
            Class.forName(driverName);
            con = DriverManager.getConnection(url, user, pass);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(ConnectDB.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
        return con;
    }

    // get instance of database only one time
    public static ConnectDB getInstance() {
        if (instance == null) {
            instance = new ConnectDB();
        }
        return instance;
    }
}
