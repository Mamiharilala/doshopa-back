<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.ArticleCategorie"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%
	ArticleCategorie categorie = new ArticleCategorie();
%>
<form
	action="${pageContext.request.contextPath}/oadmin/container.jsp?content=choix/choix_article_categorie.jsp"
	method="POST">
	<!-- horizontal Basic Forms Start -->
	<div class="pd-20 card-box mb-30">

		<%
			PageChoice pc = new PageChoice(categorie, "code");
			pc.setVisibleEntry("id", false);
			pc.setVisibleEntry("code", false);
			pc.chargeForm();
			out.println(pc.getSearchForm());
			pc.loadResult(request);
		%>

	</div>
	<!-- horizontal Basic Forms End -->
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
		</div>
	</div>
</form>
<!-- Responsive tables Start -->
<div class="pd-20 mb-30">
	<div class="table-responsive">
		<table class="table table-striped">
			<%
				pc.setColDisplay(new String[] { "code", "description" });
				pc.setColRenameDisplay(new String[] { "Designation", "Code" });
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
