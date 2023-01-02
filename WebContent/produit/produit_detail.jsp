<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Article"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%
	Article article = new Article();
	article.setId(request.getParameter("id"));
%>
<!-- horizontal Basic Forms Start -->
<form
	action="${pageContext.request.contextPath}/container.jsp?content=product/produit_read.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">		
		<%
			PageDetail pd = new PageDetail(article);
			pd.setVisibleEntry("id", false);
			pd.setVisibleEntry("etat", false);
			pd.chargeForm();
			out.println(pd.getLineForm());
 		%>
		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
	</div>
</form>
