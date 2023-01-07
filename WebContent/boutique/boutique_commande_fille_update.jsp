<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
	CommandeFille cf = new CommandeFille();
	cf.setId(request.getParameter("id"));
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
			pv.setNameDisplay("est_payer", "Paiement");
			pv.setNameDisplay("article_id", "ID Produit");
			pv.setType("date_fille", "date");
			pv.setNameDisplay("date_fille", "Date d'achat");
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/container.jsp?content=boutique/boutique_read.jsp"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="oadmin.CommandeFille">
			<button type="submit" class="btn btn-success btn-lg btn-block">Modifier</button><br>
		<div class="nav justify-content-center">
			<button type="button" class="btn btn-secondary">Voir la
				détail</button>
			<button type="button" class="btn btn-danger">Supprimer</button>
		</div>

	</form>
	<br>
</div>
<script>
	
</script>