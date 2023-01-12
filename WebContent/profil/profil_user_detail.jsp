<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>
<%
	Utilisateur user = (Utilisateur)session.getAttribute("user");
%>
<!-- horizontal Basic Forms Start -->
<form
	action="${pageContext.request.contextPath}/container.jsp?content=product/produit_read.jsp"
	method="POST">
	<div class="pd-20 card-box mb-30">		
		<%
			PageDetail pd = new PageDetail(user);
			pd.setVisibleEntry("id", false);
			pd.setVisibleEntry("etat", false);
			pd.setVisibleEntry("mot_passe", false);
			pd.setVisibleEntry("Poste", false);
			pd.chargeForm();
			out.println(pd.getLineForm());
 		%>
 		<div class="nav justify-content-center"><a href="${pageContext.request.contextPath}/container.jsp?content=profil/profil_user_modif.jsp"><button type="submit" class="btn btn-success btn-lg">Modifier</button></a></div>	
	</div>
</form>
