<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="system.*"%>
<%
	String boutiqueID = "";
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	CommandeMere p = new CommandeMere();
	p.setId(request.getParameter("idMere"));
	// Validation
	Categorie etatCat = new Categorie();
	etatCat.setCompleteTableName("etat_commande");
	Categorie[] etat = (Categorie[]) Generalize.getListObject(etatCat, null);
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item">Boutique</li>
					<li class="breadcrumb-item"><a href="index.html">Commande</a></li>
					<li class="breadcrumb-item active" aria-current="page">Détail de commande</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<form action="${pageContext.request.contextPath}/treat.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">
		<%
			CommandeFille fille = new CommandeFille();
			fille.setCompleteTableName("commande_fillecomplet");
			PageUpdateMultiple pv = new PageUpdateMultiple(p, fille, "mere");
			pv.setVisibleEntry("remarque", false);
			pv.setVisibleEntry("remarque", false);
			pv.setWhere(" and etat >=10 ");
			pv.setHtml("date_mere", "readonly");
			pv.setHtml("id", "readonly");
			pv.setHtml("utilisateur_id", "readonly");
			pv.setNameDisplay("id", "Numéro de commande");
			pv.setNameDisplay("date_mere", "Date mère");
			pv.setNameDisplay("etat", "Status");
			pv.setNameDisplay("frais_livraison", "Frais de livraison");
			pv.setNameDisplay("lieu_livraison", "Lieu de livraison");
			pv.setFormatEntryFille("pu", "money");
			pv.setFormatEntryFille("quantite", "money");
			pv.setFormatEntryFille("date_fille", "date");
			pv.setType("etat", "SELECT");
			pv.setMutilpleKeyValue("etat", "code", "description");
			pv.setMutilpleData("etat", etat);
			pv.setAfterPageFille("container.jsp?content=boutique/boutique_commande_fille_update.jsp&mode=update");
			pv.chargeForm();
			out.println(pv.getLineForm());
			pv.loadResult(request);
		%>

	</div>
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_commande_mere_update.jsp&id=<%=p.getId()%>"><button type="button" class="btn btn-warning btn-lg text-light btn-block">Modifier</button></a>
		</div>
	</div><br>
	<div class="pd-20 mb-30 card-box">
		<div class="table-responsive">
			<table class="table table-striped">
				<%
					pv.setColDisplay(new String[] { "article_id","designation", "quantite", "pu", "date_fille", "etatlib" });
					pv.setColRenameDisplay(new String[] { "ID Article","designation", "quantit&eacute;", "PU", "date" , "status"});
					pv.prepareData(request);
					out.println(pv.getResultDisplay());
				%>
			</table>

		</div>
		<br>
		<%=pv.getFooter(request)%>
	</div>
 
</form>
