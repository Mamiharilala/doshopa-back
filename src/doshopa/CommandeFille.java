package doshopa;

import java.sql.Date;

import system.MapModelStateful;

public class CommandeFille extends MapModelStateful{
	String article_id, mere,commande_type,remarque,code_collecter,code_livrer,designation;
	double quantite, pu;
	Date date_fille;
	boolean est_payer;
	public CommandeFille() {
		this.setSequenceName("seq_commandefille");
		this.setSequencePrefixe("CMF");
		this.setTableName("commande_fille");
		this.setCompleteTableName("commande_fille");
		this.setSchema("public");
	}
	public String getArticle_id() {
		return article_id;
	}
	public void setArticle_id(String article_id) {
		this.article_id = article_id;
	}
	public String getMere() {
		return mere;
	}
	public void setMere(String mere) {
		this.mere = mere;
	}
	public String getCommande_type() {
		return commande_type;
	}
	public void setCommande_type(String commande_type) {
		this.commande_type = commande_type;
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
	public String getCode_livrer() {
		return code_livrer;
	}
	public void setCode_livrer(String code_livrer) {
		this.code_livrer = code_livrer;
	}
	public double getQuantite() {
		return quantite;
	}
	public void setQuantite(double quantite) {
		this.quantite = quantite;
	}
	public double getPu() {
		return pu;
	}
	public void setPu(double pu) {
		this.pu = pu;
	}
	public Date getDate_fille() {
		return date_fille;
	}
	public void setDate_fille(Date date_fille) {
		this.date_fille = date_fille;
	}
	public boolean isEst_payer() {
		return est_payer;
	}
	public void setEst_payer(boolean est_payer) {
		this.est_payer = est_payer;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
}
