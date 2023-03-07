<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="system.*" %>
        <html>
        <% Utilisateur u=(Utilisateur) request.getSession().getAttribute("user"); %>

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
                        <nav class="navbar navbar-expand-lg navbar-light py-3 mb-4 border-bottom">
                            <a href="${pageContext.request.contextPath}"
                                class="navbar-brand d-flex align-items-center col-md-2 mb-2 mb-md-0 text-dark text-decoration-none">
                                <img src="${pageContext.request.contextPath}/vendors/images/Doshopa_150x36.png" alt="Doshopa" width="150"
                                    height="36">
                            </a>
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation" onclick="openNav()">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <div class="collapse navbar-collapse" id="navbarNav">
                            	<ul class="nav navbar-nav me-auto"></ul>
                                <ul class="nav navbar-nav me-auto">
                                <!-- <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0"> -->
                                    <li class="nav-item"><a href="${pageContext.request.contextPath}" class="nav-link px-2 link-dark">Accueil</a></li>
                                    <li class="nav-item"><a href="${pageContext.request.contextPath}/galerie" class="nav-link px-2 link-dark">Galerie commerciale</a>
                                    </li>
                                    <li class="nav-item"><a href="" class="nav-link px-2 link-dark">FAQS</a></li>
                                    <% if(u!=null&&u.isBoutique()){ %>
                                        <li class="nav-item"><a href="${pageContext.request.contextPath}/oadmin" class="nav-link px-2 link-dark">G&eacute;rer ma
                                                boutique</a></li>
                                
                                        <% }else{%>
                                            <li class="nav-item"><a href="${pageContext.request.contextPath}/panier" class="nav-link px-2 link-dark"><i
                                                        class="fa-solid fa-cart-shopping fa-lg mt-1"></i></a></li>
                                            <% }%>
                                </ul>
                                <ul class="navbar-nav mw-auto">
                                <% if (u !=null) { %>
                                    <li class="nav-item">
                                        <a
                                            href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/accueil"><button
                                                type="button" class="btn btn-outline-dark me-2">Se
                                                déconnecter</button></a>
                                    </li>
                                <% } else { %>
                                    <li class="nav-item">
                                        <a href="${pageContext.request.contextPath}/login"><button type="button"
                                                class="btn btn-outline-dark me-2">Se
                                                connecter</button></a> <a href="${pageContext.request.contextPath}/inscription"><button
                                                type="button" class="btn btn-dark">S'inscrire</button></a>
                                            </li>
                                    <% } %>
                                </ul>
                            </div>
                        </nav>
                        
                        <!-- Side nav -->
                        <div id="sidemenuId" class="sidemenu">
						  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
						  <a href="${pageContext.request.contextPath}">Accueil</a>
						  <a href="${pageContext.request.contextPath}/galerie">Galerie commerciale</a>
						  <a href="">FAQS</a>
						  <% if(u!=null&&u.isBoutique()){ %>
                          	<a href="${pageContext.request.contextPath}/oadmin">G&eacute;rer ma
                                  boutique</a>
                          <% }else{%>
                            <a href="${pageContext.request.contextPath}/panier"><i
                                          class="fa-solid fa-cart-shopping fa-lg mt-1"></i></a>
                          <% }%>
                          <% if (u !=null) { %>
                                  <a
                                      href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/accueil"><button
                                          type="button" class="btn btn-outline-light btn-sm me-2">Se
                                          déconnecter</button></a>
                          <% } else { %>
                                  <a href="${pageContext.request.contextPath}/login"><button type="button"
                                          class="btn btn-outline-light btn-sm me-2">Se
                                          connecter</button></a> <a href="${pageContext.request.contextPath}/inscription"><button
                                          type="button" class="btn btn-light btn-sm">S'inscrire</button></a>
                          <% } %>
						</div>

                    </div>
                </section>