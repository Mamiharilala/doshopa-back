package doshopa;

import system.MapModelStateful;
import java.sql.Date;
public class Blog  extends MapModelStateful{
	String titre, body,boutique_id; 
	Date date_insert;
	int views;
	String image ;
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
	
}
