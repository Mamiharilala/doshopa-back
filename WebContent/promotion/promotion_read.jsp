<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%
	Promotion p = new Promotion();
%>
<!-- horizontal Basic Forms Start -->
<form
	action="${pageContext.request.contextPath}/container.jsp?content=promotion/promotion_read.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">
			
		<%
			PageSearch ps = new PageSearch(p);
			ps.setVisibleEntry("id", false);
			ps.setVisibleEntry("etat", false);
			ps.setNameDisplay("quantite", "Quantit&eacute;");
			ps.setIntervalle("quantite");
			ps.chargeForm();
			out.println(ps.getSearchForm());
			ps.loadResult(request);
		%>
		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>

	</div>
	<!-- horizontal Basic Forms End -->

	<!-- Responsive tables Start -->
	<div class="pd-20 mb-30">
		<div class="table-responsive">
			<table class="table table-striped">
				<%
					ps.setColDisplay(new String[] { "id", "article_id", "quantite" });
					ps.setColRenameDisplay(new String[] { "id", "Article", "quantite" });
					ps.prepareData(request);
					out.println(ps.getResultDisplay());
				%>
			</table>
			<%=ps.getFooter(request)%>		
		</div>
	</div>
</form>
