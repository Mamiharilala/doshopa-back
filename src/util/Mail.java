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
	public static String port ="465";
	public static String host = "smtp.gmail.com";
	public static String systemMail="contact.doshopa@gmail.com";
	public static String systemPassword ="knxjonynfesvcmos";

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
			// Assuming you are sending email from through gmails smtp
			// Get system properties
			Properties properties = System.getProperties();
			// Setup mail server
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", port);
			properties.put("mail.smtp.ssl.enable", "true");
			properties.put("mail.smtp.auth", "true");
			// Get the Session object.// and pass username and password
			Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(systemMail,systemPassword);
				}

			});
			// Used to debug SMTP issues
			session.setDebug(true);

			// Create a default MimeMessage object.
			MimeMessage message = new MimeMessage(session);
			// Set From: header field of the header.
			message.setFrom(new InternetAddress(systemMail));
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
	public static boolean sentMailSubscribe(String recipient,String nomComplet,String lien,String contactDoshopa) throws Exception{
		try {
		String message = "Cher/chère "+nomComplet+",\r\n" + 
				"\r\n" + 
				"Nous sommes ravis de vous accueillir sur Doshopa ! Merci de nous avoir rejoint pour découvrir les boutiques et leurs produits.\r\n" + 
				"\r\n" + 
				"Afin de valider votre inscription, veuillez cliquer sur le lien ci-dessous pour confirmer votre adresse e-mail :\r\n" + 
				"\r\n" + lien + 
				"\r\n" + 
				"Une fois votre adresse e-mail confirmée, vous pourrez commencer à naviguer sur notre site et à passer commande. Vous serez également informé(e) en avant-première des offres exclusives, des nouvelles collections et des événements à venir.\r\n" + 
				"Si vous rencontrez des problèmes pour valider votre adresse e-mail ou si vous avez des questions sur les boutiques ou services, n'hésitez pas à contacter notre service clientèle à contact.doshopa@gmail.com ou par téléphone au " + 
				contactDoshopa+". Nous serons heureux de vous aider.\r\n" + 
				"\r\n" + 
				"Encore une fois, merci de votre confiance et bienvenue sur Doshopa !\r\n" + 
				"\r\n" + 
				"Cordialement,\r\n" + 
				"\r\n" + 
				"L'équipe Doshopa";
		return sendMailTo(recipient,"Confirmation adresse e-mail sur Doshopa\r\n" + 
				"", message);
		}catch(Exception e) {
			throw e;
		}
	}

}
