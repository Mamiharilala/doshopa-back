package front;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import system.Generalize;
import system.MapModel;
import util.DBConnect;
import util.Utility;

public class PageUpdateMultiple extends PageUpdate {
	MapModel[] fille;
	MapModel classFille;
	String fieldMere;
	String request;
	String[] colDisplay;
	String[] colRenameDisplay;
	MapModel[] data;
	int lenData;
	int totalRow = 10;
	String resultDisplay;
	String afterPageFille;
	HashMap<String,PageField> pageFieldFille;

	public PageUpdateMultiple(MapModel mere, MapModel fille, String fieldmere) throws Exception {
		super(mere);
		this.setFieldMere(fieldmere);
		this.setClassFille(fille);
		this.setWhere(" AND " + this.getFieldMere() + " = '" + this.getMapModel().getId() + "'");
		this.setPageFieldFille(new HashMap<String,PageField>());
		loadFille();
	}
	public void loadFille() throws Exception {
		Field[]fields = Generalize.getCommonField(this.getClassFille(),null);
 		PageField pf = null;
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
				pageFieldFille.put(fields[i].getName(), pf);
			}
		}
	}
	public void loadResult(HttpServletRequest request) throws Exception {
		String sql = "SELECT *";
		sql = sql + " FROM " + this.getClassFille().getCompleteTableName() + " where 1<2 " + this.getWhere();
		if (request.getParameter("currPage") == null || request.getParameter("currPage").compareTo("null") == 0
				|| request.getParameter("currPage").compareTo("") == 0) {
			sql += " LIMIT " + this.getTotalRow() + " OFFSET 0 ";
		} else {
			sql += " LIMIT " + this.getTotalRow() + " OFFSET "
					+ (Integer.parseInt(request.getParameter("currPage")) - 1) * this.getTotalRow();
		}
		// System.out.println(sql);
		this.setRequest(sql);
		retrieveResult(request);
	}

	public void retrieveResult(HttpServletRequest request) throws Exception {
		Connection c = new DBConnect().getConnection();
		MapModel[] d = (MapModel[]) Generalize.getListObject(this.getClassFille(), this.getRequest(), c);
		this.setLenData(Generalize.getCountTable(this.getClassFille(), this.getWhere(), c));
		if (c != null) {
			c.close();
		}
		this.setData(d);
	}

	public void prepareData(HttpServletRequest request) throws Exception {
		this.setResultDisplay("");
		String[] name = this.getColRenameDisplay();
		String header = "<thead><tr><th scope='col'>#</th>";
		for (int i = 0; i < name.length; i++) {
			header += "<th scope='col'>" + name[i] + "</th>";
		}
		header += "</tr></thead>";
		name = this.getColDisplay();
		MapModel[] data = this.getData();
		String body = "<tbody>";
		Method m = null;
		Object obj = null;
		String methodName = "";
		for (int i = 0; i < data.length; i++) {
			body += "<tr><th scope='row'>"
					+ "<a target='_blank' href='"+this.getAfterPageFille()+"&id="+data[i].getId()+"'><i class='icon-copy dw dw-edit-1'></i></a>"  + "</th>";
			for (int j = 0; j < name.length; j++) {
				methodName = "get" + (name[j].charAt(0) + "").toUpperCase() + (name[j].substring(1));
				m = this.getClassFille().getClass().getMethod(methodName, null);
				body += "<td>" +this.getValueWithFormat(name[j], m.invoke(data[i], null))  + "</td>";
			}
			body += "</tr>";
		}
		this.setResultDisplay(header + body);
	}

	public String getFooter(HttpServletRequest request) {
		String page = request.getParameter("currPage");
		int current = 1;
		if (page != null && page.trim().compareTo("") != 0 && page.trim().compareTo("null") != 0) {
			current = Integer.parseInt(page.trim());
		}
		MapModel[] data = this.getData();
		int[] tabPage = new int[5];
		tabPage[2] = current;
		tabPage[3] = current + 1;
		tabPage[4] = current + 2;
		tabPage[1] = current - 1;
		tabPage[0] = current - 2;
		int nbPage = (int) Math.ceil((double) this.getLenData() / (double) this.getTotalRow());
		String res = "<div class='blog-pagination mb-30'>"
				+ "				<div class='btn-toolbar justify-content-center mb-15'>"
				+ "					<div class='btn-group'>";
		Map<String, String[]> parameters = request.getParameterMap();
		String cont = "?";
		String paramName = "";
		Enumeration in = request.getParameterNames();
		while (in.hasMoreElements()) {
			paramName = in.nextElement().toString();
			if (paramName.trim().compareTo("currPage") != 0) {
				cont += "&" + paramName + "=" + request.getParameter(paramName);
			}
		}
		res+="<div class='paginate_button page-item previous' id='DataTables_Table_2_previous'>";
				res+="<a href='" + request.getRequestURL() + "" + cont + "&currPage=1' aria-controls='DataTables_Table_2' data-dt-idx='0' tabindex='0' class='page-link'>";
				res+="<i class='ion-chevron-left'></i></a></div>";
	 
 
		for (int i = 0; i < 5; i++) {
			if (tabPage[i] > 0 && tabPage[i] <= nbPage) {
				if (tabPage[i] == current) {
						res+="<div class='paginate_button page-item active'>";
						res+="<a href='" + request.getRequestURL() + "" + cont + "&currPage=" + tabPage[i]+ "' aria-controls='DataTables_Table_2' data-dt-idx='1' tabindex='0' class='page-link'>" + tabPage[i] + "</a></div>"; 
				} else {
					res += "<div class='paginate_button page-item '>";
					res += "<a href='" + request.getRequestURL() + "" + cont + "&currPage=" + tabPage[i]+ "' aria-controls='DataTables_Table_2' data-dt-idx='2' tabindex='0' class='page-link'>"
							+ tabPage[i] + "</a></div>";
				}
			}
		}
		res += "<div class='paginate_button page-item next' id='DataTables_Table_2_next'>";
				res+="<a href='" + request.getRequestURL() + "" + cont + "&currPage=" + nbPage+ "' aria-controls='DataTables_Table_2' data-dt-idx='3' tabindex='0' class='page-link'><i class='ion-chevron-right'></i></a></div>";
		res += "</ul>";
		return res;
	}
 
	public String getFieldMere() {
		return fieldMere;
	}

	public void setFieldMere(String fieldMere) {
		this.fieldMere = fieldMere;
	}

	public MapModel[] getFille() {
		return fille;
	}

	public void setFille(MapModel[] fille) {
		this.fille = fille;
	}

	public String getRequest() {
		return request;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public String[] getColDisplay() {
		return colDisplay;
	}

	public void setColDisplay(String[] colDisplay) {
		this.colDisplay = colDisplay;
	}

	public String[] getColRenameDisplay() {
		return colRenameDisplay;
	}

	public MapModel getClassFille() {
		return classFille;
	}

	public void setClassFille(MapModel classFille) {
		this.classFille = classFille;
	}

	public void setColRenameDisplay(String[] colRenameDisplay) {
		this.colRenameDisplay = colRenameDisplay;
	}

	public MapModel[] getData() {
		return data;
	}

	public void setData(MapModel[] data) {
		this.data = data;
	}

	public int getLenData() {
		return lenData;
	}

	public void setLenData(int lenData) {
		this.lenData = lenData;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public String getResultDisplay() {
		return resultDisplay;
	}

	public void setResultDisplay(String resultDisplay) {
		this.resultDisplay = resultDisplay;
	}

	public HashMap<String, PageField> getPageFieldFille() {
		return pageFieldFille;
	}

	public void setPageFieldFille(HashMap<String, PageField> pageFieldFille) {
		this.pageFieldFille = pageFieldFille;
	}

	public String getAfterPageFille() {
		return afterPageFille;
	}

	public void setAfterPageFille(String afterPageFille) {
		this.afterPageFille = afterPageFille;
	}
	public Object getValueWithFormat(String nameField,Object o) {
		if(this.getPageFieldFille().get(nameField)!=null&&Utility.stringWithoutNull(this.getPageFieldFille().get(nameField).getFormat()).compareTo("money")==0) {
			return Utility.format(o);
		}
		if(this.getPageFieldFille().get(nameField)!=null&&Utility.stringWithoutNull(this.getPageFieldFille().get(nameField).getFormat()).compareTo("date")==0) {
			return Utility.getFormatDate((java.sql.Date)o);
		}
		return o;
	}
	public void setFormatEntryFille(String fieldName,String format) {
		PageField pf = getPageFieldFille().get(fieldName);
 		if(pf!=null) {
 			pf.setFormat(format);
			this.getPageFieldFille().put(fieldName, pf);
 		}
	}
}
