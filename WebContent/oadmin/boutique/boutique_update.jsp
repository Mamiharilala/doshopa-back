<%@page import="util.Constant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>

<%
	Boutique boutique = new Boutique();
	boutique.setId(request.getParameter("id"));
	// Validation
	Categorie etatCat = new Categorie();
	etatCat.setCompleteTableName("etat_categorie");
	Categorie[] etat = (Categorie[]) Generalize.getListObject(etatCat, null);
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_read.jsp">Boutique</a></li>
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
			PageUpdate pv = new PageUpdate(boutique);
			pv.setVisibleEntry("id", false);
 			pv.setVisibleEntry("image", false);
 			pv.setNameDisplay("categorie_id", "Cat&eacute;gorie ID");
 			pv.setHtml("designation", "readonly");
   			pv.setType("etat", "SELECT");
			pv.setMutilpleKeyValue("etat", "code", "description");
			pv.setMutilpleData("etat", etat);
			pv.setType("remarque", "TEXTAREA");
			pv.chargeForm();	
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="update" name="mode">
		<input type="hidden" class="form-control" value="<%=request.getParameter("id")%>" name="id">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_update.jsp&id=<%=request.getParameter("id")%>"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="doshopa.Boutique">
		<div class="nav justify-content-center">
			<button type="submit"
				class="btn btn-warning text-light btn-lg col-xs-4  col-sm-4">Modifier</button>
			<br>
		</div>
		<br>
		<div class="nav justify-content-center">
			<a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_read.jsp&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-success">Retourner</button>
		</div>

	</form>
	<br>
</div>
<script>
	
</script>