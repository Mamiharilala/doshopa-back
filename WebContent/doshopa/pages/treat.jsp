<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="main.*"%>
<%@ page import="java.lang.reflect.Field"%>
<%@ page import="front.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<% 
	try{
	Utilisateur u = (Utilisateur)session.getAttribute("user");
	if(u==null){
		response.sendRedirect(request.getContextPath()+"/login");
	}else{
		if(request.getParameter("mode").compareTo("purchache_product")==0){
 		 	u.acheterArticle(request.getParameter("ref_object"));
	 	}
		if(request.getParameter("mode").compareTo("purchache_promotion")==0){
 		 	u.acheterPromotion(request.getParameter("ref_object"));
	 	}
		if(request.getParameter("mode").compareTo("update_order")==0){
 			String[]numero = request.getParameterValues("numero");
   	        for(int i=0;i<numero.length;i++){
   	        	if(Utility.stringWithoutNull(request.getParameter("commande_checkbox"+numero[i])).compareTo("")!=0){
   	        		u.changeCommandeFille(request.getParameter("idpanier"+numero[i]),Double.valueOf(request.getParameter("quantite"+numero[i])));
   	        	}	 
  	        }
 	 	}
		if(request.getParameter("mode").compareTo("remove_order")==0){
 			String[]numero = request.getParameterValues("numero");
   	        for(int i=0;i<numero.length;i++){
   	        	if(Utility.stringWithoutNull(request.getParameter("commande_checkbox"+numero[i])).compareTo("")!=0){
   	        		u.removeCommandeFille(request.getParameter("idpanier"+numero[i]));
   	        	}	 
  	        }
 	 	}
		if(request.getParameter("mode").compareTo("confirm_purchase")==0){
			String localisation = request.getParameter("localisation");
			System.out.println(request.getParameter("localisation_checkbox"));
			if(request.getParameter("localisation_checkbox")!=null){
				localisation = request.getParameter("another_localisation");
			}
			String ref = request.getParameter("ref");
			String contact = request.getParameter("contact");
			u.validerAchat(ref,contact,localisation);
 	 	}
		if(request.getParameter("mode").compareTo("logout")==0){
			session.removeAttribute("user");
			session.invalidate();
 	 	} 
	}
	
%>
<script>window.location.replace('<%=request.getParameter("after")%>');</script>
<%
} catch (Exception e) {
		e.printStackTrace();
%>
<script language="JavaScript"> 
	alert("<%=e.getMessage()%>");
    history.back();
</script>
<%
	}
%>