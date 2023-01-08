package front;

import java.lang.reflect.Method;

import system.Generalize;
import system.MapModel;
import util.Utility;

public class PageUpdate extends Page{
	public PageUpdate(MapModel map) throws Exception {
		super(map);
		this.setMapModel((MapModel)new Generalize().getById(map,null));
	}
	
	public void chargeForm() throws Exception {
		String fieldType = "";
		String val = "";
 		for (String key : pageField.keySet()) {
		    if(pageField.get(key).isVisible()) {
		    	pageField.get(key).getField().setAccessible(true);
		    	fieldType = pageField.get(key).getField().getType().getSimpleName().toUpperCase();
		    	val = Utility.stringWithoutNull(String.valueOf(pageField.get(key).getField().get(this.getMapModel()))); 	
		    	if (pageField.get(key).getType().trim().toUpperCase().compareTo("SELECT") == 0) {
					String valMultiple = "";
					valMultiple+= "<select class='custom-select2 form-control'name='"
									+ pageField.get(key).getField().getName() + "'style='width: 100%; height: 38px'"+pageField.get(key).getHtml()+">"
									+ "<optgroup label='" + pageField.get(key).getNameDisplay() + "'>";
					String methodName = "";
					Method m = null;
					String selected = "";
					Object value = null;
					
					for (int i = 0; i < this.pageField.get(key).getMultipleData().length; i++) {
						// key
						selected = "";
						methodName = this.pageField.get(key).getMultipleKey();
						methodName = "get" + (methodName.charAt(0) + "").toUpperCase() + (methodName.substring(1));
						m = this.pageField.get(key).getMultipleData()[i].getClass().getMethod(methodName, null);
						value = m.invoke(this.pageField.get(key).getMultipleData()[i], null);
						if(val.toUpperCase().compareTo(value.toString().toUpperCase())==0) {
		 					selected = "selected";
		 				}
						valMultiple += "<option value='" + value + "' "+selected+">";
						// value
						methodName = this.pageField.get(key).getMultipleValue();
						methodName = "get" + (methodName.charAt(0) + "").toUpperCase() + (methodName.substring(1));
						m = this.pageField.get(key).getMultipleData()[i].getClass().getMethod(methodName, null);
						valMultiple += m.invoke(this.pageField.get(key).getMultipleData()[i], null);
						valMultiple += "</option>";
					}
					valMultiple += "</optgroup>";
					valMultiple += "</select>";
					String form="<div class='form-group row'><label class='col-sm-12 col-md-2 col-form-label'>"+pageField.get(key).getNameDisplay()+"</label><div class='col-sm-12 col-md-10'>"+valMultiple+"</div></div>";
					this.setLineForm(Utility.stringWithoutNull(this.getLineForm())+form);
				}else if(pageField.get(key).getType().trim().toUpperCase().compareTo("TEXTAREA")==0) {
		    		this.setLineForm(Utility.stringWithoutNull(this.getLineForm())+
							"<div class='form-group row'><label class='col-sm-12 col-md-2 col-form-label'>"+pageField.get(key).getNameDisplay()+"</label><div class='col-sm-12 col-md-10'> <textarea name="+pageField.get(key).getField().getName()+" class='form-control' "+pageField.get(key).getHtml()+">"+val+"</textarea></div></div>"								
								);
		    	}else {
		    		this.setLineForm(Utility.stringWithoutNull(this.getLineForm())+
							"<div class='form-group row'><label class='col-sm-12 col-md-2 col-form-label'>"+pageField.get(key).getNameDisplay()+"</label><div class='col-sm-12 col-md-10'> <input name="+pageField.get(key).getField().getName()+" class='form-control' value='"+val+"' type='"+pageField.get(key).getType()+"' "+pageField.get(key).getHtml()+"/></div> </div>"								
								);
		    	}		    	
		    }
		}
		 
	}
}