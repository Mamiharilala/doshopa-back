<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="oadmin.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%
	Promotion p = new Promotion();
	p.setId(request.getParameter("id"));
%>
<!-- horizontal Basic Forms Start -->
<form
	action="${pageContext.request.contextPath}/container.jsp?content=promotion/promotion_read.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">		
		<%
			PageDetail ps = new PageDetail(p);
			ps.setVisibleEntry("id", false);
			ps.setVisibleEntry("etat", false);
			ps.setNameDisplay("quantite", "Quantit&eacute;");
			ps.chargeForm();
			out.println(ps.getLineForm());
 		%>
		<button type="submit" class="btn btn-success btn-lg btn-block">Chercher</button>
	</div>
</form>
