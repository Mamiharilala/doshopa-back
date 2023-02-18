package system;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import util.Constant;
import util.DBConnect;
import util.Utility;
public class MapModel {
	String id;
	String tableName;
	String schema;
	String sequenceName;
	String sequencePrefixe;
	String completeTableName;
	public String getCompleteTableName() {
		return completeTableName;
	}
	public void setCompleteTableName(String completeTableName) {
		this.completeTableName = completeTableName;
	}
	public MapModel(){
		
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getSchema() {
		return schema;
	}
	public void setSchema(String schema) {
		this.schema = schema;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public void setId(Connection c) throws Exception {
		boolean isClose = false;
		try {
			if(c==null) {
				isClose=true;
				c = new DBConnect().getConnection();
			}
			this.setId(Utility.stringWithoutNull(this.getSequencePrefixe())+generateId(c));
		}catch(Exception e) {
			
		}finally {
			if(isClose&&c!=null) {
				c.close();
			}
		}
		
	}
	public String generateId(Connection c) throws Exception {
		String sql = "select nextval(?) as sequence";
 		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String val ="";
		boolean isConnNull = false; 
		try {
			if(c==null) {
				c = new DBConnect().getConnection();
				isConnNull = true;
			}
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1,this.getSequenceName());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				val = rs.getString("sequence");
			}
		}catch(Exception e) {
			
		}finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if(isConnNull&&c!=null) {
				c.close();
			}
		}
		return val;
	}
	public static String generateId(Connection c,String sequenceName) throws Exception {
		String sql = "select nextval(?) as sequence";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String val ="";
		boolean isConnNull = false; 
		try {
			if(c==null) {
				c = new DBConnect().getConnection();
				isConnNull = true;
			}
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1,sequenceName);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				val = rs.getString("sequence");
			}
		}catch(Exception e) {
			
		}finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if(isConnNull&&c!=null) {
				c.close();
			}
		}
		return val;
	}
	public void insertIntoTable(Connection c) throws Exception {	
		PreparedStatement pstmt = null;
		boolean isConnNull = false;
		Method m = null;
		try {
			if(c==null) {
				c = new DBConnect().getConnection();
				isConnNull = true;
			}
			this.controlInsert(c);
			this.setId(c);
			String sql = "INSERT INTO "+this.getCompleteTableName()+" (";
			String val ="VALUES(";
			Field[] listFieldName = new Generalize().getCommonField(this, c);
			String simpleName = "";
			for(int i=0;i<listFieldName.length;i++){
				simpleName = listFieldName[i].getType().getSimpleName().toUpperCase();
				listFieldName[i].setAccessible(true);
				sql +=  listFieldName[i].getName()+",";
				val+= Generalize.valStringQuery(simpleName,listFieldName[i].get(this))+",";
			}
			sql = sql.substring(0, sql.length()-1)+")";
			val = val.substring(0, val.length()-1)+")";
 			pstmt = c.prepareStatement(sql+val);
			pstmt.executeUpdate();			 
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (pstmt != null) {
				pstmt.close();
			}
			if(isConnNull&&c!=null) {
				c.close();
			}
		}
	}
	
	public void updateIntoTable(Connection c) throws Exception {	
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		boolean isConnNull = false; 
		try {
			if(c==null) {
				c = new DBConnect().getConnection();
				isConnNull = true;
			}
			this.controlUpdate(c);;
			String sql = "UPDATE "+this.getCompleteTableName()+" SET ";
			Field[] listFieldName = new Generalize().getCommonField(this, c);
			String simpleName = "";
			for(int i=0;i<listFieldName.length;i++){
				listFieldName[i].setAccessible(true);
				if(listFieldName[i].get(this)!=null&&String.valueOf(listFieldName[i].get(this))!=""&&String.valueOf(listFieldName[i].get(this))!="null") {
					simpleName = listFieldName[i].getType().getSimpleName().toUpperCase();
					sql +=  listFieldName[i].getName()+"=";
					sql += Generalize.valStringQuery(simpleName,listFieldName[i].get(this))+",";
				}
			}
			sql = sql.substring(0, sql.length()-1)+"";
			sql += " WHERE ID= '"+this.getId()+"'";
 			pstmt = c.prepareStatement(sql);
 			//System.out.println(sql);
			pstmt.executeUpdate();			 
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if(isConnNull&&c!=null) {
				c.close();
			}
		}
	} 
	public void deleteIntoTable(Connection c) throws Exception {	
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		boolean isConnNull = false; 
		try {
			if(c==null) {
				c = new DBConnect().getConnection();
				isConnNull = true;
			}
			this.controlUpdate(c);
			String sql = "DELETE FROM "+this.getCompleteTableName();
			sql += " WHERE ID= ?";
 			pstmt = c.prepareStatement(sql);
 			pstmt.setString(1, this.getId());
 			//System.out.println(sql);
			pstmt.executeUpdate();			 
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
			if(isConnNull&&c!=null) {
				c.close();
			}
		}
	} 
	public Field[] getAllFields() {
        List<Field> fields = new ArrayList<>();
        Class clazz = this.getClass();
        while (clazz != Object.class) {
            fields.addAll(Arrays.asList(clazz.getDeclaredFields()));
            clazz = clazz.getSuperclass();
        }
        return fields.toArray(new Field[fields.size()]);
    }
	public String getSequenceName() {
		return sequenceName;
	}
	public void setSequenceName(String sequenceName) {
		this.sequenceName = sequenceName;
	}
	public String getSequencePrefixe() {
		return sequencePrefixe;
	}
	public void setSequencePrefixe(String sequencePrefixe) {
		this.sequencePrefixe = sequencePrefixe;
	}
	public void controlInsert() throws Exception{
		
	}
	public void controlInsert(Connection c) throws Exception{
		
	}
	public void controlUpdate() throws Exception{
		
	}
	public void controlUpdate(Connection c) throws Exception{
		
	}
	public void controlDelete() throws Exception{
		
	}
	public void controlDelete(Connection c) throws Exception{
		
	}
	public void controlSelect() throws Exception{
		
	}
	public void controlSelect(Connection c) throws Exception{
		
	}
}
