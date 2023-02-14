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
import system.Utilisateur;
import util.DBConnect;
import util.Mail;

public class Main {
	public static void main(String []args) {
		 
        try {
        	System.out.println(Mail.sentMailSubscribe("mamiharilalajacques@gmail.com","Mamiharilala Jacques", "doshopa/confirmation", "+261 33 00 908 01"));
        	//Utilisateur.validEmail("da4b9237bacccdf19c0760cab7aec4a8359010b0");
        	System.out.println("terminated");
        } catch (Exception mex) {
            mex.printStackTrace();
        }
	}
}
	