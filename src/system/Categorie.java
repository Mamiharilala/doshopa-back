package system;

public class Categorie extends MapModel{
	String code,description;
	 
 	public Categorie(){
		super();
	}

	public String getCode() {
		return code;
	}

	public void setCode(String val) {
		this.code = val;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String desc) {
		this.description = desc;
	}
 	
}
