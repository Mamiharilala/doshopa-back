<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<% 
	Boutique boutique = (Boutique)request.getAttribute("boutique");
	Utilisateur u = (Utilisateur) request.getSession().getAttribute("user");
%>
<html>
<head>
    <jsp:include page='../incs/css.jsp' />
</head>

<body class="body">
    <nav class="py-2 bg-light border-bottom">
        <div class="container d-flex flex-wrap">
            <ul class="nav me-auto">
                <li class="nav-item"><a href=""
                        class="nav-link link-dark px-2 active"
                        aria-current="page"><%=boutique.getDenomination() %></a>
                </li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/boutiques?ref=<%=request.getParameter("ref")%>#search" class="nav-link link-dark px-2">Produit</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/boutiques?ref=<%=request.getParameter("ref")%>#about" class="nav-link link-dark px-2">A propos</a></li>
                <li class="nav-item"><a href="${pageContext.request.contextPath}/panier" class="nav-link px-2 link-dark">Panier <i class="fa-solid fa-cart-shopping fa-lg mt-1"></i></a></li>

            </ul>
            <%if(u!=null){%>
            <ul class="nav">
                <li>
                    <a href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/accueil"><button type="button"
                            class="btn btn-outline-dark me-2">Se déconnecter</button></a>
                </li>
            </ul>
            <%}else{%>      
             <ul class="nav">
                <li class="nav-item"><a href="" class="nav-link link-dark px-2">Se
                        connecter</a></li>
                <li class="nav-item"><a href=" "
                        class="nav-link link-dark px-2">S'inscrire</a></li>
            </ul>
 			<%}%>
        </div>
    </nav>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-center">
            <a class="p-2 link-secondary text-decoration-none">Catégorie:</a>
            <a class="p-2 link-secondary"
                href=""><%=boutique.getCategorielib() %></a>
           
        </nav>
    </div>