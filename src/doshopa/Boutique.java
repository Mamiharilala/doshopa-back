package doshopa;

import system.MapModelStateful;

public class Boutique extends MapModelStateful{
	String denomination;
	String siege;
	String categorie_id;
	String logo;
	String mail;
	String telephone;
	String remarque;
	String nif;
	String stat;
	String type_id;
	String categorielib,note,information,apropos;
	int views;
 
	public Boutique(){
		this.setTableName("boutique");
		this.setCompleteTableName("boutique");
		this.setSchema("public");
		this.setSequenceName("seq_boutique");
		this.setSequencePrefixe("BTK459");
	}

	public String getDenomination() {
		return denomination;
	}
	public void setDenomination(String denomination) {
		this.denomination = denomination;
	}
	public String getSiege() {
		return siege;
	}
	
	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public void setSiege(String siege) {
		this.siege = siege;
	}
	public String getCategorie_id() {
		return categorie_id;
	}
	
	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public String getApropos() {
		return apropos;
	}

	public void setApropos(String apropos) {
		this.apropos = apropos;
	}

	public void setCategorie_id(String categorie_id) {
		this.categorie_id = categorie_id;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getRemarque() {
		return remarque;
	}
	public void setRemarque(String remarque) {
		this.remarque = remarque;
	}
	public String getNif() {
		return nif;
	}
	public void setNif(String nif) {
		this.nif = nif;
	}
	public String getStat() {
		return stat;
	}
	public void setStat(String stat) {
		this.stat = stat;
	}
	public String getType_id() {
		return type_id;
	}
	public void setType_id(String type_id) {
		this.type_id = type_id;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}

	public String getCategorielib() {
		return categorielib;
	}

	public void setCategorielib(String categorielib) {
		this.categorielib = categorielib;
	}
	
}
