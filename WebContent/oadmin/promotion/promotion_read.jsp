<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<%@ page import="system.*"%>
<%
	Promotion p = new Promotion();
	p.setCompleteTableName("promotion_article_boutique");
	
	String boutiqueID = "and 1<2";
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u != null){
		if (u.getBoutique_id() != null){
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
			ps.setVisibleEntry("etat", false);
			ps.setNameDisplay("quantite", "Quantit&eacute;");
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
					ps.setColDisplay(new String[] { "id", "article_id", "designation" });
					ps.setColRenameDisplay(new String[] { "id", "Article", "designation" });
					HashMap<String, String> map = new HashMap<String, String>();
					ps.setColRedirection(map);
					// Href of redirect
					map = new HashMap<String, String>();
					ps.setColRedirectionHref(map);
					ps.prepareData(request);
					ps.prepareData(request);
					out.println(ps.getResultDisplay());
				%>
			</table>
		</div>
		<%=ps.getFooter(request)%>
	</div>
</form>
