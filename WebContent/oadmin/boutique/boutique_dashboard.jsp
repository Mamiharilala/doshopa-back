<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="oadmin.BoutiqueDashboard"%>
<%@ page import="system.Utilisateur"%>

<% 
	BoutiqueDashboard dashboard = new BoutiqueDashboard();
	Utilisateur loggedIn = (Utilisateur) session.getAttribute("user");
%>
<div class="title pb-20">
	<h2 class="h3 mb-0">Tableau de bord</h2>
</div>

<div class="row pb-10">
	<% out.println(dashboard.dashboardDisplay(loggedIn)); %>
</div>