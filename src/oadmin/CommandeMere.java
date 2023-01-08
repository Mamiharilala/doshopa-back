package oadmin;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

import system.MapModel;
import system.MapModelStateful;
import util.Constant;
import util.DBConnect;

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
	public void affecterCodeCollecter(String codeCollecter) throws Exception {
		PreparedStatement pstmt = null;
 		String val ="";
 		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			String query = "UPDATE commande_fille SET code_collecter=? where mere=?";
			c.setAutoCommit(false);
			pstmt = c.prepareStatement(query);
			pstmt.setString(1, codeCollecter);
			pstmt.setString(2, this.getId());
			pstmt.execute(); 
			affecterCodeLivrer(c,codeCollecter);
			c.commit();
		}catch(Exception e) {
			c.rollback();
			throw e;
		}finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (c != null) {
				c.close();
			}
		}
	}
	public void affecterCodeLivrer(Connection c,String code_collecter) throws Exception {
		PreparedStatement pstmt = null;
 		String val ="";
 		boolean isNull = false;
		try {
			if(c==null) {
				isNull = true;
				c = new DBConnect().getConnection();
			}
			String query = "UPDATE commande_fille SET code_livrer=? where code_collecter=? and etat=?";
			pstmt = c.prepareStatement(query);
			pstmt.setString(1, generateIDCollecter());
			pstmt.setString(2, code_collecter);
			pstmt.setInt(3, Constant.validatedState);
			pstmt.execute(); 
		}catch(Exception e) {
			throw e;
		}finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (isNull&&c != null) {
				c.close();
			}
		}
	}
	public static void collecter(Connection c,String code_collecter) throws Exception {
		PreparedStatement pstmt = null;
 		String val ="";
 		boolean isNull = false;
		try {
			if(c==null) {
				isNull = true;
				c = new DBConnect().getConnection();
			}
			String query = "UPDATE commande_fille SET etat=? where code_collecter=? ";
			pstmt = c.prepareStatement(query);
			pstmt.setInt(1, Constant.collectedState);
			pstmt.setString(2, code_collecter);
			pstmt.execute(); 
		}catch(Exception e) {
			throw e;
		}finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (isNull&&c != null) {
				c.close();
			}
		}
	}
	public static void livrer(Connection c,String code_livraison) throws Exception {
		PreparedStatement pstmt = null;
 		String val ="";
 		boolean isNull = false;
		try {
			if(c==null) {
				isNull = true;
				c = new DBConnect().getConnection();
			}
			String query = "UPDATE commande_fille SET etat=? where code_livrer=?";
			pstmt = c.prepareStatement(query);
			pstmt.setInt(1, Constant.deliveryState);
			pstmt.setString(2, code_livraison);
			pstmt.execute(); 
		}catch(Exception e) {
			throw e;
		}finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (isNull&&c != null) {
				c.close();
			}
		}
	}
	public void paiementByCodeCollecter(String code_collecter) throws Exception {
		PreparedStatement pstmt = null;
 		String val ="";
 		Connection c = null;
		try {
			c = new DBConnect().getConnection();
			String query = "UPDATE commande_fille SET est_payer=? where code_collecter=?";
			pstmt = c.prepareStatement(query);
			pstmt.setBoolean(1, true);
			pstmt.setString(2, code_collecter);
 			pstmt.execute(); 
		}catch(Exception e) {
			throw e;
		}finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if (c != null) {
				c.close();
			}
		}
	}
	public static String generateIDCollecter()throws Exception {
		try {
			return new Random().nextInt(9)+MapModel.generateId(null, "seq_code_collecter")+(new Random().nextInt(9));
		}catch(Exception e) {
			throw e;
		}
	}  
	public static String generateIDLivraison()throws Exception {
		try {
			return new Random().nextInt(9)+MapModel.generateId(null, "seq_code_livraison")+(new Random().nextInt(9));
		}catch(Exception e) {
			throw e;
		}
	}
}
