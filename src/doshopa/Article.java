package doshopa;

import java.sql.Date;

import system.MapModelStateful;

public class Article extends MapModelStateful{
	String designation,reference,image,observation,categorie_id,boutique_id,devise_id,boutique_denomination;
	double prix,quantite;
 	public Article(){
		super();
		setTableName("article");
		setSequenceName("seq_article");
		setSequencePrefixe("ATC9431");
		setSchema("public");
		setCompleteTableName("article");
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getReference() {
		return reference;
	}
	public void setReference(String reference) {
		this.reference = reference;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	public String getBoutique_denomination() {
		return boutique_denomination;
	}
	public void setBoutique_denomination(String boutique_denomination) {
		this.boutique_denomination = boutique_denomination;
	}
	public String getObservation() {
		return observation;
	}
	public void setObservation(String observation) {
		this.observation = observation;
	}
	public String getCategorie_id() {
		return categorie_id;
	}
	public void setCategorie_id(String categorie_id) {
		this.categorie_id = categorie_id;
	}
	public String getBoutique_id() {
		return boutique_id;
	}
	public void setBoutique_id(String boutique_id) {
		this.boutique_id = boutique_id;
	}
	public String getDevise_id() {
		return devise_id;
	}
	public void setDevise_id(String devise_id) {
		this.devise_id = devise_id;
	}
	public double getPrix() {
		return prix;
	}
	public void setPrix(double prix) {
		this.prix = prix;
	}
	public double getQuantite() {
		return quantite;
	}
	public void setQuantite(double quantite) {
		this.quantite = quantite;
	}	
}
