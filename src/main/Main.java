package main;

import java.io.File;
import java.io.FileReader;
import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import front.PageDetail;
import system.Generalize;
import system.MapModel;
import util.DBConnect;
import util.Mail;

public class Main {
	public static void main(String []args) {
		 
        try {
        	Mail.sendMailTo("mamiharilalajacques@gmail.com", "mail", "test mail Java!");
        	System.out.println();
        } catch (Exception mex) {
            mex.printStackTrace();
        }
	}
}
	