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
	if(request.getParameter("mode").compareTo("update")==0){
		PageCreate pv = new PageCreate(new MapModel());
		pv.completeAllField(request);
		pv.getMapModel().setId(request.getParameter("id"));
		pv.getMapModel().updateIntoTable(null);
	}
	if(request.getParameter("mode").compareTo("delete")==0){
		MapModel map = new MapModel();
		map.setId(request.getParameter("id"));
		map.deleteIntoTable(null);
	} 
%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>