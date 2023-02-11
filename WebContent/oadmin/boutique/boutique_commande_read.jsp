<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="doshopa.*"%>
<%@ page import="system.*"%>
<%@ page import="java.util.*"%>
<% 
Utilisateur u = (Utilisateur)session.getAttribute("user");
BoutiqueCommande commande = new BoutiqueCommande();
commande.setCompleteTableName("commandeliste_boutique");
Categorie cat = new Categorie();
cat.setCompleteTableName("etat_commande");
Categorie[]etat =(Categorie[])Generalize.getListObject(cat, null);
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_commande_read.jsp" method="POST">	
		 <%
			 	PageSearch ps = new PageSearch(commande);
		 		ps.setVisibleEntry("id", false);
		 		ps.setType("etat", "SELECT");
		 		ps.setMutilpleKeyValue("etat","code","description");
		 		ps.setMutilpleData("etat", etat);
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
 				ps.setColDisplay(new String[]{"idmere","designation","quantite","pu","montant","code_collecter","date_fille","etatlib"});
				ps.setColRenameDisplay(new String[]{"Numéro de commande","Designation","quantité","pu","montant","code_collecter","Date","Etat"});
 				// field to redirect
				HashMap<String,String>map = new HashMap<String,String>();
 				map.put("designation","id");
 				map.put("idmere","idmere");
 				ps.setColRedirection(map);
 				// Href of redirect
 				map = new HashMap<String,String>();
 				map.put("designation","container.jsp?content=boutique/boutique_commande_fille_update.jsp&id=");
 				map.put("idmere","container.jsp?content=boutique/boutique_commande_mere_fille_update.jsp&idMere=");
 				ps.setColRedirectionHref(map);
 				
				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>
	</div>
</div>
 


