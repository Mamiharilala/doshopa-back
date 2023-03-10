package doshopa;

import system.MapModel;

public class LocalisationLivraison extends MapModel{
	String localisation;
	String observation;
	boolean est_gratuit;
	public LocalisationLivraison() {
		setTableName("localisation_livraison");
		setSequenceName("seq_localisation_livraison");
		setSequencePrefixe("LOC");
		setSchema("public");
		setCompleteTableName("localisation_livraison");
	}
 
	public String getLocalisation() {
		return localisation;
	}
	public void setLocalisation(String localisation) {
		this.localisation = localisation;
	}
	public String getObservation() {
		return observation;
	}
	public void setObservation(String observation) {
		this.observation = observation;
	}
	public boolean isEst_gratuit() {
		return est_gratuit;
	}
	public void setEst_gratuit(boolean est_gratuit) {
		this.est_gratuit = est_gratuit;
	}
	
}
