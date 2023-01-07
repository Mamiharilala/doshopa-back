<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.MapModel"%>
<%@ page import="main.*"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="front.*"%>
<% 
	if(request.getParameter("mode").compareTo("insert")==0){
		PageCreate pv = new PageCreate(new MapModel());
		pv.completeAllField(request);
		pv.getMapModel().insertIntoTable(null);
 	} 
 	if(request.getParameter("mode").compareTo("updateMultiple")==0){
 		String classPath = request.getParameter("classFille");
 		Class<?> t = Class.forName(classPath);
		MapModel instanceFille = (MapModel) t.newInstance();
		classPath = request.getParameter("classMere");
 		t = Class.forName(classPath);
		MapModel instanceMere = (MapModel) t.newInstance();
		instanceMere.setId(request.getParameter("idMere"));
 		PageUpdateMultiple pu = new PageUpdateMultiple(instanceMere, instanceFille, request.getParameter("fieldMere"));
		pu.saveUpdateMultiple(request);
	}

%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>