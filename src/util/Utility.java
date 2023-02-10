package util;

import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Utility {
	public static String stringWithoutNull(String str) {
		if (str == null || str.trim().compareTo("null") == 0) {
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
	public static String setStartWithUppercase(String name) {
		return name.substring(0,1).toUpperCase()+name.substring(1);
	}
	public static Date currentSQLDate() {
		return new java.sql.Date(Calendar.getInstance().getTime().getTime());
	}
}
