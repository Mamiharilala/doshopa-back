<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.util.*"%>
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
					ps.setColDisplay(new String[] { "id", "article_id", "quantite" });
					ps.setColRenameDisplay(new String[] { "id", "Article", "quantite" });
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
