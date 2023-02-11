<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<%@ page import="system.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<% 
	Categorie categorie = new Categorie();
	categorie.setCompleteTableName("boutique_categorie");
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=choix/choix_boutique_categorie.jsp" method="POST">	
		 <%
			 	PageChoice pc = new PageChoice(categorie,"description");
		 		pc.setVisibleEntry("id", false);
		 		pc.setVisibleEntry("code", false);
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
				pc.setColDisplay(new String[]{"code","description"});
				pc.setColRenameDisplay(new String[]{"Code","Designation"});
				pc.prepareData(request);
 				out.println(pc.getResultDisplay());
			%>
		</table>
		<%=pc.getFooter(request)%>
	</div>
</div>
<!-- Responsive tables End -->
<!-- Responsive tables End -->
<script src="${pageContext.request.contextPath}/src/scripts/choix.js"></script>
