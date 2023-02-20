<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="system.*"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%

	Utilisateur u = (Utilisateur) session.getAttribute("user");
	if (u == null||!u.isAdmin()){
		throw new Exception("Vous n\'avez pas l\'accès, veuillez contacter l\'admin!");
	}
	Utilisateur user = new Utilisateur();
	user.setId(request.getParameter("id"));
%>
<!-- horizontal Basic Forms Start -->
 
	<div class="pd-20 card-box mb-30">		
		<%
			PageDetail ps = new PageDetail(user);
			ps.setVisibleEntry("id", false);
			ps.setVisibleEntry("mot_passe", false);
 			ps.chargeForm();
			out.println(ps.getLineForm());
 		%>
 	</div>
	<div class="nav justify-content-center">
		<div class="col-xs-3  col-sm-3">
			<a href="${pageContext.request.contextPath}/oadmin/container.jsp?content=utilisateur/utilisateur_update.jsp&id=<%=request.getParameter("id")%>"><button type="submit" class="btn btn-warning btn-lg text-light btn-block">Modifier</button></a>
		</div>
	</div>
 
