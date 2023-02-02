<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Boutique"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
 
Boutique boutique = new Boutique();
 %>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="index.html">Boutique</a></li>
					<li class="breadcrumb-item active" aria-current="page">Cr�ation</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/treat.jsp"
		method="POST">
		<%
			PageCreate pv = new PageCreate(boutique);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("etat", false);
			pv.setVisibleEntry("views", false);
 			pv.setHtml("categorie_id", "readonly");
			pv.setLink("categorie_id", request.getContextPath() + "/container.jsp?content=choix/choix_boutique_categorie.jsp");
 			pv.setType("categorie_id", "popup");
			pv.setNameDisplay("type_id", "Type");
 			pv.chargeForm();
			out.println(pv.getLineForm());
 		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/container.jsp?content=boutique/boutique_read.jsp" name="after">
		<input type="hidden" class="form-control" name="class" value="oadmin.Boutique">
		<button type="submit" class="btn btn-success btn-lg btn-block">Enregistrer</button>
	</form>
 	<br>
</div>
<script>
	
</script>