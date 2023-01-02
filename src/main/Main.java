package main;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.Date;

 
import front.PageDetail;
import system.Generalize;
import system.MapModel;
import util.DBConnect;

public class Main {
	public static void main(String []args) {
		try {
			Class <?> t = Class.forName("main.Promotion");
			Field[]f = t.getDeclaredFields();
			for(int i=0;i<f.length;i++) {
				System.out.println(f[i].getName());
			}
 		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
	