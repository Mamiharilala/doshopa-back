<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@ page import="doshopa.Boutique"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
<% 
Boutique boutique = new Boutique();
%>
<!-- horizontal Basic Forms Start -->
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_read.jsp" method="POST">	
		 <%
			 	PageSearch ps = new PageSearch(boutique);
		 		ps.setVisibleEntry("id", false);
		 		ps.setVisibleEntry("etat", false);
 		 		ps.chargeForm();
			 	out.println(ps.getSearchForm());
			 	ps.loadResult(request);
			 %>	
		<input type="hidden" class="form-control" value="search" name="mode">
 		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
	</form>
</div>
  
 <div class="pd-20 mb-30"> 
	<div class="table-responsive">
		<table class="table table-striped">
			<% 
				ps.setColDisplay(new String[]{"denomination","siege","categorie_id","logo","mail","telephone","type_id","views","remarque"});
				ps.setColRenameDisplay(new String[]{"denomination","siege","categorie_id","logo","mail","telephone","type_id","views","remarque"});
				HashMap<String,String>map = new HashMap<String,String>();
 				ps.setColRedirection(map);
 				// Href of redirect
 				map = new HashMap<String,String>();
 				ps.setColRedirectionHref(map);
				ps.prepareData(request);
				out.println(ps.getResultDisplay());
			%>
		</table>
	</div><br>
	<%=ps.getFooter(request)%>
</div>
 


