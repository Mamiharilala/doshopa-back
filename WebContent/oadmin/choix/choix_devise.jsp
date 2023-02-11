<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Devise"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<% 
Devise devise = new Devise();
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=choix/choix_devise.jsp" method="POST">	
		 <%
			 	PageChoice pc = new PageChoice(devise,"code");
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
				pc.setColRenameDisplay(new String[]{"Designation","Code"});
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
