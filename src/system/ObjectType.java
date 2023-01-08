package system;

public class ObjectType extends MapModel{
	String id;
	Object code;
	Object description;
	public ObjectType() {
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Object getCode() {
		return code;
	}
	public void setCode(Object val) {
		this.code = val;
	}
	public Object getDescription() {
		return description;
	}
	public void setDescription(Object desc) {
		this.description = desc;
	}
	
}
