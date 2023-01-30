<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>
<%
	Utilisateur user = (Utilisateur) session.getAttribute("user");
	Boutique boutique = null;
 	if(user.isBoutique()){
		boutique = user.getBoutique();
	 
%>

<div class="pd-20 card-box mb-30">
	<%
		PageDetail pd = new PageDetail(boutique);
		pd.setVisibleEntry("id", false);
		pd.setVisibleEntry("etat", false);
		pd.setVisibleEntry("categorie_id", false);
		pd.setVisibleEntry("type_id", false);
		pd.setVisibleEntry("views", false);
 		pd.chargeForm();
		out.println(pd.getLineForm());
	%>
	<div class="nav justify-content-center">
		<a
			href="${pageContext.request.contextPath}/container.jsp?content=profil/boutique_update.jsp"><button
				type="submit" class="btn btn-success btn-lg">Modifier</button></a>
	</div>
</div>

<% } %>