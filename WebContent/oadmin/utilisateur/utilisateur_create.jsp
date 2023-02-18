<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="system.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
	try {
		Utilisateur u = (Utilisateur) session.getAttribute("user");
		if (u == null || !u.isAdmin()) {
			throw new Exception("Veuillez contacter l\'administrateur!");
		}
		Utilisateur user = new Utilisateur();
		Categorie tempRole = new Categorie();
		tempRole.setCompleteTableName("roles");
		Categorie[] roles = (Categorie[]) Generalize.getListObjectWithWhere(tempRole,
				" order by description desc", null);
		Categorie tempSexe = new Categorie();
		tempSexe.setCompleteTableName("sexe");
		Categorie[] sexes = (Categorie[]) Generalize.getListObject(tempSexe, null);
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a
						href="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_read.jsp">Utilisateur</a></li>
					<li class="breadcrumb-item active" aria-current="page">Création</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<form action="${pageContext.request.contextPath}/oadmin/treat.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">

		<%
			PageCreate pv = new PageCreate(user);
				pv.setVisibleEntry("id", false);
				pv.setVisibleEntry("etat", false);
				pv.setType("boutique_id", "popup");
				pv.setHtml("boutique_id", "readonly");
				pv.setNameDisplay("boutique_id", "Boutique");
				pv.setNameDisplay("prenom", "Pr&eacute;nom");
				pv.setNameDisplay("telephone", "t&eacute;l&eacute;phone");
				pv.setNameDisplay("mail", "Adresse e-mail");
				pv.setNameDisplay("role_id", "Role");
				pv.setType("role_id", "SELECT");
				pv.setMutilpleKeyValue("role_id", "id", "description");
				pv.setMutilpleData("role_id", roles);
				pv.setType("sexe", "SELECT");
				pv.setMutilpleKeyValue("sexe", "id", "description");
				pv.setMutilpleData("sexe", sexes);
				pv.setNameDisplay("mot_passe", "Mot de passe");
				pv.setLink("boutique_id",
						request.getContextPath() + "/oadmin/container.jsp?content=choix/choix_boutique.jsp");
				pv.chargeForm();
				out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_read.jsp"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="system.Utilisateur">
		<div class="nav justify-content-center">
			<div class="col-xs-3  col-sm-3">
				<button type="submit" class="btn btn-success btn-lg btn-block">Enregistrer</button>
			</div>
		</div>

		<br>
	</div>

</form>
<%
	} catch (Exception e) {
		e.printStackTrace();
%>
<script language="JavaScript"> 
	alert("<%=e.getMessage()%>");
	history.back();
</script>
<%
	}
%><script>
	
</script>