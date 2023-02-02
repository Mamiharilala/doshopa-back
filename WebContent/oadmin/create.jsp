<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>

<%
	Promotion p = new Promotion();
%>
<div class="pd-20 card-box mb-30">
	<div class="clearfix">
		<div class="pull-left">
			<h4 class="text-blue h4">Default Basic Forms</h4>
			<p class="mb-30">All bootstrap element classies</p>
		</div>
	</div>
	<form action="${pageContext.request.contextPath}/treat.jsp" method="POST">
		<%
			PageCreate pv = new PageCreate(p);
			pv.setVisibleEntry("id", false);
			pv.setType("article_id", "popup");
			pv.setLink("article_id", request.getContextPath()+"/container.jsp?content=choix/choixInsert.jsp");
			pv.setNameDisplay("quantite", "Quantit&eacute;");
			pv.setType("tableName", "textarea");
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="insert" name="mode">
		<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/container.jsp?content=create.jsp" name="after">
		<input type="hidden" class="form-control" name="class" value="main.Promotion">
		<button type="submit" class="btn btn-success btn-lg btn-block">Enregistrer</button>
	</form>
	<p id="response"></p>
	<br>
</div>
<script>
 
</script>