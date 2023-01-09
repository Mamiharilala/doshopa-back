<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="oadmin.*"%>
<%
	CommandeMere p = new CommandeMere();
	p.setId(request.getParameter("idMere"));
%>
<form action="${pageContext.request.contextPath}/treat.jsp"
	method="POST">
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
			pv.setAfterPageFille("container.jsp?content=boutique/boutique_commande_fille_update.jsp&mode=update");
			pv.chargeForm();
			out.println(pv.getLineForm());
			pv.loadResult(request);
		%>

	</div>
	<div class="pd-20 mb-30 card-box">
		<div class="table-responsive">
			<table class="table table-striped">
				<%
					pv.setColDisplay(new String[] { "article_id", "quantite", "pu", "etat", "date_fille" });
					pv.setColRenameDisplay(new String[] { "article_id", "quantite", "pu", "etat", "date_fille" });
					pv.prepareData(request);
					out.println(pv.getResultDisplay());
				%>
			</table>

		</div>
		<br>
		<%=pv.getFooter(request)%>
	</div>
 
</form>
