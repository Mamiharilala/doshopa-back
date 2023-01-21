package front;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import system.Generalize;
import system.MapModel;
import util.Utility;

public class Page {
	MapModel mapModel;
	HashMap<String,PageField>pageField;
	String lineForm;
	String where;
	String afterPage;
	public Page() {
		
	}
	public Page(MapModel map) throws Exception {
		lineForm = "";
		this.setMapModel(map);
		this.setWhere(" AND 1<2 ");
		pageField = new HashMap<String,PageField>();
		load();
	}
 
	public void setVisibleEntry(String fieldName,boolean val) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
			pf.setVisible(false);
			this.getPageField().put(fieldName, pf);
 		}
	}
	public void setMutilpleData(String fieldName,MapModel[]data) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
 			pf.setMultipleData(data);
			this.getPageField().put(fieldName, pf);
 		}
	} 
	public void setMutilpleKeyValue(String fieldName,String key,String value) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
 			pf.setMultipleKey(key);
 			pf.setMultipleValue(value);
			this.getPageField().put(fieldName, pf);
 		}
	} 
	public void setType(String fieldName,String type) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
			pf.setType(type);
			this.getPageField().put(fieldName, pf);
 		}
	} 
	public void setLink(String fieldName,String link) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
			pf.setLink(link+"&fieldchoice="+fieldName);
 			this.getPageField().put(fieldName, pf);
 		}
	}
	public void setNameDisplay(String fieldName,String lib) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
			pf.setNameDisplay(lib);;
			this.getPageField().put(fieldName, pf);
 		}
	} 
	public void setHtml(String fieldName,String html) {
		PageField pf =pageField.get(fieldName);
 		if(pf!=null) {
			pf.setHtml(html);
			this.getPageField().put(fieldName, pf);
 		}
	} 
	public MapModel getMapModel() {
		return mapModel;
	}
	public void setMapModel(MapModel mapModel) {
		this.mapModel = mapModel;
	}
	public HashMap<String,PageField> getPageField() {
		return pageField;
	}
	public void setPageField(HashMap<String,PageField> pageField) {
		this.pageField = pageField;
	}
	public String getLineForm() {
		return lineForm;
	}
	public void setLineForm(String lineForm) {
		this.lineForm = lineForm;
	}
	
	public void load() throws Exception {
		Field[]fields = new Generalize().getCommonField(mapModel,null);
 		PageField pf = null;
		String methodName = "";
		for(int i=0;i<fields.length;i++) {
			if (   fields[i].getName().toUpperCase().compareTo("SCHEMA") != 0 && fields[i].getName().toUpperCase().compareTo("TABLENAME") != 0
					&& fields[i].getName().toUpperCase().compareTo("SEQUENCEPREFIXE") != 0
					&& fields[i].getName().toUpperCase().compareTo("SEQUENCENAME") != 0
					&& fields[i].getName().toUpperCase().compareTo("COMPLETETABLENAME") != 0) {
				pf = new PageField();
				pf.setNameDisplay(fields[i].getName());
				pf.setVisible(true);
				pf.setField(fields[i]);
				pf.setType("text");
				pageField.put(fields[i].getName(), pf);
			}
		}
	}
	public void completeAllField(HttpServletRequest request) throws Exception {
		String classPath = request.getParameter("class");
		Class <?> t = Class.forName(classPath);
 		this.setMapModel((MapModel)t.newInstance());
		Field[]fields = this.getMapModel().getAllFields();
		String fieldName = "";
		String typeSimpleName = "";
		String methodName = "";
		Method m = null;
		for(int i=0;i<fields.length;i++){
			fieldName = fields[i].getName();
			typeSimpleName = fields[i].getType().getSimpleName().toUpperCase();
			methodName = "set" + (fieldName.charAt(0) + "").toUpperCase() + (fieldName.substring(1));
			m = this.getMapModel().getClass().getMethod(methodName, new Class[] { fields[i].getType() });
			if(request.getParameter(fieldName)!=null){
				if (typeSimpleName.compareTo("STRING") == 0) {
					m.invoke(getMapModel(), request.getParameter(fieldName));
				} else if (typeSimpleName.compareTo("DOUBLE") == 0) {
					m.invoke(getMapModel(), Double.parseDouble(request.getParameter(fieldName)));
				} else if (typeSimpleName.compareTo("FLOAT") == 0) {
					m.invoke(getMapModel(), Float.parseFloat(request.getParameter(fieldName)));
				} else if (typeSimpleName.compareTo("DATE") == 0) {
					//System.out.println("   "+request.getParameter(fieldName));
					m.invoke(getMapModel(), Date.valueOf(request.getParameter(fieldName)));
				}else if (typeSimpleName.compareTo("INT") == 0||typeSimpleName.compareTo("INTEGER") == 0) {
					m.invoke(getMapModel(), Integer.parseInt(request.getParameter(fieldName)));
				}else if (typeSimpleName.compareTo("BOOLEAN") == 0) {
					m.invoke(getMapModel(), Boolean.parseBoolean(request.getParameter(fieldName)));
				}
			}
		}
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getAfterPage() {
		return afterPage;
	}

	public void setAfterPage(String afterPage) {
		this.afterPage = afterPage;
	}
	
}
