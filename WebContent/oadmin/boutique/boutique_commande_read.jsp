<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="doshopa.*"%>
<%@ page import="system.*"%>
<%@ page import="java.util.*"%>
<%
	String boutiqueID = "";
	Utilisateur u = (Utilisateur) session.getAttribute("user");

	BoutiqueCommande commande = new BoutiqueCommande();
	commande.setCompleteTableName("commandeliste");

	if (u != null) {
		if (u.getBoutique_id() != null && !u.isAdmin()) {
			boutiqueID = " and boutique_id = '" + u.getBoutique_id() + "'";
			commande.setCompleteTableName("commandeliste_boutique");
		}
	}

	Categorie cat = new Categorie();
	cat.setCompleteTableName("etat_commande");
	Categorie[] etat = (Categorie[]) Generalize.getListObject(cat, null);
%>
<form
	action="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_commande_read.jsp"
	method="POST">
	<!-- horizontal Basic Forms Start -->
	<div class="pd-20 card-box mb-30">

		<%
			PageSearch ps = new PageSearch(commande);
			ps.setWhere(boutiqueID);
			ps.setVisibleEntry("id", false);
			ps.setVisibleEntry("remarque", false);
			ps.setType("etat", "SELECT");
			ps.setMutilpleKeyValue("etat", "code", "description");
			ps.setMutilpleData("etat", etat);
			ps.setVisibleEntry("utilisateur_id", false);
			ps.setNameDisplay("pu", "Prix Unitaire");
			ps.setNameDisplay("idmere", "Num&eacute;ro Commande");
			ps.setNameDisplay("article_id", "ID Article");
			ps.setVisibleEntry("date_fille", false);
			ps.setNameDisplay("designation", "D&eacute;signation");
			ps.setNameDisplay("date_mere", "Date");
			ps.setNameDisplay("commande_type", "Type de la commande");
			ps.setVisibleEntry("commande_type", false);
			ps.setVisibleEntry("quantite", false);
			ps.setVisibleEntry("quantite", false);
			ps.setVisibleEntry("etatlib", false);
			ps.setVisibleEntry("devise_id", false);
			ps.setNameDisplay("code_collecter", "Code collecter");
			ps.setNameDisplay("etat", "status");
			ps.setNameDisplay("quantite", "Quantit&eacute;");
			ps.setFormatEntry("date_mere", "date");
			ps.setFormatEntry("quantite", "money");
			ps.setFormatEntry("montant", "money");
			ps.setFormatEntry("pu", "money");
			ps.chargeForm();
			out.println(ps.getSearchForm());
			ps.loadResult(request);
		%>
		<input type="hidden" class="form-control" value="search" name="mode">

	</div>
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
		</div>
	</div>
</form>
<div class="pd-20 mb-30">
	<div class="table-responsive">
		<table class="table table-striped">
			<%
				ps.setColDisplay(new String[] { "idmere","article_id", "designation", "quantite", "pu", "montant", "code_collecter",
						"date_mere", "etatlib" });
				ps.setColRenameDisplay(new String[] { "Num&eacute;ro de commande","ID Article", "D&eacute;signation", "Quantit&eacute;",
						"P.U", "Montant", "Code collecter", "Date", "Status" });
				// field to redirect
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("designation", "id");
				map.put("idmere", "idmere");
				ps.setColRedirection(map);
				// Href of redirect
				map = new HashMap<String, String>();
				map.put("designation", "container.jsp?content=boutique/boutique_commande_fille_update.jsp&id=");
				map.put("idmere", "container.jsp?content=boutique/boutique_commande_mere_fille_update.jsp&idMere=");
				ps.setColRedirectionHref(map);

				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>
	</div>
</div>



