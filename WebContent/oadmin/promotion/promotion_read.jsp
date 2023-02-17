<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="system.*"%>
<%
	Promotion p = new Promotion();
	p.setCompleteTableName("v_article_promotion");
	Categorie cat = new Categorie();
	cat.setCompleteTableName("etat_categorie");
	Categorie[] etat = (Categorie[]) Generalize.getListObject(cat, null);
	Categorie categorieArticle = new Categorie();
	categorieArticle.setCompleteTableName("article_categorie");
	Categorie[] arrayCategorieArticle = (Categorie[]) Generalize.getListObject(categorieArticle, null);
	String boutiqueID = "";
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u != null){
		if (u.getBoutique_id() != null&& !u.isAdmin()){
			boutiqueID = " and boutique_id = '" + u.getBoutique_id() + "'";		
		}
	}
%>
<!-- horizontal Basic Forms Start -->
<form
	action="${pageContext.request.contextPath}/oadmin/container.jsp?content=promotion/promotion_read.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">
		<%
			PageSearch ps = new PageSearch(p);
			ps.setWhere(boutiqueID);
			ps.setVisibleEntry("id", false);
			ps.setVisibleEntry("image", false);
 			ps.setVisibleEntry("devise_id", false);
 			ps.setVisibleEntry("reference", false);
 			ps.setVisibleEntry("categorie_id", false);
			ps.setVisibleEntry("etatlib", false);
			ps.setNameDisplay("article_id", "ID Article");
			ps.setNameDisplay("boutique_id", "ID Boutique");
			ps.setNameDisplay("categorielib", "Cat&eacute;gorie");
			ps.setNameDisplay("date_debut", "Date début");
			ps.setNameDisplay("date_fin", "Date fin");
			ps.setFormatEntry("date_fin", "date");
			ps.setFormatEntry("prix_actuel", "money");
			ps.setFormatEntry("prix_avant", "money");
			ps.setNameDisplay("prix_avant", "Prix avant");
			ps.setNameDisplay("prix_actuel", "Prix de promotion");
			ps.setNameDisplay("quantite", "Quantit&eacute;");
			ps.setNameDisplay("designation", "D&eacute;signation");
			ps.setType("etat", "SELECT");
			ps.setMutilpleKeyValue("etat", "code", "description");
			ps.setMutilpleData("etat", etat);
			ps.setType("categorielib", "SELECT");
			ps.setMutilpleKeyValue("categorielib", "code", "description");
			ps.setMutilpleData("categorielib", arrayCategorieArticle);
			ps.setNameDisplay("boutique_denomination", "D&eacute;nomination Boutique");
			ps.setIntervalle("quantite");
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
					ps.setColDisplay(new String[] { "article_id", "designation","prix_avant","prix_actuel","date_fin","etatlib" });
					ps.setColRenameDisplay(new String[] {"Article", "D&eacute;signation","Prix avant","Prix actuel","Date fin","status" });
					// field to redirect
					HashMap<String,String>map = new HashMap<String,String>();
	 				map.put("designation","id");
	 				map.put("article_id","article_id");
	 				ps.setColRedirection(map);
	 				// Href of redirect
	 				map = new HashMap<String,String>();
	 				map.put("designation","container.jsp?content=promotion/promotion_detail.jsp&id=");
	 				map.put("article_id","container.jsp?content=produit/produit_detail.jsp&id=");
 					ps.setColRedirectionHref(map);
					ps.prepareData(request);
					out.println(ps.getResultDisplay());
				%>
			</table>
		</div>
		<%=ps.getFooter(request)%>
	</div>
</form>
