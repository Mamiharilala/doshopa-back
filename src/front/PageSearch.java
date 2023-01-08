package front;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import system.Generalize;
import system.MapModel;
import util.DBConnect;
import util.Utility;

public class PageSearch extends Page {
	String searchForm;
	String request;
	HashMap<String, PageField> intervalleField;
	String[] colDisplay;
	String[] colRenameDisplay;
	HashMap<String,String>colRedirection;
	HashMap<String,String>colRedirectionHref;
	MapModel[] data;
	int lenData;
	String resultDisplay;
	int totalRow = 5;

	public PageSearch(MapModel map) throws Exception {
		super(map);
		searchForm = "";
		intervalleField = new HashMap<String, PageField>();
	}

	public void chargeForm() throws Exception {
		// START SEARCH FORM
		this.setSearchForm(this.getSearchForm() + "<div class='row'>");
		String fieldType = "";
		String val = "";
		for (String key : pageField.keySet()) {
			if (pageField.get(key).isVisible()) {
				pageField.get(key).getField().setAccessible(true);
				fieldType = pageField.get(key).getField().getType().getSimpleName().toUpperCase();
				val = "";
				// val =
				// Utility.stringWithoutNull(String.valueOf(pageField.get(key).getField().get(this.getMapModel())));
				if (pageField.get(key).getType().trim().toUpperCase().compareTo("SELECT") == 0) {
					this.setSearchForm(
							Utility.stringWithoutNull(this.getSearchForm()) + "<div class='col-sm-12 col-md-6'>"
									+ "<div class='form-group'>" + "<label>" + pageField.get(key).getNameDisplay()
									+ "</label>" + "<select class='custom-select2 form-control'name='"
									+ pageField.get(key).getField().getName() + "'style='width: 100%; height: 38px'>"
									+ "<optgroup label='" + pageField.get(key).getNameDisplay() + "'>");
					String methodName = "";
					Method m = null;
					for (int i = 0; i < this.pageField.get(key).getMultipleData().length; i++) {
						// key
						methodName = this.pageField.get(key).getMultipleKey();
						methodName = "get" + (methodName.charAt(0) + "").toUpperCase() + (methodName.substring(1));
						m = this.pageField.get(key).getMultipleData()[i].getClass().getMethod(methodName, null);
						val += "<option value='" + m.invoke(this.pageField.get(key).getMultipleData()[i], null) + "'>";
						// value
						methodName = this.pageField.get(key).getMultipleValue();
						methodName = "get" + (methodName.charAt(0) + "").toUpperCase() + (methodName.substring(1));
						m = this.pageField.get(key).getMultipleData()[i].getClass().getMethod(methodName, null);
						val += m.invoke(this.pageField.get(key).getMultipleData()[i], null);
						val += "</option>";
					}
					this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm()) + val + "</optgroup>");
					this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm()) + "</select> </div></div>");
				} else if (pageField.get(key).getType().trim().toUpperCase().compareTo("TEXTAREA") == 0) {
					this.setLineForm(Utility.stringWithoutNull(this.getLineForm())
							+ "<div class='form-group row'><label class='col-sm-12 col-md-2 col-form-label'>"
							+ pageField.get(key).getNameDisplay()
							+ "</label><div class='col-sm-12 col-md-10'> <textarea name="
							+ pageField.get(key).getField().getName() + " type='" + pageField.get(key).getType()
							+ "' class='form-control'>" + val + "</textarea></div></div>");
				} else if (pageField.get(key).getType().trim().toUpperCase().compareTo("POPUP") == 0) {
					this.setLineForm(Utility.stringWithoutNull(this.getLineForm()) + "<div class='form-group row'>"
							+ "<label class='col-sm-12 col-md-2 col-form-label'>" + pageField.get(key).getNameDisplay()
							+ "</label>" + "<div class='col-sm-12 col-md-10'>" + "<div class='input-group'>"
							+ "<div class='input-group-prepend'>"
							+ "<a class='btn btn-secondary' onclick='openNewWindow(`" + pageField.get(key).getLink()
							+ "`)' role='button'>Choisir</a>" + "</div>" + "<input id='"
							+ pageField.get(key).getField().getName() + "id'  type='text' class='form-control'>"
							+ "<input id='" + pageField.get(key).getField().getName()
							+ "lib' type='text' class='form-control'>" + "<input id='"
							+ pageField.get(key).getField().getName() + "' name='"
							+ pageField.get(key).getField().getName() + "' type='hidden' value='' class='form-control'>"
							+ "</div>" + "</div>" + "</div>");
				} else {
					if (this.getIntervalleField().containsKey(key)) {
						this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm()) + "<input name='isint"
								+ pageField.get(key).getField().getName()
								+ "' type='hidden' class='form-control' value='1' />");
						this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm())
								+ "<div class='col-md-4 col-sm-12'><div class='form-group'><label>"
								+ pageField.get(key).getNameDisplay() + " Min</label><input name='"
								+ pageField.get(key).getField().getName() + "1' type='" + pageField.get(key).getType()
								+ "' class='form-control' value='" + val + "' /></div></div>");
						this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm())
								+ "<div class='col-md-4 col-sm-12'><div class='form-group'><label>"
								+ pageField.get(key).getNameDisplay() + " Max</label><input name='"
								+ pageField.get(key).getField().getName() + "2' type='" + pageField.get(key).getType()
								+ "' class='form-control' value='" + val + "' /></div></div>");
					} else {
						this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm()) + "<input name='isint"
								+ pageField.get(key).getField().getName()
								+ "' type='hidden' class='form-control' value='0' />");
						this.setSearchForm(Utility.stringWithoutNull(this.getSearchForm())
								+ "<div class='col-md-4 col-sm-12'><div class='form-group'><label>"
								+ pageField.get(key).getNameDisplay() + "</label><input name='"
								+ pageField.get(key).getField().getName() + "' type='" + pageField.get(key).getType()
								+ "' class='form-control' value='" + val + "' /></div></div>");
					}
				}
			}
		}
		// FIN SEARCH FORM

	}

	public void loadResult(HttpServletRequest request) throws Exception {
		String sql = "SELECT ";
		String where = " WHERE 1<2 ";
		Field[] fields = new Generalize().getCommonField(getMapModel(), null);
		String key = "";
		for (int i = 0; i < fields.length; i++) {
			key = fields[i].getName();
			if (request.getParameter("isint" + key) != null
					&& request.getParameter("isint" + key).trim().compareTo("1") == 0
					&& request.getParameter(key + "1") != null && request.getParameter(key + "2") != null
					&& request.getParameter(key + "1") != "" && request.getParameter(key + "2") != "") {
				where += " AND " + key + " >= '" + request.getParameter(key + "1") + "'";
				where += " AND " + key + " <= '" + request.getParameter(key + "2") + "'";
			} else if (request.getParameter(key) != null && request.getParameter(key).trim() != "") {
				where += " AND " + key + " = '" + request.getParameter(key) + "'";
			}
			if (fields[i].getName().toUpperCase().compareTo("SCHEMA") != 0
					&& fields[i].getName().compareTo("TABLENAME") != 0
					&& fields[i].getName().toUpperCase().compareTo("SEQUENCEPREFIXE") != 0
					&& fields[i].getName().toUpperCase().compareTo("SEQUENCENAME") != 0
					&& fields[i].getName().toUpperCase().compareTo("COMPLETETABLENAME") != 0) {
				sql += fields[i].getName() + ",";
			}
		}
		where += Utility.stringWithoutNull(this.getWhere());
		sql = sql.substring(0, sql.length() - 1);
		sql = sql + " FROM " + this.getMapModel().getCompleteTableName() + where;
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

	public String getSearchForm() {
		return searchForm;
	}

	public void setSearchForm(String searchForm) {
		this.searchForm = searchForm;
	}

	public HashMap<String, PageField> getIntervalleField() {
		return intervalleField;
	}

	public void setIntervalleField(HashMap<String, PageField> intervalleField) {
		this.intervalleField = intervalleField;
	}

	public void setIntervalle(String fieldName) {
		PageField pf = this.getPageField().get(fieldName);
		if (!this.getIntervalleField().containsKey(fieldName) && pf != null) {
			this.getIntervalleField().put(fieldName, pf);
		}
	}

	public String getRequest() {
		return request;
	}

	public String[] getColDisplay() {
		return colDisplay;
	}

	public void setColDisplay(String[] colDisplay) {
		this.colDisplay = colDisplay;
	}

	public void setRequest(String request) {
		this.request = request;
	}

	public MapModel[] getData() {
		return data;
	}

	public void setData(MapModel[] data) {
		this.data = data;
	}

	public void retrieveResult(HttpServletRequest request) throws Exception {
		Connection c = new DBConnect().getConnection();
		MapModel[] d = (MapModel[]) Generalize.getListObject(this.getMapModel(), this.getRequest(), c);
		this.setLenData(Generalize.getCountTable(this.getMapModel(), this.getWhere(), c));
		if (c != null) {
			c.close();
		}
		this.setData(d);
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

	public String[] getColRenameDisplay() {
		return colRenameDisplay;
	}

	public void setColRenameDisplay(String[] colRenameDisplay) {
		this.colRenameDisplay = colRenameDisplay;
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
			body += "<tr><th scope='row'>" + (i + 1) + "</th>";
			for (int j = 0; j < name.length; j++) {
				String ref = "";
				if(this.getColRedirection().containsKey(name[j])) {
					ref = "";
					methodName = "get" + (this.getColRedirection().get(name[j]).charAt(0) + "").toUpperCase() + (this.getColRedirection().get(name[j]).substring(1));
					m = this.getMapModel().getClass().getMethod(methodName, null);
					ref += m.invoke(data[i], null);
					ref = this.getColRedirectionHref().get(name[j])+""+ref;
					methodName = "get" + (name[j].charAt(0) + "").toUpperCase() + (name[j].substring(1));
					m = this.getMapModel().getClass().getMethod(methodName, null);
					body += "<td><a href='"+ref+"' style='color:#1b00ff;'>" + m.invoke(data[i], null) + "</a></td>";
				}else {
					methodName = "get" + (name[j].charAt(0) + "").toUpperCase() + (name[j].substring(1));
					m = this.getMapModel().getClass().getMethod(methodName, null);
					body += "<td>"+ m.invoke(data[i], null) + "</td>";
				}
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
		res += "<div class='paginate_button page-item previous' id='DataTables_Table_2_previous'>";
		res += "<a href='" + request.getRequestURL() + "" + cont
				+ "&currPage=1' aria-controls='DataTables_Table_2' data-dt-idx='0' tabindex='0' class='page-link'>";
		res += "<i class='ion-chevron-left'></i></a></div>";

		for (int i = 0; i < 5; i++) {
			if (tabPage[i] > 0 && tabPage[i] <= nbPage) {
				if (tabPage[i] == current) {
					res += "<div class='paginate_button page-item active'>";
					res += "<a href='" + request.getRequestURL() + "" + cont + "&currPage=" + tabPage[i]
							+ "' aria-controls='DataTables_Table_2' data-dt-idx='1' tabindex='0' class='page-link'>"
							+ tabPage[i] + "</a></div>";
				} else {
					res += "<div class='paginate_button page-item '>";
					res += "<a href='" + request.getRequestURL() + "" + cont + "&currPage=" + tabPage[i]+ "' aria-controls='DataTables_Table_2' data-dt-idx='2' tabindex='0' class='page-link'>"
							+ tabPage[i] + "</a></div>";
				}
			}
		}
		res += "<div class='paginate_button page-item next' id='DataTables_Table_2_next'>";
		res += "<a href='" + request.getRequestURL() + "" + cont + "&currPage=" + nbPage
				+ "' aria-controls='DataTables_Table_2' data-dt-idx='3' tabindex='0' class='page-link'><i class='ion-chevron-right'></i></a></div>";
		res += "</ul>";
		return res;
	}

	public int getLenData() {
		return lenData;
	}

	public void setLenData(int lenData) {
		this.lenData = lenData;
	}

	public HashMap<String,String> getColRedirection() {
		return colRedirection;
	}

	public void setColRedirection(HashMap<String,String>map) {
		this.colRedirection = map;
	}
	public HashMap<String,String> getColRedirectionHref() {
		return colRedirectionHref;
	}

	public void setColRedirectionHref(HashMap<String,String>map) {
		this.colRedirectionHref = map;
	}
	
}