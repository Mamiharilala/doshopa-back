<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Article"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>
<% 
Article p = new Article();
p.setCompleteTableName("article_libcomplet");
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/container.jsp?content=produit/produit_read.jsp" method="POST">	
		 <%
			 	PageSearch ps = new PageSearch(p);
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
				ps.setColRenameDisplay(new String[]{"designation","reference","prix","devise_id","quantite","observation","categorie_id","boutique"});
				HashMap<String,String>map = new HashMap<String,String>();
  				ps.setColRedirection(map);
 				// Href of redirect
 				map = new HashMap<String,String>();
				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>	
	</div>
</div>
 
