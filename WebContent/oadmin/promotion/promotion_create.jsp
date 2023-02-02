<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
	Promotion p = new Promotion();
	p.setDate_debut(new java.sql.Date(System.currentTimeMillis()));
	p.setDate_fin(new java.sql.Date(System.currentTimeMillis()));
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Promotion</a></li>
					<li class="breadcrumb-item active" aria-current="page">Création</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/treat.jsp"
		method="POST">
		<%
			PageCreate pv = new PageCreate(p);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("etat", false);
			pv.setType("article_id", "popup");
			pv.setHtml("article_id", "readonly");
			pv.setLink("article_id", request.getContextPath() + "/container.jsp?content=choix/choix_article.jsp");
			pv.setNameDisplay("quantite", "Quantit&eacute;");
			pv.setNameDisplay("prix_actuel", "Prix de promotion");
			pv.setNameDisplay("prix_avant", "Prix avant");
			pv.setNameDisplay("date_debut", "Date de lancement");
			pv.setType("date_debut", "date");
			pv.setNameDisplay("date_fin", "Date fin de promotion");
			pv.setType("date_fin", "date");
			pv.setType("tableName", "textarea");
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/container.jsp?content=promotion/promotion_read.jsp" name="after">
		<input type="hidden" class="form-control" name="class" value="oadmin.Promotion">
		<button type="submit" class="btn btn-success btn-lg btn-block">Enregistrer</button>
	</form>
 	<br>
</div>
<script>
	
</script>