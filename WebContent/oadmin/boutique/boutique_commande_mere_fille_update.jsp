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
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Boutique</a></li>
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
			fille.setCompleteTableName("commande_fille");
			PageUpdateMultiple pv = new PageUpdateMultiple(p, fille, "mere");
 			pv.setVisibleEntry("etat", false);
			pv.setVisibleEntry("remarque", false);
			pv.setVisibleEntry("remarque", false);
			pv.setHtml("date_mere", "readonly");
			pv.setHtml("id", "readonly");
			pv.setHtml("utilisateur_id", "readonly");
			pv.setNameDisplay("id", "Numéro de commande");
			pv.setFormatEntryFille("pu", "money");
			pv.setFormatEntryFille("quantite", "money");
			pv.setFormatEntryFille("date_fille", "date");
			pv.setAfterPageFille("container.jsp?content=boutique/boutique_commande_fille_update.jsp&mode=update");
			pv.chargeForm();
			out.println(pv.getLineForm());
			pv.loadResult(request);
		%>

	</div>
	<div class="pd-20 mb-30 card-box">
		<div class="table-responsive">
			<table class="table table-striped">
				<%
					pv.setColDisplay(new String[] { "article_id", "quantite", "pu", "etat", "date_fille" });
					pv.setColRenameDisplay(new String[] { "article_id", "quantite", "pu", "etat", "date_fille" });
					pv.prepareData(request);
					out.println(pv.getResultDisplay());
				%>
			</table>

		</div>
		<br>
		<%=pv.getFooter(request)%>
	</div>
 
</form>
