<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Article"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="system.*"%>
<% 
try{
Article p = new Article();
p.setCompleteTableName("article_libcomplet");

String boutiqueID = "";
Utilisateur u = (Utilisateur) session.getAttribute("user");
if (u != null){
	if (u.getBoutique_id() != null){
		boutiqueID = " and boutique_id = '" + u.getBoutique_id() + "'";	
	}
}
%>
<form action="${pageContext.request.contextPath}/container.jsp?content=produit/produit_read.jsp" method="POST">	
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	
		 <%
			 	PageSearch ps = new PageSearch(p);
		 		ps.setWhere(boutiqueID);
		 		ps.setVisibleEntry("id", false);
		 		ps.setVisibleEntry("etat", false);
		 		ps.setVisibleEntry("image", false);
		 		if (boutiqueID.compareTo("") != 0){
		 			ps.setVisibleEntry("boutique_id", false);
			 		ps.setVisibleEntry("boutique_denomination", false);
		 		}
		 		ps.setNameDisplay("quantite", "Quantit&eacute;");
		 		ps.setNameDisplay("reference", "R&eacute;f&eacute;rence");
		 		ps.setNameDisplay("boutique_denomination", "D&eacute;nomination Boutique");
		 		ps.setNameDisplay("devise_id", "Devise (ID)");
		 		ps.setNameDisplay("designation", "D&eacute;signation");
		 		ps.setNameDisplay("categorie_id", "Cat&eacute;gorie (ID)");
		 		ps.chargeForm();
			 	out.println(ps.getSearchForm());
			 	ps.loadResult(request);
			 %>	
		<input type="hidden" class="form-control" value="search" name="mode">

</div>
<!-- horizontal Basic Forms End -->
 <!-- horizontal Basic Forms End -->
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
		</div>
	</div>
<!-- Responsive tables Start -->
<div class="pd-20 mb-30"> 
	<div class="table-responsive">
		<table class="table table-striped">
			<% 
				ps.setColDisplay(new String[]{"designation","reference","prix","devise_id","quantite","observation","categorie_id","boutique_denomination"});
				ps.setColRenameDisplay(new String[]{"D?signation","R?f?rence","Prix","Devise","Quantit?","Observation","Cat?gorie","Boutique"});
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
</form>
<% }catch(Exception e){%>
<script language="JavaScript"> 
	alert("<%=e.getMessage()%>");
    history.back();
</script>
<%
	}
%>