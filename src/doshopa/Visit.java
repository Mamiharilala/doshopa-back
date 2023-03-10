package doshopa;

import system.MapModel;

public class Visit extends MapModel{
	String utilisateur_id;
	int visit;
	String object_id;
	String ref_object;
	public Visit(){
		this.setTableName("visit");
		this.setCompleteTableName("visit");
		this.setSchema("public");
		this.setSequenceName("seq_visit");
		this.setSequencePrefixe("VST");
	}
	
	public String getUtilisateur_id() {
		return utilisateur_id;
	}
	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public String getObject_id() {
		return object_id;
	}
	public void setObject_id(String object_id) {
		this.object_id = object_id;
	}
	public String getRef_object() {
		return ref_object;
	}
	public void setRef_object(String ref_object) {
		this.ref_object = ref_object;
	}
	
}
