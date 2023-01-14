package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public Connection getConnection() throws Exception{
		Connection c = null;
		try {
			Class.forName("org.postgresql.Driver");
			c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/online", "postgres", "postgres");
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return c;
	}

	public static void main(String[] args) {
		
 	}

}
