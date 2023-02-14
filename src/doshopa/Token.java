package doshopa;

import java.sql.Date;

import system.MapModel;

public class Token extends MapModel{
	String utilisateur_id;
	String token;
	Date last_update;
	public Token(){
		super();
		setTableName("token");
		setSequenceName("seq_token");
		setSequencePrefixe("TKN");
		setSchema("public");
		setCompleteTableName("token");
	}
	public String getUtilisateur_id() {
		return utilisateur_id;
	}
	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
	public Date getLast_update() {
		return last_update;
	}
	public void setLast_update(Date last_update) {
		this.last_update = last_update;
	}
	
	
}
