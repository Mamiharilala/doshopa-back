package front;

import java.lang.reflect.Field;

import system.Generalize;
import system.MapModel;
import util.Utility;

public class PageCreate extends Page{
	public PageCreate(MapModel map) throws Exception {
		super(map);
	}
	
	public void chargeForm() throws Exception {
		String fieldType = "";
		String val = "";
 		for (String key : pageField.keySet()) {
		    if(pageField.get(key).isVisible()) {
		    	pageField.get(key).getField().setAccessible(true);
		    	fieldType = pageField.get(key).getField().getType().getSimpleName().toUpperCase();
		    	if(fieldType.compareTo("DOUBLE")==0||fieldType.compareTo("FLOAT")==0||fieldType.compareTo("INT")==0) {
		    		val =Utility.format(pageField.get(key).getField().get(this.getMapModel()));
		    	}else {    		
		    		val = Utility.stringWithoutNull(String.valueOf(pageField.get(key).getField().get(this.getMapModel())));
		    	}   	
		    	if(pageField.get(key).getType().trim().toUpperCase().compareTo("TEXTAREA")==0) {
		    		this.setLineForm(Utility.stringWithoutNull(this.getLineForm())+
							"<div class='form-group row'><label class='col-sm-12 col-md-2 col-form-label'>"+pageField.get(key).getNameDisplay()+"</label><div class='col-sm-12 col-md-10'> <textarea name="+pageField.get(key).getField().getName()+" type='"+pageField.get(key).getType()+"' class='form-control'>"+val+"</textarea></div></div>"								
								);
		    	}else if(pageField.get(key).getType().trim().toUpperCase().compareTo("POPUP")==0) {
		    		this.setLineForm(Utility.stringWithoutNull(this.getLineForm())+
							"<div class='form-group row'>"
							+ "<label class='col-sm-12 col-md-2 col-form-label'>"+pageField.get(key).getNameDisplay()+"</label>"
							+ "<div class='col-sm-12 col-md-10'>"+
									"<div class='input-group'>" + 
										"<div class='input-group-prepend'>" + 
											"<a class='btn btn-secondary' onclick='openNewWindow(`"+pageField.get(key).getLink()+"`)' role='button'>Choisir</a>"
									   +"</div>"+ 
									   	"<input id='"+pageField.get(key).getField().getName()+"id'  type='text' class='form-control' "+pageField.get(key).getHtml()+">"+ 
									   	"<input id='"+pageField.get(key).getField().getName()+"lib' type='text' class='form-control' "+pageField.get(key).getHtml()+">"+ 
									   	"<input id='"+pageField.get(key).getField().getName()+"' name='"+pageField.get(key).getField().getName()+"' type='hidden' value='' class='form-control'>"+
									   	"</div>"
						    + "</div>"
						 + "</div>"								
								);
		    	}else {
		    		this.setLineForm(Utility.stringWithoutNull(this.getLineForm())+
							"<div class='form-group row'><label class='col-sm-12 col-md-2 col-form-label'>"+pageField.get(key).getNameDisplay()+"</label><div class='col-sm-12 col-md-10'> <input name="+pageField.get(key).getField().getName()+" class='form-control' value='"+val+"' type='"+pageField.get(key).getType()+"'/></div> </div>"								
								);
		    	}		    	
		    }
		}
		 
	}
}