package system;

import util.Constant;

public class MapModelStateful extends MapModel{
	int etat;
	String etatlib;
	public MapModelStateful() {
		this.setEtat(Constant.createdState);
	}
	public int getEtat() {
		return etat;
	}
	
	public String getEtatlib() {
		return etatlib;
	}
	public void setEtatlib(String etatlib) {
		this.etatlib = etatlib;
	}
	public void setEtat(int etat) {
		this.etat = etat;
	}
	
}
