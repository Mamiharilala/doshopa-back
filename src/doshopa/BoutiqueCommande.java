package doshopa;
import java.sql.Date;
import system.MapModelStateful;

public class BoutiqueCommande extends MapModelStateful{
	String idmere,article_id,designation,commande_type,utilisateur_id,remarque,code_collecter;
	Date date_mere,date_fille;
	double pu,quantite,montant;
	public BoutiqueCommande(){
		this.setTableName("commandeliste_boutique");
		this.setCompleteTableName("commandeliste_boutique");
		this.setSchema("public");
 	}
	public String getIdmere() {
		return idmere;
	}
	public void setIdmere(String idmere) {
		this.idmere = idmere;
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getCommande_type() {
		return commande_type;
	}
	public void setCommande_type(String commande_type) {
		this.commande_type = commande_type;
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
	public String getCode_collecter() {
		return code_collecter;
	}
	public void setCode_collecter(String code_collecter) {
		this.code_collecter = code_collecter;
	}
	public Date getDate_mere() {
		return date_mere;
	}
	public void setDate_mere(Date date_mere) {
		this.date_mere = date_mere;
	}
	public Date getDate_fille() {
		return date_fille;
	}
	public void setDate_fille(Date date_fille) {
		this.date_fille = date_fille;
	}
	public double getPu() {
		return pu;
	}
	public void setPu(double pu) {
		this.pu = pu;
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
	
}
