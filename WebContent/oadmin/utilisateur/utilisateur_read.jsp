<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="system.*"%>
<%
	Utilisateur user = new Utilisateur();
	user.setCompleteTableName("utilisateur");
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u == null||!u.isAdmin()){
		throw new Exception("Vous n\'avez pas l\'accès, veuillez contacter l\'admin!");
	}
	Categorie tempRole = new Categorie();
	tempRole.setCompleteTableName("roles");
	Categorie[] roles = (Categorie[])Generalize.getListObjectWithWhere(tempRole," order by description desc", null);
	Categorie tempEtat = new Categorie();
	tempEtat.setCompleteTableName("etat_categorie");
	Categorie[] etats = (Categorie[])Generalize.getListObject(tempEtat, null);
%>
<!-- horizontal Basic Forms Start -->
<form
	action="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_read.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">
		<%
			PageSearch ps = new PageSearch(user);
 			ps.setVisibleEntry("id", false);
 			ps.setVisibleEntry("mot_passe", false);
 			ps.setVisibleEntry("mail", false);
 			ps.setVisibleEntry("sexe", false);
 			ps.setVisibleEntry("mail", false);
 			ps.setVisibleEntry("login", false);
 			ps.setType("role_id", "SELECT");
			ps.setMutilpleKeyValue("role_id", "id", "description");
			ps.setMutilpleData("role_id", roles);
			ps.setType("etat", "SELECT");
			ps.setMutilpleKeyValue("etat", "id", "description");
			ps.setMutilpleData("etat", etats);
 			ps.setNameDisplay("telephone", "t&eacute;l&eacute;phone");
 			ps.setNameDisplay("role_id", "role");
 			ps.setNameDisplay("boutique_id", "boutique(ID)");
 			ps.setNameDisplay("telephone", "t&eacute;l&eacute;phone");
 			ps.setNameDisplay("prenom", "pr&eacute;nom");
 			ps.setFormatEntry("boutique_id", "string");
			ps.chargeForm();
			out.println(ps.getSearchForm());
			ps.loadResult(request);
		%><br>



	</div>
	<!-- horizontal Basic Forms End -->
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
		</div>
	</div>
	<!-- Responsive tables Start -->
	<div class="pd-20 mb-30">
		<div class="table-responsive">
			<table class="table table-striped">
				<%
					ps.setColDisplay(new String[] { "id", "nom", "prenom","telephone", "adresse", "etat", "role_id", "boutique_id" });
					ps.setColRenameDisplay(new String[] {"id", "nom", "pr&eacute;nom","t&eacute;l&eacute;phone", "adresse", "etat", "ID role", "ID Boutique" });
					// field to redirect
					HashMap<String,String>map = new HashMap<String,String>();
	 				map.put("id","id");
 	 				ps.setColRedirection(map);
	 				// Href of redirect
	 				map = new HashMap<String,String>();
	 				map.put("id","container.jsp?content=utilisateur/utilisateur_detail.jsp&id=");
  					ps.setColRedirectionHref(map);
					ps.prepareData(request);
					out.println(ps.getResultDisplay());
				%>
			</table>
		</div>
		<%=ps.getFooter(request)%>
	</div>
</form>
