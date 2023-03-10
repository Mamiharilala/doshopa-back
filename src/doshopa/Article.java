package doshopa;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import system.Generalize;
import system.MapModelStateful;
import util.DBConnect;

public class Article extends MapModelStateful{
	String designation,reference,image,observation,categorie_id,boutique_id,devise_id,boutique_denomination,categorielib;
	double prix,quantite;
	int views;
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
	public String getCategorielib() {
		return categorielib;
	}
	public void setCategorielib(String catagorielib) {
		this.categorielib = catagorielib;
	}	
	public void incrementView(String utilisateurID) {
		String where ="";
		Visit v = null;
		try {
			v = new Visit();
			where = " AND utilisateur_id like '"+utilisateurID+"' AND object_id like '"+this.getId()+"'";
			Visit[] arrayVisit = (Visit[]) Generalize.getListObjectWithWhere(v,where, null);
			if(arrayVisit.length==0) {
				 v.setRef_object(Article.class.getName());
				 v.setUtilisateur_id(utilisateurID);
				 v.setObject_id(this.getId());
				 v.setVisit(1);
				 this.setViews(this.getViews()+1);
				 v.insertIntoTable(null);
				 updateViews(); 
			}
		}catch(Exception e) {
			
		}
	}
	public void updateViews() throws Exception{
		PreparedStatement pstmt = null;
		Connection c = null;
		try {
			String sql = "";
			c = new DBConnect().getConnection();
			sql = "UPDATE article SET views=? WHERE id = ?";
			pstmt = c.prepareStatement(sql);
			pstmt.setInt(1, this.getViews());
			pstmt.setString(2, this.getId());
			pstmt.executeUpdate();
			// Update fille fin
		} catch (Exception e) {
			throw e;
		} finally {
			if (c != null) {
				c.close();
			}
		}
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	
}
