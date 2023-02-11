<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Article"%>
 <%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
	Article article = new Article();
	 
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Produit</a></li>
					<li class="breadcrumb-item active" aria-current="page">Création</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/treat.jsp"
		method="POST">
		<%
			PageCreate pv = new PageCreate(article);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("etat", false);
			pv.setType("boutique_id", "popup");
			pv.setHtml("boutique_id", "readonly");
			pv.setType("devise_id", "popup");
			pv.setType("categorie_id", "popup");
			pv.setHtml("devise_id", "readonly");
			pv.setHtml("categorie_id", "readonly");
			pv.setLink("devise_id", request.getContextPath() + "/oadmin/container.jsp?content=choix/choix_devise.jsp");
			pv.setLink("boutique_id", request.getContextPath() + "/oadmin/container.jsp?content=choix/choix_boutique.jsp");
			pv.setLink("categorie_id", request.getContextPath() + "/oadmin/container.jsp?content=choix/choix_article_categorie.jsp");
			pv.setNameDisplay("boutique_id", "Boutique");
			pv.setNameDisplay("categorie_id", "Catégorie");
			pv.setNameDisplay("devise_id", "Devise");
			pv.setNameDisplay("quantite", "Quantit&eacute;");
			pv.setVisibleEntry("image", false);
 			pv.setType("observation", "textarea");
 			pv.setNameDisplay("reference", "R&eacute;f&eacute;rence");
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/oadmin/container.jsp?content=produit/produit_read.jsp" name="after">
		<input type="hidden" class="form-control" name="class" value="doshopa.Article">
		<button type="submit" class="btn btn-success btn-lg btn-block">Enregistrer</button>
	</form>
 	<br>
</div>
<script>
	
</script>