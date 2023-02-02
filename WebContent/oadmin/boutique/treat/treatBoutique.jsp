<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.MapModel"%>
<%@ page import="main.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="front.*"%>
<% 
	if(request.getParameter("mode").compareTo("code_collecter")==0){
		String classPath = request.getParameter("class");
 		Class<?> t = Class.forName(classPath);
		CommandeMere commande = (CommandeMere) t.newInstance();
		commande.setId(request.getParameter("commande"));
		commande.affecterCodeCollecter(request.getParameter("code_collecter"));
 	} 
	if(request.getParameter("mode").compareTo("collecter")==0){
		String classPath = request.getParameter("class");
		Class<?> t = Class.forName(classPath);
		CommandeMere commande = (CommandeMere) t.newInstance();
		commande.collecter(null,request.getParameter("code_collecter"));
	} 
	if(request.getParameter("mode").compareTo("livrer")==0){
		String classPath = request.getParameter("class");
		Class<?> t = Class.forName(classPath);
		CommandeMere commande = (CommandeMere) t.newInstance();
		commande.livrer(null,request.getParameter("code_livraison"));
	} 

%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>