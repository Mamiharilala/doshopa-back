package doshopa;

import system.Categorie;

public class BoutiqueCategorie extends Categorie{
	 
	public BoutiqueCategorie(){
		super();
		setTableName("boutique_categorie");
		setSequenceName("boutique_categorie");
		setSequencePrefixe("BTKCA842");
		setSchema("public");
		setCompleteTableName("boutique_categorie");
	}
}
