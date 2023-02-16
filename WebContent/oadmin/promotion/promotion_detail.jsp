<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%
	Promotion p = new Promotion();
	p.setId(request.getParameter("id"));
%>
<!-- horizontal Basic Forms Start -->
 
	<div class="pd-20 card-box mb-30">		
		<%
			PageDetail ps = new PageDetail(p);
			ps.setVisibleEntry("id", false);
			ps.setVisibleEntry("etat", false);
			ps.setNameDisplay("quantite", "Quantit&eacute;");
			ps.chargeForm();
			out.println(ps.getLineForm());
 		%>
 	</div>
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=promotion/promotion_update.jsp&id=<%=request.getParameter("id")%>"><button type="submit" class="btn btn-warning btn-lg text-light btn-block">Modifier</button></a>
		</div>
	</div>
 
