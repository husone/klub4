/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Email;

import java.util.Random;
// import Email.SendEmailTLS;

/**
 *
 * @author sonsi
 */
public class Generate {

    public static String OTP(int len) {

        // Using numeric values
        String numbers = "0123456789";

        // Using random method
        Random rndm_method = new Random();

        char[] otp = new char[len];

        for (int i = 0; i < len; i++) {
            // Use of charAt() method : to get character value
            // Use of nextInt() as it is scanning the value as int
            otp[i] = numbers.charAt(rndm_method.nextInt(numbers.length()));
        }
        return String.valueOf(otp);
    }

    public static void main(String[] args) {
        SendEmailTLS.sendEmailResetPassword("sonsieusen147@gmail.com", OTP(6));
    }
}
