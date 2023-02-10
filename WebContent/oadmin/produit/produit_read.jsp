<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Article"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="system.*"%>
<% 
Article p = new Article();
p.setCompleteTableName("article_libcomplet");

String boutiqueID = "and 1<2";
Utilisateur u = (Utilisateur) session.getAttribute("user");
if (u != null){
	if (u.getBoutique_id() != null){
		boutiqueID = " and boutique_id = '" + u.getBoutique_id() + "'";		
	}
}

%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/container.jsp?content=produit/produit_read.jsp" method="POST">	
		 <%
			 	PageSearch ps = new PageSearch(p);
		 		ps.setWhere(boutiqueID);
		 		ps.setVisibleEntry("id", false);
		 		ps.setVisibleEntry("etat", false);
		 		ps.setVisibleEntry("image", false);
		 		ps.setNameDisplay("quantite", "Quantit&eacute;");
		 		ps.setNameDisplay("reference", "R&eacute;f&eacute;rence");
		 		ps.chargeForm();
			 	out.println(ps.getSearchForm());
			 	ps.loadResult(request);
			 %>	
		<input type="hidden" class="form-control" value="search" name="mode">
 		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
	</form>
</div>
<!-- horizontal Basic Forms End -->
 
<!-- Responsive tables Start -->
<div class="pd-20 mb-30"> 
	<div class="table-responsive">
		<table class="table table-striped">
			<% 
				ps.setColDisplay(new String[]{"designation","reference","prix","devise_id","quantite","observation","categorie_id","boutique_denomination"});
				ps.setColRenameDisplay(new String[]{"Désignation","Référence","Prix","Devise","Quantité","Observation","Catégorie","Boutique"});
				HashMap<String,String>map = new HashMap<String,String>();
  				ps.setColRedirection(map);
 				// Href of redirect
 				map = new HashMap<String,String>();
 				ps.setColRedirectionHref(map);
				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>	
	</div>
</div>
 
