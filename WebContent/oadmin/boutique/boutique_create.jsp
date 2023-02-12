<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
Categorie cat = new Categorie();
cat.setCompleteTableName("boutique_type");
Categorie[]offre =(Categorie[])Generalize.getListObject(cat, null);
Boutique boutique = new Boutique();
 %>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_read.jsp">Boutique</a></li>
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
			PageCreate pv = new PageCreate(boutique);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("etat", false);
			pv.setVisibleEntry("views", false);
 			pv.setHtml("categorie_id", "readonly");
			pv.setLink("categorie_id", request.getContextPath() + "/oadmin/container.jsp?content=choix/choix_boutique_categorie.jsp");
 			pv.setType("categorie_id", "popup");
 			pv.setType("type_id", "SELECT");
 			pv.setMutilpleKeyValue("type_id","id","description");
 			pv.setMutilpleData("type_id", offre);
			pv.setNameDisplay("type_id", "Type");
			pv.setNameDisplay("mail", "Email");
			pv.setNameDisplay("telephone", "T&eacute;l&eacute;phone");
			pv.setNameDisplay("denomination", "D&eacute;nomination");
			pv.setNameDisplay("apropos", "A propos");
			pv.setNameDisplay("categorie_id", "Cat&eacute;gorie");
 			pv.chargeForm();
			out.println(pv.getLineForm());
 		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_read.jsp" name="after">
		<input type="hidden" class="form-control" name="class" value="doshopa.Boutique">
		<button type="submit" class="btn btn-success btn-lg btn-block">Enregistrer</button>
	</form>
 	<br>
</div>
<script>
	
</script>