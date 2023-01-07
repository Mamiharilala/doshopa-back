<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="oadmin.*"%>
<%
	CommandeMere p = new CommandeMere();
	p.setId("CM10");
%>
<form action="${pageContext.request.contextPath}/treat.jsp" method="POST">
	<div class="pd-20 card-box mb-30">
		<div class="clearfix">
			<div class="pull-left">
				<h4 class="text-blue h4">Default Basic Forms</h4>
				<p class="mb-30">All bootstrap element classies</p>
			</div>
		</div>

		<%
			CommandeFille fille = new CommandeFille();
			fille.setCompleteTableName("commande_fille");
			PageUpdateMultiple pv = new PageUpdateMultiple(p, fille, "mere");
			pv.setVisibleEntry("id", false);
			pv.chargeForm();
			out.println(pv.getLineForm());
			pv.loadResult(request);
		%>

	</div>
	<div class="pd-20 mb-30 card-box">
		<div class="table-responsive">
			<table class="table table-striped">
				<%
					pv.setColDisplay(new String[] { "article_id", "quantite", "pu", "etat","date_fille" });
					pv.setColRenameDisplay(new String[] {"article_id", "quantite", "pu", "etat","date_fille"});
					pv.prepareData(request);
					out.println(pv.getResultDisplay());
				%>
			</table>
			
		</div><br>
	<%=pv.getFooter(request)%>
	</div>
	
	<div class="col-md-12 col-sm-12 mb-30">
		<div class="pd-20 height-100-p">
			<button type="submit" class="btn btn-success btn-lg btn-block">Mettre
				à jour</button>
		</div>
	</div>
	<input type="hidden" name="mode" class="form-control" value="updateMultiple">
	<input type="hidden" name="fieldMere" class="form-control" value="mere">
	<input type="hidden" name="idMere" class="form-control" value="<%= p.getId() %>">
	<input type="hidden" name="classFille" class="form-control" value="oadmin.CommandeFille">
	<input type="hidden" name="classMere" class="form-control" value="oadmin.CommandeMere">
	<input type="hidden" name="after" class="form-control" value="${pageContext.request.contextPath}/container.jsp?content=boutique/boutique_commande_update.jsp" >
</form>