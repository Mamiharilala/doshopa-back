<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="main.*"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="front.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<% 
	Utilisateur u = (Utilisateur)session.getAttribute("user");
	if(u==null){
		response.sendRedirect(request.getContextPath()+"/login");
	}else{
		if(request.getParameter("mode").compareTo("purchache_product")==0){
 		 	u.acheterArticle(request.getParameter("ref_object"));
	 	}
		if(request.getParameter("mode").compareTo("update_order")==0){
 			String[]numero = request.getParameterValues("numero");
   	        for(int i=0;i<numero.length;i++){
   	        	if(Utility.stringWithoutNull(request.getParameter("commande_checkbox"+numero[i])).compareTo("")!=0){
   	        		u.changeCommandeFille(request.getParameter("idpanier"+numero[i]),Double.valueOf(request.getParameter("quantite"+numero[i])));
   	        	}	 
  	        }
 	 	}
		if(request.getParameter("mode").compareTo("validate_order")==0){
 			String[]numero = request.getParameterValues("numero");
   	        for(int i=0;i<numero.length;i++){
   	        	if(Utility.stringWithoutNull(request.getParameter("commande_checkbox"+numero[i])).compareTo("")!=0){
   	        		u.validerCommandeFille(request.getParameter("idpanier"+numero[i]));
   	        	}	 
  	        }
 	 	}
		if(request.getParameter("mode").compareTo("validate_all_order")==0){
			u.validerTousCommandeFille();   
 	 	}
	}
	
%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>