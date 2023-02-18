package front;

import system.MapModel;
import system.MapModelStateful;

public class UtilisateurPrivilege extends MapModelStateful {
	String utilisateur_id;
	String menu_id;

	public UtilisateurPrivilege() {
		super();
		setTableName("utilisateur_privilege");
		setSequenceName("seq_user_privilege");
		setSequencePrefixe("UP");
		setSchema("public");
		setCompleteTableName("utilisateur_privilege");
	}

	public String getUtilisateur_id() {
		return utilisateur_id;
	}

	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	
}
