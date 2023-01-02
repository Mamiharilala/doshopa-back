package oadmin;

import system.Categorie;
import system.MapModel;

public class Devise extends Categorie{
	 
 	public Devise(){
		super();
		setTableName("devise");
		setSequenceName("devise");
		setSequencePrefixe("DVR003");
		setSchema("public");
		setCompleteTableName("devise");
	}
}
