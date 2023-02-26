package system;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import doshopa.CommandeFille;
import doshopa.Notification;
import util.Constant;
import util.DBConnect;

public class MapModelStateful extends MapModel{
	int etat;
	String etatlib;
	public MapModelStateful() {
		this.setEtat(Constant.createdState);
	}
	public int getEtat() {
		return etat;
	}
	
	public String getEtatlib() {
		return etatlib;
	}
	public void setEtatlib(String etatlib) {
		this.etatlib = etatlib;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	public void validateObject(Connection c) throws Exception {
		PreparedStatement pstmt = null;
		boolean isNullConn = false;
		try {
			String sql = "";
			if(c==null) {
				c = new DBConnect().getConnection();
				isNullConn = true;
			}	
			// Update object
			sql = "UPDATE "+this.getCompleteTableName()+" SET etat=? WHERE id=?";
			pstmt = c.prepareStatement(sql);
			pstmt.setDouble(1, Constant.validatedState);
			pstmt.setString(2,this.getId());
			pstmt.executeUpdate();
			// Update object fin
		} catch (Exception e) {
			throw e;
		} finally {
			if (isNullConn && c != null) {
				c.close();
			}
		}
	}
}
