<%@page import="util.Constant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>

<%
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u == null||!u.isAdmin()){
		throw new Exception("Vous n\'avez pas l\'accès, veuillez contacter l\'admin!");
	}
	Utilisateur user = new Utilisateur();
	user.setId(request.getParameter("id"));
	//
	Categorie tempRole = new Categorie();
	tempRole.setCompleteTableName("roles");
	Categorie[] roles = (Categorie[])Generalize.getListObjectWithWhere(tempRole," order by description desc", null);
	// etat
	Categorie etatCat = new Categorie();
	etatCat.setCompleteTableName("etat");
	Categorie[] etat = (Categorie[]) Generalize.getListObject(etatCat, null);
	//sexe
	Categorie tempSexe = new Categorie();
	tempSexe.setCompleteTableName("sexe");
	Categorie[] sexes = (Categorie[]) Generalize.getListObject(tempSexe, null);
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
 					<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_read.jsp">Utilisateur</a></li>
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
			PageUpdate pv = new PageUpdate(user);
			user = (Utilisateur)pv.getMapModel();
			user.setMot_passe("");
			pv.setMapModel(user);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("mot_passe", false);
  			pv.setNameDisplay("boutique_id", "Boutique(ID)");
  			pv.setNameDisplay("role_id", "Role");
  			pv.setNameDisplay("telephone", "t&eacute;l&eacute;phone");
  			pv.setNameDisplay("prenom", "pr&eacute;nom");
 			pv.setHtml("designation", "readonly");
   			pv.setType("etat", "SELECT");
			pv.setMutilpleKeyValue("etat", "code", "description");
			pv.setMutilpleData("etat", etat);
			//role
			pv.setType("role_id", "SELECT");
			pv.setMutilpleKeyValue("role_id", "id", "description");
			pv.setMutilpleData("role_id", roles);
			//sexe
			pv.setType("sexe", "SELECT");
			pv.setMutilpleKeyValue("sexe", "id", "description");
			pv.setMutilpleData("sexe", sexes);
 			pv.chargeForm();	
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="update" name="mode">
		<input type="hidden" class="form-control" value="<%=request.getParameter("id")%>" name="id">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_update.jsp&id=<%=request.getParameter("id")%>"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="system.Utilisateur">
		<div class="nav justify-content-center">
			<button type="submit"
				class="btn btn-warning text-light btn-lg col-xs-4  col-sm-4">Modifier</button>
			<br>
		</div>
		<br>
		<div class="nav justify-content-center">
			<a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_detail.jsp&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-success">Voir d&eacute;tail</button>
		</div>
	</form>
	<br>
</div>
<script>
	
</script>