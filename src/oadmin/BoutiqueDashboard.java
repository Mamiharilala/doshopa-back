package oadmin;

import system.MapModelStateful;

public class BoutiqueDashboard extends MapModelStateful{
	int total_views, total_blog, total_articles, total_promotions, commande_en_cours, quantite_vente;
	double chiffres_affaires;
	public BoutiqueDashboard(){
		this.setTableName("dashboarddata");
		this.setCompleteTableName("dashboarddata");
		this.setSchema("public");
 	}
	public int getTotal_views() {
		return total_views;
	}
	public void setTotal_views(int total_views) {
		this.total_views = total_views;
	}
	public int getTotal_blog() {
		return total_blog;
	}
	public void setTotal_blog(int total_blog) {
		this.total_blog = total_blog;
	}
	public int getTotal_articles() {
		return total_articles;
	}
	public void setTotal_articles(int total_articles) {
		this.total_articles = total_articles;
	}
	public int getTotal_promotions() {
		return total_promotions;
	}
	public void setTotal_promotions(int total_promotions) {
		this.total_promotions = total_promotions;
	}
	public int getCommande_en_cours() {
		return commande_en_cours;
	}
	public void setCommande_en_cours(int commande_en_cours) {
		this.commande_en_cours = commande_en_cours;
	}
	public int getQuantite_vente() {
		return quantite_vente;
	}
	public void setQuantite_vente(int quantite_vente) {
		this.quantite_vente = quantite_vente;
	}
	public double getChiffres_affaires() {
		return chiffres_affaires;
	}
	public void setChiffres_affaires(double chiffres_affaires) {
		this.chiffres_affaires = chiffres_affaires;
	}
	
}
