<%@page import="util.Constant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
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
	Categorie cat = new Categorie();
	cat.setCompleteTableName("etat_commande");
	Categorie[] etat = (Categorie[]) Generalize.getListObject(cat, null);
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
	<form action="${pageContext.request.contextPath}/oadmin/treat.jsp"
		method="POST">
		<%
			PageUpdate pv = new PageUpdate(cf);
			cf = (CommandeFille)pv.getMapModel();
			if(cf.isEst_payer()==true){
				pv.setHtml("est_payer", " disabled ");
			}
			if(cf.getEtat()>=11){
				pv.setHtml("etat", " disabled ");
			}
			pv.setHtml("id", "readonly");
			pv.setNameDisplay("id", "N° Achat");
			pv.setVisibleEntry("commande_type", false);
			pv.setVisibleEntry("code_livrer", false);
			pv.setType("remarque", "textarea");
			pv.setNameDisplay("quantite", "Quantité");
			pv.setNameDisplay("code_collecter", "Code collecter");
			pv.setNameDisplay("code_livrer", "Code livrer");
			pv.setNameDisplay("est_payer", "Payé");
			pv.setNameDisplay("etat", "Status");
			pv.setNameDisplay("mere", "Numéro de commande");
			pv.setHtml("remarque", "readonly");
			pv.setNameDisplay("article_id", "ID Produit");
			pv.setType("date_fille", "date");
			pv.setHtml("date_fille", "readonly");
			pv.setHtml("article_id", "readonly");
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
			value="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_commande_fille_update.jsp&id=<%=request.getParameter("id")%>"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="doshopa.CommandeFille">
		<div class="nav justify-content-center">
			<button type="submit"
				class="btn btn-success btn-lg col-xs-4  col-sm-4">Modifier</button>
			<br>
		</div>
		<br>
		<div class="nav justify-content-center">
			<a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_commande_fille_detail.jsp&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-danger">Voir détail</button>
		</div>

	</form>
	<br>
</div>
<script>
	
</script>