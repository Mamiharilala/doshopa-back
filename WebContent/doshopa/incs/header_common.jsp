<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<html>
<%
	Utilisateur u = (Utilisateur) request.getSession().getAttribute("user");
%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<jsp:include page='../incs/css.jsp' />
<!-- Site favicon -->
<link rel="site-brand-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa180x180.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa16x16.png" />
</head>
<jsp:include page='../incs/notification.jsp' />
<body class="body">
	<section>
		<div class="container">
			<header
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
				<a href="${pageContext.request.contextPath}"
					class="d-flex align-items-center col-md-2 mb-2 mb-md-0 text-dark text-decoration-none">
					<img src="${pageContext.request.contextPath}/vendors/images/Doshopa_150x36.png" alt="Doshopa" width="150" height="36" >
				</a>

				<ul
					class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
					<li><a href="${pageContext.request.contextPath}"
						class="nav-link px-2 link-dark">Accueil</a></li>
					<li><a href="${pageContext.request.contextPath}/galerie"
						class="nav-link px-2 link-dark">Galerie commerciale</a></li>
					<li><a href="" class="nav-link px-2 link-dark">FAQS</a></li>
					<% if(u!=null&&u.isBoutique()){ %>
							<li><a href="${pageContext.request.contextPath}/oadmin" class="nav-link px-2 link-dark">G&eacute;rer ma boutique</a></li>
					
					<% }else{%>
						<li><a href="${pageContext.request.contextPath}/panier"
						class="nav-link px-2 link-dark"><i
							class="fa-solid fa-cart-shopping fa-lg mt-1"></i></a></li>
					<% }%>
				</ul>
				<%
					if (u != null) {
				%>
				<div>
					<a
						href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/accueil"><button
							type="button" class="btn btn-outline-dark me-2">Se
							déconnecter</button></a>
				</div>
				<%
					} else {
				%>
				<div>
					<a
						href="${pageContext.request.contextPath}/login"><button
							type="button" class="btn btn-outline-dark me-2">Se
							connecter</button></a> <a
						href="${pageContext.request.contextPath}/inscription"><button
							type="button" class="btn btn-dark">S'inscrire</button></a>
				</div>
				<%
					}
				%>
			</header>
		</div>
	</section>