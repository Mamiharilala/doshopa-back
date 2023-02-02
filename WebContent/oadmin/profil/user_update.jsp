<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<%@ page import="front.*"%>
<%@ page import="system.*"%>
<%@ page import="java.sql.Date"%>

<%
	Utilisateur user = (Utilisateur) session.getAttribute("user");

	ObjectType[] sexe = new ObjectType[2];
	sexe[0] = new ObjectType();
	sexe[0].setCode("m");
	sexe[0].setDescription("Homme");
	sexe[1] = new ObjectType();
	sexe[1].setCode("f");
	sexe[1].setDescription("Femme");
%>
<div class="page-header">
	<div class="row">
		<div class="col-md-6 col-sm-12">
			<nav aria-label="breadcrumb" role="navigation">
				<ol class="breadcrumb">
 					<li class="breadcrumb-item"><a href="index.html">Profil</a></li>
					<li class="breadcrumb-item active" aria-current="page">Modification</li>
				</ol>
			</nav>
		</div>
	</div>
</div>
<div class="pd-20 card-box mb-30">
	<form action="${pageContext.request.contextPath}/treat.jsp"
		method="POST">
		<%
			PageUpdate pv = new PageUpdate(user);
			pv.setVisibleEntry("id", false);
			pv.setVisibleEntry("etat", false);
			pv.setVisibleEntry("mot_passe", false);
			pv.setVisibleEntry("role_id", false);
			pv.setHtml("mail", " readonly ");
			pv.setMutilpleKeyValue("sexe", "code", "description");
			pv.setMutilpleData("sexe", sexe);
			pv.setType("sexe", "SELECT");
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
		<input type="hidden" class="form-control" value="update" name="mode">
		<input type="hidden" class="form-control" value="<%=user.getId()%>" name="id">
		<input type="hidden" class="form-control"
			value="${pageContext.request.contextPath}/container.jsp?content=profil/user_detail.jsp"
			name="after"> <input type="hidden" class="form-control"
			name="class" value="system.Utilisateur">
		<div class="nav justify-content-center">
			<button type="submit"
				class="btn btn-success btn-lg col-xs-4  col-sm-4">Modifier</button>
			<br>
		</div>
		<br>
		<div class="nav justify-content-center">
			<a href="${pageContext.request.contextPath}/container.jsp?content=profil/user_detail.jsp&id=<%=request.getParameter("id")%>"><button type="button" class="btn btn-warning">Voir détail</button>
		</div>

	</form>
	<br>
</div>
<script>
	
</script>