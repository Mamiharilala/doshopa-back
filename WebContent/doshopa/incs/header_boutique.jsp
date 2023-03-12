<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ page import="system.*" %>
		<%@ page import="doshopa.*" %>
			<% Boutique boutique=(Boutique) request.getAttribute("boutique"); Utilisateur u=(Utilisateur)
				request.getSession().getAttribute("user"); %>
				<html>
				<head>
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<!-- Site favicon -->
					<link rel="site-brand-icon" sizes="180x180"
						href="${pageContext.request.contextPath}/vendors/images/Doshopa180x180.png" />
					<link rel="icon" type="image/png" sizes="32x32"
						href="${pageContext.request.contextPath}/vendors/images/Doshopa32x32.png" />
					<link rel="icon" type="image/png" sizes="16x16"
						href="${pageContext.request.contextPath}/vendors/images/Doshopa16x16.png" />
					<jsp:include page='../incs/css.jsp' />
				</head>

				<body class="body">
					<nav class="navbar navbar-expand-lg py-2 px-10 mb-4 navbar-light bg-light border-bottom">
						<div class="container">
							<a href="${pageContext.request.contextPath}"
								class="navbar-brand d-flex align-items-center col-md-2 mb-2 mb-md-0 text-dark text-decoration-none">
								<img src="" alt="<%=boutique.getDenomination()%>" width="150"
									height="36">
							</a>
							<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav"
								aria-expanded="false" aria-label="Toggle navigation" onclick="openNav()">
								<span class="navbar-toggler-icon"></span>
							</button>
						
							<div class="collapse navbar-collapse" id="navbarNav">
								<ul class="nav me-auto">
									<li class="nav-item"><a
											href="${pageContext.request.contextPath}/boutiques?ref=<%=request.getParameter("ref")%>#search"
											class="nav-link link-dark px-2">Produit</a></li>
									<li class="nav-item"><a
											href="${pageContext.request.contextPath}/boutiques?ref=<%=request.getParameter("ref")%>#about"
											class="nav-link link-dark px-2">A propos</a></li>
									<li class="nav-item"><a href="${pageContext.request.contextPath}/panier"
											class="nav-link px-2 link-dark">Mon panier <span class="badge bg-danger">0</span></a></li>

								</ul>
								<% if (u !=null) { %>
									<ul class="nav">
										<li><a
												href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/accueil"><button
													type="button" class="btn btn-outline-dark me-2">Se
													d&eacute;connecter</button></a></li>
									</ul>
								<% } else { %>
									<ul class="nav">
										<li class="nav-item"><a href="${pageContext.request.contextPath}/login"
												class="nav-link link-dark px-2">Se
												connecter</a></li>
										<li class="nav-item"><a
												href="${pageContext.request.contextPath}/inscription"
												class="nav-link link-dark px-2">S'inscrire</a></li>
									</ul>
								<% } %>
							</div>
						</div>
					</nav>
						
					<!-- Side nav -->
					<div id="sidemenuId" class="sidemenu">
						<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
						<a href="${pageContext.request.contextPath}/boutiques?ref=<%=request.getParameter("ref")%>#search">Produit</a>
						<a href="${pageContext.request.contextPath}/boutiques?ref=<%=request.getParameter("ref")%>#about">A propos</a>
						<a href="${pageContext.request.contextPath}/panier">Panier <i class="fa-solid fa-cart-shopping fa-lg mt-1"></i></a>
						<% if (u !=null) { %>
						<a href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/accueil"><button
											type="button" class="btn btn-outline-dark me-2">Se
											d&eacute;connecter</button></a>
						<% } else { %>
						<a href="${pageContext.request.contextPath}/login">Se connecter</a>
						<a href="${pageContext.request.contextPath}/inscription">S'inscrire</a>
						<% } %>
					</div>

					<div class="nav-scroller py-1 mb-2">
						<nav class="nav d-flex justify-content-center">
							<a class="p-2 link-secondary text-decoration-none">Cat&eacute;gorie:</a> <a
								class="p-2 link-secondary" href="">
								<%=boutique.getCategorielib()%>
							</a>

						</nav>
					</div>