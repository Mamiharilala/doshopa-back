<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>

<%
	CommandeFille cf = new CommandeFille();
	cf.setId(request.getParameter("id"));
	// Paiement
	ObjectType[] paiement = new ObjectType[2];
	paiement[0] = new ObjectType();
	paiement[0].setCode(true);
	paiement[0].setDescription("Oui");
	paiement[1] = new ObjectType();
	paiement[1].setCode(false);
	paiement[1].setDescription("Non");
	// Validation
	ObjectType[] etat = new ObjectType[2];
	etat[0] = new ObjectType();
	etat[0].setCode("0");
	etat[0].setDescription("Annuler");
	etat[1] = new ObjectType();
	etat[1].setCode("11");
	etat[1].setDescription("Valider");
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Boutique</a></li>
					<li class="breadcrumb-item"><a href="index.html">Commande</a></li>
					<li class="breadcrumb-item active" aria-current="page">Modification</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/treat.jsp"
		method="POST">
		<%
			PageUpdate pv = new PageUpdate(cf);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("commande_type", false);
			pv.setType("remarque", "textarea");
			pv.setNameDisplay("quantite", "Quantité");
			pv.setNameDisplay("code_collecter", "Code collecter");
			pv.setNameDisplay("code_livrer", "Code livrer");
			pv.setNameDisplay("est_payer", "Payé");
			pv.setNameDisplay("mere", "Numéro de commande");
			pv.setHtml("remarque", "readonly");
			pv.setNameDisplay("article_id", "ID Produit");
			pv.setType("date_fille", "date");
			pv.setHtml("date_fille", "readonly");
			pv.setNameDisplay("date_fille", "Date d'achat");
			pv.setType("est_payer", "SELECT");
			pv.setMutilpleKeyValue("est_payer", "code", "description");
			pv.setMutilpleData("est_payer", paiement);
			pv.setType("etat", "SELECT");
			pv.setMutilpleKeyValue("etat", "code", "description");
			pv.setMutilpleData("etat", etat);
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="update" name="mode">
		<input type="hidden" class="form-control" value="<%=request.getParameter("id")%>" name="id">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/container.jsp?content=boutique/boutique_commande_fille_update.jsp&id=<%=request.getParameter("id")%>"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="oadmin.CommandeFille">
		<div class="nav justify-content-center">
			<button type="submit"
				class="btn btn-success btn-lg col-xs-4  col-sm-4">Modifier</button>
			<br>
		</div>
		<br>
		<div class="nav justify-content-center">
			<a href="${pageContext.request.contextPath}/container.jsp?content=boutique/boutique_commande_fille_detail.jsp&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-danger">Voir détail</button>
		</div>

	</form>
	<br>
</div>
<script>
	
</script>