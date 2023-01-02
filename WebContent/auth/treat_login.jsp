<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="front.*"%>
<%
	Utilisateur u = new Utilisateur();
	boolean val = u.treatLogin(request.getParameter("login"),request.getParameter("pwd"));
	if(val){
		session.setAttribute("user", u);
		response.sendRedirect("../container.jsp?content=produit/produit_read.jsp");
	}else{
		out.println("Echec d'authentification");
	}
	
	 
%>