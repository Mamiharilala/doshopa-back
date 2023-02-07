<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="doshopa.BoutiqueDashboard"%>
<%@ page import="system.Utilisateur"%>

<% 
	BoutiqueDashboard dashboard = new BoutiqueDashboard();
	Utilisateur loggedIn = (Utilisateur) session.getAttribute("user");
	String boutiqueId = request.getParameter("id");
%>
<% out.println(dashboard.dashboardDisplay(loggedIn, boutiqueId)); %>