<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.BoutiqueDashboard"%>
<%@ page import="system.Utilisateur"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="doshopa.*"%>
<%@ page import="system.*"%>
<%@ page import="java.util.*"%>
<% 
	BoutiqueDashboard dashboard = new BoutiqueDashboard();
	dashboard.setCompleteTableName("dashboarddata_lib");
%>


<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/dashboard_global_read.jsp" method="POST">	
		 <%
			 	PageSearch ps = new PageSearch(dashboard);
		 		//ps.setVisibleEntry("id", false);
		 		ps.setNameDisplay("total_blog", "Total des blogs");
		 		ps.setNameDisplay("utilisateur_id", "Utilisateur (ID)");
		 		ps.setNameDisplay("boutique_id", "Boutique (ID)");
		 		ps.setNameDisplay("boutique_denomination", "D&eacute;nomination Boutique");
		 		ps.setNameDisplay("quantite_vente", "Quantit&eacute; de ventes");
		 		ps.setNameDisplay("chiffre_affaires", "Chiffre d'affaires");
		 		ps.setNameDisplay("total_promotions", "Total des promotions");
		 		ps.setNameDisplay("total_views", "Total des vues");
		 		ps.setNameDisplay("commande_en_cours", "Commande en cours");
		 		ps.setNameDisplay("total_articles", "Total des articles");
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
 				ps.setColDisplay(new String[]{"boutique_id", "boutique_denomination", "commande_en_cours", "quantite_vente", "chiffre_affaires", "total_views", "total_articles", "total_promotions", "total_blog"});
				ps.setColRenameDisplay(new String[]{"Identification", "Dénomination", "Commande en cours", "Vente totales", "Chiffre d'Affaires", "Vues", "Articles", "Promotions", "Blogs"});
 				// field to redirect
				HashMap<String,String>map = new HashMap<String,String>();
 				map.put("boutique_id","boutique_id");
 				ps.setColRedirection(map);
 				// Href of redirect
 				map = new HashMap<String,String>();
 				map.put("boutique_id","container.jsp?content=boutique/boutique_dashboard.jsp?id=");
 				ps.setColRedirectionHref(map);		
				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>
	</div>
</div>
 


