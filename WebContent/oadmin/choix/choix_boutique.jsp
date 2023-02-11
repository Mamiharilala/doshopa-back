<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Boutique"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<% 
Boutique boutique = new Boutique();
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=choix/choix_boutique.jsp" method="POST">	
		 <%
			 	PageChoice pc = new PageChoice(boutique,"denomination");
		 		pc.setVisibleEntry("id", false);
		 		pc.setVisibleEntry("views", false);
		 		pc.setVisibleEntry("etat", false);
 		 		pc.setNameDisplay("categorie_id", "Categorie");
		 		pc.setNameDisplay("type_id", "Type d'offre");
 		 		pc.chargeForm();   		 		
			 	out.println(pc.getSearchForm());
			 	pc.loadResult(request);
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
				pc.setColDisplay(new String[]{"id","denomination","categorie_id"});
				pc.setColRenameDisplay(new String[]{"id","denomination","categorie_id"});
 				pc.prepareData(request);
 				out.println(pc.getResultDisplay());
			%>
		</table>
	</div>
</div>
<!-- Responsive tables End -->

<!-- Responsive tables End -->
<script src="${pageContext.request.contextPath}/src/scripts/choix.js"></script>
