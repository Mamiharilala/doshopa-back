package util;

import java.io.File;
import java.io.FileReader;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class Mail {
	String recipient;
	String sender;
	String systemMail;
	String systemPassword;

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSystemMail() {
		return systemMail;
	}

	public void setSystemMail(String systemMail) {
		this.systemMail = systemMail;
	}

	public String getSystemPassword() {
		return systemPassword;
	}

	public void setSystemPassword(String systemPassword) {
		this.systemPassword = systemPassword;
	}

	public static boolean sendMailTo(String recipient, String subject, String detail) {
		boolean sentMessage = false;
		try {
			FileReader reader = new FileReader(new File(".").getAbsolutePath()+"//config//mail.config.txt");
			Properties p = new Properties();
			p.load(reader);
			
			// Assuming you are sending email from through gmails smtp
			// Get system properties
			Properties properties = System.getProperties();
			// Setup mail server
			properties.put("mail.smtp.host", p.getProperty("host"));
			properties.put("mail.smtp.port", p.getProperty("mail.smtp.port"));
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.auth", "true");
			// Get the Session object.// and pass username and password
			Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(p.getProperty("systemMail"), p.getProperty("systemPassword"));
				}

			});
			// Used to debug SMTP issues
			session.setDebug(true);

			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(p.getProperty("systemMail")));
			// Set To: header field of the header.
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			// Set Subject: header field
			message.setSubject(subject);
			// Now set the actual message
			message.setText(detail);
			// Send message
			Transport.send(message);
			sentMessage = true;
		} catch (Exception mex) {
			mex.printStackTrace();
			sentMessage = false;
		}
		return sentMessage;
	}

}
