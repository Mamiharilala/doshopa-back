package system;

public class MessageException extends MapModel{
	String message,description,utilisateur_id;
	public MessageException() {
		this.setTableName("exception");
		this.setSequenceName("seq_exception");
		this.setSequencePrefixe("EXC");
		this.setCompleteTableName("exception");
		this.setSchema("public");
	}
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUtilisateur_id() {
		return utilisateur_id;
	}

	public void setUtilisateur_id(String utilisateur_id) {
		this.utilisateur_id = utilisateur_id;
	}
	
}
