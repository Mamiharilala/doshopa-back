<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.BoutiqueDashboard"%>
<%@ page import="system.Utilisateur"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="oadmin.*"%>
<%@ page import="system.*"%>
<%@ page import="java.util.*"%>
<% 
	BoutiqueDashboard dashboard = new BoutiqueDashboard();
	dashboard.setCompleteTableName("dashboarddata_lib");
%>


<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/container.jsp?content=boutique/tableau_bord_global_read.jsp" method="POST">	
		 <%
			 	PageSearch ps = new PageSearch(dashboard);
		 		//ps.setVisibleEntry("id", false);
 		 		ps.chargeForm();
			 	out.println(ps.getSearchForm());
			 	ps.loadResult(request);
			 %>	
		<input type="hidden" class="form-control" value="search" name="mode">
 		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
	</form>
</div>
  
 <div class="pd-20 mb-30"> 
	<div class="table-responsive">
		<table class="table table-striped">
			<% 
 				ps.setColDisplay(new String[]{"boutique_denomination", "commande_en_cours", "quantite_vente", "chiffre_affaires", "total_views", "total_articles", "total_promotions", "total_blog"});
				ps.setColRenameDisplay(new String[]{"boutique_denomination", "commande_en_cours", "quantite_vente", "chiffre_affaires", "total_views", "total_articles", "total_promotions", "total_blog"});
 				// field to redirect
				HashMap<String,String>map = new HashMap<String,String>();
 				map.put("id","id");
 				ps.setColRedirection(map);
 				// Href of redirect
 				map = new HashMap<String,String>();
 				map.put("boutique_denomination","container.jsp?content=boutique/boutique_dashboard.jsp?id=");
 				ps.setColRedirectionHref(map);		
				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>
	</div>
</div>
 


