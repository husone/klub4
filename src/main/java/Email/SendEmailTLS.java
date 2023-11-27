/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Email;
/**
 *
 * @author sonsi
 */
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import database.readENV;

import java.util.Properties;

public class SendEmailTLS {

    static Session loginGetSession(){
        final String username = readENV.EMAIL;
        final String password = readENV.EMAIL_PASSWORD;

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }    
        });
        return session;
    } 

    public static void sendEmailResetPassword(String email, String OTP){
        Session session = loginGetSession();
        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress("Klub4 <klub4@gmail.com>"));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(email)
            );
            message.setSubject("RESET YOUR PASSWORD");
            String content = ""
            + "<body marginheight=\"0\" topmargin=\"0\" marginwidth=\"0\" style=\"margin: 0px; background-color: #f2f3f8;\" leftmargin=\"0\">"
            + "    <!--100% body table-->"
            + "    <table cellspacing=\"0\" border=\"0\" cellpadding=\"0\" width=\"100%\" bgcolor=\"#f2f3f8\""
            + "        style=\"@import url(https://fonts.googleapis.com/css?family=Rubik:300,400,500,700|Open+Sans:300,400,600,700); font-family: 'Open Sans', sans-serif;\">"
            + "        <tr>"
            + "            <td>"
            + "                <table style=\"background-color: #f2f3f8; max-width:670px;  margin:0 auto;\" width=\"100%\" border=\"0\""
            + "                    align=\"center\" cellpadding=\"0\" cellspacing=\"0\">"
            + "                    <tr>"
            + "                        <td style=\"height:40px;\">&nbsp;</td>" 
            + "                    </tr>"
            + "                    <tr>"
            + "                        <td style=\"text-align:center;\">"
            + "                            <a href=\"/\" title=\"logo\" target=\"_blank\">"
            + "                                <img width=\"100\" src=\"https://upcdn.io/W142hJk/raw/demo/VxBhBwz.png\" title=\"logo\" alt=\"logo\">"
            + "                            </a>"
            + "                        </td>"
            + "                    </tr>"
            + "                    <tr>"
            + "                        <td style=\"height:20px;\">&nbsp;</td>"
            + "                    </tr>"
            + "                    <tr>"
            + "                        <td>"
            + "                            <table width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\""
            + "                                style=\"max-width:670px;background:#fff; border-radius:3px; text-align:center;-webkit-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);-moz-box-shadow:0 6px 18px 0 rgba(0,0,0,.06);box-shadow:0 6px 18px 0 rgba(0,0,0,.06);\">"
            + "                                <tr>"
            + "                                    <td style=\"height:40px;\">&nbsp;</td>"
            + "                                </tr>"
            + "                                <tr>"
            + "                                    <td style=\"padding:0 35px;\">"
            + "                                        <h1"
            + "                                            style=\"color:#1e1e2d; font-weight:500; margin:0;font-size:32px;font-family:'Rubik',sans-serif;\">"
            + "                                            You have"
            + "                                            requested to reset your password</h1>"
            + "                                        <span"
            + "                                            style=\"display:inline-block; vertical-align:middle; margin:29px 0 26px; border-bottom:1px solid #cecece; width:100px;\"></span>"
            + "                                        <p style=\"color:#455056; font-size:15px;line-height:24px; margin:0;\">"
            + "                                            We received a request to reset the password for the Klub4 account associated"
            + "                                            with this e-mail address. Please ignore this email if you have not requested. Your OTP here:"
            + "                                        </p>"
            + "                                        <a href=\"javascript:void(0);\""
            + "                                            style=\"background:#20e277;text-decoration:none !important; font-weight:500; margin-top:35px; color:#fff;text-transform:uppercase; font-size:23px;padding:10px 24px;display:inline-block;border-radius:50px;\">"
            + "                                            " + OTP + "</a>"
            + "                                    </td>"
            + "                                </tr>"
            + "                                <tr>"
            + "                                    <td style=\"height:40px;\">&nbsp;</td>"
            + "                                </tr>"
            + "                            </table>"
            + "                        </td>"
            + "                    <tr>"
            + "                        <td style=\"height:20px;\">&nbsp;</td>"
            + "                    </tr>"
            + "                    <tr>"
            + "                        <td style=\"text-align:center;\">"
            + "                            <p"
            + "                                style=\"font-size:14px; color:rgba(69, 80, 86, 0.7411764705882353); line-height:18px; margin:0 0 0;\">"
            + "                                &copy; <strong>www.klub4.com</strong></p>"
            + "                        </td>"
            + "                    </tr>"
            + "                    <tr>"
            + "                        <td style=\"height:80px;\">&nbsp;</td>"
            + "                    </tr>"
            + "                </table>"
            + "            </td>"
            + "        </tr>"
            + "    </table>"
            + "    <!--/100% body table-->"
            + "</body>";
            message.setContent(content,"text/html");

//            for (int i = 0; i < 100; i++) {
            Transport.send(message);

//            }
            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

        public static void main(String[] args) {
        SendEmailTLS.sendEmailResetPassword("huynhson1203@gmail.com", Generate.OTP(6));
    }

}
