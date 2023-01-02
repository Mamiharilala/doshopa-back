package front;

import java.sql.Connection;

import system.Generalize;
import system.MapModel;
import util.DBConnect;

public class Menu extends MapModel{
	String id;
	String libelle;
	String icone;
	String src;
	int rang;
	int profond;
	String mere;
	Menu[]fille;
	public Menu(){
		super();
		setTableName("menu");
		setSequenceName("seq_menu");
		setSequencePrefixe("MENU");
		setSchema("public");
		setCompleteTableName("menu");
	}
	public void loadFille(Connection c) throws Exception {
		boolean isNullConn = false;
		try {
			if(c==null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}
			this.setFille((Menu[]) Generalize.getListObjectWithWhere(this," AND mere like '"+this.getId()+"' order by rang asc", c));
			if(this.getFille()!=null) {
				for(int i=0;i<this.getFille().length;i++) {
					this.getFille()[i].setCompleteTableName(this.getCompleteTableName());
					this.getFille()[i].loadFille(c);
				}
			}
		}catch(Exception e) {
			throw e;
		}finally {
			if(isNullConn&&c!=null) {
				c.close();
			}
		}
	}
	public String generateMenu(String racine) throws Exception {
		String val = "";
		try {
			loadFille(null);
			for(int i=0;i<this.getFille().length;i++) {
				if((this.getFille()[i].getFille()==null||this.getFille()[i].getFille().length==0) && this.getFille()[i].getMere().compareTo(racine)==0) {
					val +="<li>";
								val+="<a href='"+this.getFille()[i].getSrc()+"' class='dropdown-toggle no-arrow'>";
								val+="<span class='"+this.getFille()[i].getIcone()+"'></span>";
								val +="<span class='mtext'>"+this.getFille()[i].getLibelle()+"</span>";
								val +="</a>";
					val += "</li>";
				}else if(this.getFille()[i].getFille()==null||this.getFille()[i].getFille().length==0) {
					val+="<li><a href='"+this.getFille()[i].getSrc()+"'>"+this.getFille()[i].getLibelle()+"</a></li>";
				}else {
					val +="";
					val +="<li class='dropdown'>";
							val+="<a href='javascript:;' class='dropdown-toggle'>";
									val+="<span class='"+this.getFille()[i].getIcone()+"'></span>";
									val+= "<span class='mtext'>"+this.getFille()[i].getLibelle()+"</span>";
								val+="</a>";
							val+="<ul class='submenu'>";
							val+= this.getFille()[i].generateMenu(racine);
							val+="</ul>";
					val+="</li>";
				}
			}	
		}catch(Exception e){
			throw e;
		}
		val += ""; 
		return val;
	}
	public String getStringMenu()throws Exception {
		try {
			Menu[]menu = (Menu[]) new Generalize().getListObjectWithWhere(this," AND mere like '' or mere is null ", null); 
			if(menu!=null&&menu.length>0) {				 
				return menu[0].generateMenu( menu[0].getId());
			}
		}catch(Exception e) {
			throw e;
		}
		return "";
	}	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLibelle() {
		return libelle;
	}
	public void setLibelle(String libelle) {
		this.libelle = libelle;
	}
	public String getIcone() {
		return icone;
	}
	public void setIcone(String icone) {
		this.icone = icone;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public int getRang() {
		return rang;
	}
	public void setRang(int rang) {
		this.rang = rang;
	}
	public int getProfond() {
		return profond;
	}
	public void setProfond(int profond) {
		this.profond = profond;
	}
	public String getMere() {
		return mere;
	}
	public void setMere(String mere) {
		this.mere = mere;
	}
	public Menu[] getFille() {
		return fille;
	}
	public void setFille(Menu[] fille) {
		this.fille = fille;
	}
	
}
