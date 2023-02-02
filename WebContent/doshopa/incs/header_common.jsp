<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>

<head>
     <jsp:include page='../incs/css.jsp' />
</head>
<body class="body ">
    <section>
        <div class="container">
            <header
                class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <a href="<?php echo base_url('/');?>"
                    class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
                    <!--- <img src="<?php?>"
                        style="width:40px;height:32px;" alt="" class="me-2">
                    !--->
                    Doshopa
                </a>

                <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                    <li><a href="${pageContext.request.contextPath}/doshopa" class="nav-link px-2 link-dark">Accueil</a></li>
                    <li><a href=""
                            class="nav-link px-2 link-dark">Galerie commerciale</a></li>
                    <li><a href="" class="nav-link px-2 link-dark">Categorie</a></li>
                    <li><a href="" class="nav-link px-2 link-dark">A propos</a></li>
                    <li><a href="" class="nav-link px-2 link-dark"><i class="fa-solid fa-cart-shopping fa-lg mt-1"></i></a></li>
                </ul>
                <div>
                    <a href="${pageContext.request.contextPath}/user?action=logout"><button type="button"
                            class="btn btn-outline-dark me-2">Se déconnecter</button></a>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/doshopa/pages/login.jsp"><button type="button"
                            class="btn btn-outline-dark me-2">Se connecter</button></a>
                    <a href="${pageContext.request.contextPath}/doshopa/pages/inscription.jsp"><button type="button"
                            class="btn btn-dark">S'inscrire</button></a>
                </div>
            </header>
        </div>
    </section>