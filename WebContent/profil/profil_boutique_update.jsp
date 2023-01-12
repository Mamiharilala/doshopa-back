<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>

<%
	Utilisateur user = (Utilisateur) session.getAttribute("user");

	Boutique boutique = null;
	if(user.isBoutique()){
		boutique = user.getBoutique();
	
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
 					<li class="breadcrumb-item"><a href="index.html">Profil</a></li>
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
			PageUpdate pv = new PageUpdate(boutique);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("etat", false);
 			pv.setVisibleEntry("type_id", false);
 			pv.setVisibleEntry("categorie_id", false);
 			pv.setVisibleEntry("views", false);
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="update" name="mode">
		<input type="hidden" class="form-control" value="<%=boutique.getId()%>" name="id">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/container.jsp?content=profil/profil_boutique_detail.jsp"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="oadmin.Boutique">
		<div class="nav justify-content-center">
			<button type="submit"
				class="btn btn-success btn-lg col-xs-4  col-sm-4">Modifier</button>
			<br>
		</div>
		<br>
		<div class="nav justify-content-center">
			<a href="${pageContext.request.contextPath}/container.jsp?content=profil/profil_boutique_detail.jsp&id=<%=boutique.getId()%>"><button type="button" class="btn btn-warning">Voir détail</button>
		</div>

	</form>
	<br>
</div>
<% } %>