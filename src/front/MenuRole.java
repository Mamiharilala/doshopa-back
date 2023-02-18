package front;

import system.MapModel;

public class MenuRole extends MapModel {
	String menu_id;
	String role_id;

	public MenuRole() {
		super();
		setTableName("menu_roles");
		setSequenceName("seq_menu");
		setSequencePrefixe("MNRL");
		setSchema("public");
		setCompleteTableName("menu_roles");
	}

	public String getMenu_id() {
		return menu_id;
	}

	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

}
