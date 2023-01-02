package oadmin;

import system.Categorie;

public class ArticleCategorie  extends Categorie{
	 
	public ArticleCategorie(){
		super();
		setTableName("article_categorie");
		setSequenceName("seq_article_categorie");
		setSequencePrefixe("ARTCT5201");
		setSchema("public");
		setCompleteTableName("article_categorie");
	}
}
