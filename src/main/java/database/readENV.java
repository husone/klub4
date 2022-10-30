package database;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Scanner;

public class readENV {
    public static String get(String key) {
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
        } catch (FileNotFoundException e) {
            System.out.println("An error occurred.");
            e.printStackTrace();
        }
        return "";
    }

    // public static void main(String[] args) {
    //     get("DTBURL");
    // }

}

