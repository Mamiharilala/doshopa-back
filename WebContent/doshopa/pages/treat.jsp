<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="main.*"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="front.*"%>
<%@ page import="doshopa.*"%>
<% 
	Utilisateur u = (Utilisateur)session.getAttribute("user");
	if(u==null){
		response.sendRedirect(request.getContextPath()+"/login");
	}else{
		if(request.getParameter("mode").compareTo("purchache_product")==0){
 		 	u.acheterArticle(request.getParameter("ref_object"));
	 	}
	}
	
%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>