package system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import doshopa.Article;
import doshopa.Boutique;
import doshopa.CommandeFille;
import doshopa.CommandeMere;
import util.Constant;
import util.DBConnect;

public class Utilisateur extends MapModel {
	String nom, prenom, mail, telephone, mot_passe, adresse, sexe, role_id, login,boutique_id;
	int etat;

	public Utilisateur() {
		super();
		setTableName("utilisateur");
		setSequenceName("seq_utilisateur");
		setSequencePrefixe("UTLS");
		setSchema("public");
		setCompleteTableName("utilisateur");
	}

	public boolean treatLogin(String login, String pwd) throws Exception {
		String sql = "SELECT * FROM utilisateur where login like ? AND mot_passe like sha1(?::bytea) and etat > 1";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String val = "";
		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, login);
			pstmt.setString(2,pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				this.setId(rs.getString("id"));
				this.setMail(rs.getString("mail"));
				this.setLogin(rs.getString("login"));
				this.setTelephone(rs.getString("telephone"));
				this.setAdresse(rs.getString("adresse"));
				this.setRole_id(rs.getString("role_id"));
				this.setNom(rs.getString("nom"));
				this.setPrenom(rs.getString("prenom"));
				this.setBoutique_id(rs.getString("boutique_id"));
			}else {
				return false;
			}
			return true;
		} catch (Exception e) {
			throw e;
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if (c != null) {
				c.close();
			}
		}
		
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}
	public boolean isBoutique() {
 		if(this.getBoutique_id()!=null&&this.getBoutique_id()!=""&&this.getBoutique_id()!="null") {
			return true;
		}
		return false;
	}
	public Boutique getBoutique()throws Exception {
		try {
			if(!isBoutique()) {
				throw new Exception ("Utilisateur n'a pas de boutique!");
			}
			Boutique m = new Boutique();
			m.setId(this.getBoutique_id());
			return (Boutique)Generalize.getById(m, null);
 		}catch(Exception e) {
			throw e;
		}
		 
	}
	
	public String getBoutique_id() {
		return boutique_id;
	}

	public void setBoutique_id(String boutique_id) {
		this.boutique_id = boutique_id;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMot_passe() {
		return mot_passe;
	}

	public void setMot_passe(String mot_passe) {
		this.mot_passe = mot_passe;
	}

	public String getAdresse() {
		return adresse;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}

	public String getSexe() {
		return sexe;
	}

	public void setSexe(String sexe) {
		this.sexe = sexe;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public int getEtat() {
		return etat;
	}

	public void setEtat(int etat) {
		this.etat = etat;
	}
	public boolean acheterArticle(String idArticle) throws Exception{
		boolean val = false;
		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			c.setAutoCommit(false);
			Article tempArticle = new Article();
		 	tempArticle.setId(idArticle);
		 	Article art = (Article)Generalize.getById(tempArticle, c);
		 	if(art==null) {
		 		throw new Exception("Produit introuvable!");
		 	}
		 	String where = " and utilisateur_id like '"+this.getId()+"' and etat=1";
		 	CommandeMere commande = null;
		 	CommandeMere[]mere = (CommandeMere[])Generalize.getListObjectWithWhere(new CommandeMere(), where, c);
		 	if(mere.length==0) {
		 		commande = new CommandeMere();
		 		commande.setId(c);
		 		commande.setEtat(Constant.createdState);
		 		commande.setUtilisateur_id(this.getId());	
		 		commande.setDate_mere(util.Utility.currentSQLDate());
		 		commande.insertIntoTable(c);
		 	}else {
		 		commande = mere[0];
		 	}
		 	CommandeFille commandeFille = new CommandeFille();
		 	commandeFille.setId(c);
		 	commandeFille.setMere(commande.getId());
		 	commandeFille.setArticle_id(art.getId());
		 	commandeFille.setEtat(Constant.createdState);
		 	commandeFille.setQuantite(1);
		 	commandeFille.setPu(art.getPrix());
		 	commandeFille.setCommande_type("COMMANDE");
		 	commandeFille.setDate_fille(util.Utility.currentSQLDate());
		 	commandeFille.insertIntoTable(c);
		 	c.commit();
		 	c.setAutoCommit(true);
		 	val = true;
		}catch(Exception e) {
			val = false;
			throw e;
		}finally {
			if(c!=null) {
				c.close();
			}
		} 
		return val;
	}
}
