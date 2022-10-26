/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Scanner;

/**
 *
 * @author sonsi
 */
public interface DatabaseInfor {


    public String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    public String url = get("DTBURL");
    public String user = get("DTBUSERNAME");
    public String pass = get("DTBPASSWORD");

    private static String get(String key) {
        try {
            File myObj = new File(".env");
            Scanner myReader = new Scanner(myObj);
            HashMap<String, String> env = new HashMap<String, String>();
            while (myReader.hasNextLine()) {
                String data = myReader.nextLine();
                data = data.replace(" ", "");
                String[] arr = data.split("=\"");
                env.put(arr[0], arr[1].replace("\"", ""));
                // System.out.println(arr[1].replace("\"", ""));
            }
            myReader.close();
            return env.get(key);
        } catch (FileNotFoundException e ) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        return "";
    }
}
