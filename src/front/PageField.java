package front;

import java.lang.reflect.Field;

import util.Utility;

public class PageField {
	String type;
	String nameDisplay;
 	boolean visible;
 	String link;
	Field field;
	String html;
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getNameDisplay() {
		return nameDisplay;
	}

	public void setNameDisplay(String nameToChange) {	
		this.nameDisplay = Utility.setStartWithUppercase(nameToChange);
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visibility) {
		this.visible = visibility;
	}

	public Field getField() {
		return field;
	}

	public void setField(Field field) {
		this.field = field;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}
	
}
