package doshopa;

import java.sql.Date;

import system.MapModel;
import util.Utility;

public class Notification extends MapModel{
	String message,utilisateur_id,role_id;
	Date date_insert;
	boolean has_viewed;
	public Notification(){
		super();
		init();
	}
	 
	public Notification(String message, String utilisateur_id, String role_id) {	 
		this.setMessage(message);
		this.setUtilisateur_id(utilisateur_id);
		this.setRole_id(role_id);
		this.setDate_insert(Utility.currentSQLDate());
		this.setHas_viewed(false);
		init();
	}
	
	public void init() {
		setTableName("notification");
		setSequenceName("seq_notification");
		setSequencePrefixe("NOTIF");
		setSchema("public");
		setCompleteTableName("notification");
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getUtilisateur_id() {
		return utilisateur_id;
	}
	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}
	public String getRole_id() {
		return role_id;
	}
	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}
	public Date getDate_insert() {
		return date_insert;
	}
	public void setDate_insert(Date date_insert) {
		this.date_insert = date_insert;
	}
	public boolean isHas_viewed() {
		return has_viewed;
	}
	public void setHas_viewed(boolean has_viewed) {
		this.has_viewed = has_viewed;
	}
	
}
