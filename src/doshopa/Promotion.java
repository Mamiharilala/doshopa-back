package doshopa;

import java.sql.Date;

import system.MapModel;
import system.MapModelStateful;

public class Promotion extends Article{
	double prix_avant;
	double prix_actuel;
	Date date_debut;
	Date date_fin;
	String article_id;
	double quantite;
	public Promotion(){
		super();
		setTableName("article_promotion");
		setSequenceName("seq_boutique_promotion");
		setSequencePrefixe("BTKPM9250");
		setSchema("public");
		setCompleteTableName("article_promotion");
	}
	public double getPrix_avant() {
		return prix_avant;
	}
	public void setPrix_avant(double prix_avant) {
		this.prix_avant = prix_avant;
	}
	public double getPrix_actuel() {
		return prix_actuel;
	}
	public void setPrix_actuel(double prix_actuel) {
		this.prix_actuel = prix_actuel;
	}
	public Date getDate_debut() {
		return date_debut;
	}
	public void setDate_debut(Date date_debut) {
		this.date_debut = date_debut;
	}
	public Date getDate_fin() {
		return date_fin;
	}
	public void setDate_fin(Date date_fin) {
		this.date_fin = date_fin;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public double getQuantite() {
		return quantite;
	}
	public void setQuantite(double quantite) {
		this.quantite = quantite;
	}
	
}
