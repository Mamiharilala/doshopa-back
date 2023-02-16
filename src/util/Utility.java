package util;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Utility {
	public static String stringWithoutNull(String str) {
		if (str == null || str.trim().compareTo("null") == 0|| str.trim().compareTo("") == 0) {
			str = "";
		}
		return str;
	}
 
	public static String format(Object nb) {	
		NumberFormat formatter = null;
		formatter = java.text.NumberFormat.getInstance(java.util.Locale.FRENCH);
		formatter = new DecimalFormat("##,###.##");
		return formatter.format(Double.parseDouble(Utility.stringWithoutNull(String.valueOf(nb))));
	}
	public static String getCurrentDate() {
		Date date = new Date(Calendar.getInstance().getTime().getTime());  
	    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
	    return formatter.format(date);  
	}
	public static String getFormatDate(Date date) {
		java.util.Date utilDate = new java.util.Date(date.getTime());
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        return dateFormat.format(utilDate);
 	}
	public static String setStartWithUppercase(String name) {
		return name.substring(0,1).toUpperCase()+name.substring(1);
	}
	public static Date currentSQLDate() {
		return new java.sql.Date(Calendar.getInstance().getTime().getTime());
	}
	public static String encrypt(String object,Connection c) throws Exception {
		String sql = "select sha1(?::bytea) as encrypt";
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
			pstmt.setString(1,object);
			rs = pstmt.executeQuery();
 			while (rs.next()) {
				val = rs.getString("encrypt");
			}
		}catch(Exception e) {
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
		return val;
	}
}
