<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="system.*"%>
<% 
	Article p = new Article();
	
	String boutiqueID = "";
	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u != null){
		if (u.getBoutique_id() != null){
			boutiqueID = " and boutique_id = '" + u.getBoutique_id() + "'";	
		}
	}
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=choix/choix_article.jsp" method="POST">	
		 <%
			 	PageChoice ps = new PageChoice(p,"designation");
		 		ps.setWhere(boutiqueID);
		 		ps.setVisibleEntry("id", false);
		 		ps.setVisibleEntry("etat", false);
		 		ps.setIntervalle("views");
		 		ps.chargeForm();
			 	out.println(ps.getSearchForm());
			 	ps.loadResult(request);
			 %>	
 		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
	</form>
</div>
<!-- horizontal Basic Forms End -->

<!-- Responsive tables Start -->
<div class="pd-20 mb-30"> 
	<div class="table-responsive">
		<table class="table table-striped">
			<% 
				ps.setColDisplay(new String[]{"id","designation","reference"});
				ps.setColRenameDisplay(new String[]{"id","Designation","R&eacute;f&eacute;rence"});
				ps.prepareData(request);
 				out.println(ps.getResultDisplay());
			%>
		</table>
		<%=ps.getFooter(request)%>
	</div>
</div>
<!-- Responsive tables End -->
<script src="${pageContext.request.contextPath}/src/scripts/choix.js"></script>



