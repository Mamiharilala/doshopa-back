package doshopa;

import system.Generalize;
import system.MapModelStateful;
import util.DBConnect;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
public class Blog  extends MapModelStateful{
	String titre, body,boutique_id; 
	Date date_insert;
	int views;
	String image,boutiquelib ;
	public Blog() {
		this.setTableName("boutique_blog");
		this.setCompleteTableName("boutique_blog");
		this.setSchema("public");
		this.setSequenceName("seq_blog");
		this.setSequencePrefixe("BLG");
	}
	public String getTitre() {
		return titre;
	}
	public void setTitre(String titre) {
		this.titre = titre;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getBoutique_id() {
		return boutique_id;
	}
	
	public String getBoutiquelib() {
		return boutiquelib;
	}
	public void setBoutiquelib(String boutiquelib) {
		this.boutiquelib = boutiquelib;
	}
	public void setBoutique_id(String boutique_id) {
		this.boutique_id = boutique_id;
	}
	public Date getDate_insert() {
		return date_insert;
	}
	public void setDate_insert(Date date_insert) {
		this.date_insert = date_insert;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public void incrementView(String utilisateurID) {
		String where ="";
		Visit v = null;
		try {
			v = new Visit();
			where = " AND utilisateur_id like '"+utilisateurID+"' AND object_id like '"+this.getId()+"'";
			Visit[] arrayVisit = (Visit[]) Generalize.getListObjectWithWhere(v,where, null);
			if(arrayVisit.length==0) {
				 v.setRef_object(Blog.class.getName());
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
			sql = "UPDATE boutique_blog SET views=? WHERE id = ?";
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
}
