package oadmin;

import java.sql.Date;

import system.MapModel;
import system.MapModelStateful;

public class CommandeMere extends MapModelStateful{
	Date date_mere;
	double quantite,montant;
	String utilisateur_id,remarque;
	public CommandeMere() {
		this.setTableName("commande_mere");
		this.setCompleteTableName("commande_mere");
		this.setSchema("public");
	}
	public Date getDate_mere() {
		return date_mere;
	}
	public void setDate_mere(Date date_mere) {
		this.date_mere = date_mere;
	}
	public double getQuantite() {
		return quantite;
	}
	public void setQuantite(double quantite) {
		this.quantite = quantite;
	}
	public double getMontant() {
		return montant;
	}
	public void setMontant(double montant) {
		this.montant = montant;
	}
	public String getUtilisateur_id() {
		return utilisateur_id;
	}
	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}
	public String getRemarque() {
		return remarque;
	}
	public void setRemarque(String remarque) {
		this.remarque = remarque;
	}
	
}
