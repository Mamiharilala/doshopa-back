package oadmin;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import system.Generalize;
import system.MapModel;
import system.MapModelStateful;
import system.Utilisateur;

public class BoutiqueDashboard extends Article{
	int total_views, total_blog, total_articles, total_promotions, commande_en_cours, quantite_vente, totales_boutiques;
	String utilisateur_id;
	double chiffre_affaires;
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
	public String getUtilisateur_id() {
		return this.utilisateur_id;
	}
	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}
	public double getChiffre_affaires() {
		return chiffre_affaires;
	}
	public void setChiffre_affaires(double chiffre_affaires) {
		this.chiffre_affaires = chiffre_affaires;
	}
	public int getTotales_boutiques() {
		return totales_boutiques;
	}
	public void setTotales_boutiques(int totales_boutiques) {
		this.totales_boutiques = totales_boutiques;
	}
	
	// Dashboard data fetch
	public HashMap<String, String> getDashBoardData(Utilisateur utilisateur) throws Exception{
		HashMap<String, String> displayFormat = new HashMap<String, String>();
		ArrayList<String> fields = new ArrayList<String>();
		fields.add("chiffre_affaires");
		fields.add("total_views");
		fields.add("total_blog");
		fields.add("total_articles");
		fields.add("total_promotions");
		fields.add("commande_en_cours");
		fields.add("quantite_vente");
		
		ArrayList<String> toBeDisplayed = new ArrayList<String>();
		toBeDisplayed.add("Chiffre d'Affaires");
		toBeDisplayed.add("Vues");
		toBeDisplayed.add("Blogs");
		toBeDisplayed.add("Articles");
		toBeDisplayed.add("Promotions");
		toBeDisplayed.add("Commandes en cours");
		toBeDisplayed.add("Ventes totales");
		
		HashMap<String, String> result = new HashMap<String, String>();
		BoutiqueDashboard [] data = null;
		data = (BoutiqueDashboard[]) Generalize.getListObjectWithWhere(this, " AND utilisateur_id = '" + utilisateur.getId() +"' " ,null);
		if (data.length == 0) {
			this.setTableName("alldashboarddata");
			this.setCompleteTableName("alldashboarddata");
			data = (BoutiqueDashboard[]) Generalize.getListObject(this, null);
			fields.add("totales_boutiques");
			toBeDisplayed.add("Boutiques");
		}
		
		for (int i = 0; i < fields.size(); i++) {
			displayFormat.put(fields.get(i), toBeDisplayed.get(i));
		}
		
		if (data.length > 0) {
			for (int i = 0; i < fields.size(); i ++) {
				for (Method method : Class.forName("oadmin.BoutiqueDashboard").getMethods()) {
					if (method.getName().startsWith("get") && method.getName().toLowerCase().endsWith(fields.get(i).toLowerCase())) {
						result.put(displayFormat.get(fields.get(i)), method.invoke(data[0]).toString());
					}
				}
			}
		}
		return result;
	}
	
	// Dashboard display
	public String dashboardDisplay(Utilisateur utilisateur) throws Exception {
		String[] toBeDisplayed = {"Chiffre d'Affaires", "Boutiques" , "Vues", "Blogs",
				"Articles", "Promotions", "Commandes en cours", "Ventes totales"};
		String[] icones = {"icon-copy fa fa-money", "icon-copy fa fa-institution", "icon-copy fa fa-eye", "icon-copy fa fa-rocket",
				"icon-copy fa fa-archive", "icon-copy fa fa-gift", "icon-copy fa fa-shopping-basket", "icon-copy fa fa-shopping-cart"};
		String[] colors = {"#00eccf", "", "", "",
				"", "", "", ""};
		HashMap<String, String> data = this.getDashBoardData(utilisateur);
		String html = "";
		for (int i = 0; i < toBeDisplayed.length; i++ ) {
			String label = toBeDisplayed[i];
			String temp_html = "<div class='col-xl-3 col-lg-3 col-md-6 mb-20'>"
				+ "<div class='card-box height-100-p widget-style3'>"
				+ "<div class='d-flex flex-wrap'>"
				+ "<div class='widget-data'>"
				+ "<div class='weight-700 font-24 text-dark'>" + data.get(label) + "</div>"
				+ "<div class='font-14 text-secondary weight-500'>"
				+ label
				+ "</div>"
				+ "</div>"
				+ "<div class='widget-icon'>"
				+ "<div class='icon' data-color='" + colors[i] + "'>"
				+ "<i class='" + icones[i] + "'></i>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "</div>"
				+ "</div>";
			html += temp_html;
		}
		return html;
	}
	
	public static void main(String []args) throws Exception {
		// BoutiqueDashboard dashboard = new BoutiqueDashboard();
		// System.out.println(dashboard.getDashBoardData(null));
	}
}
