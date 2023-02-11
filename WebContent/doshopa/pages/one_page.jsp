<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<% try{ 
	Blog[]arrayBlog = (Blog[])request.getAttribute("arrayBlog");
 	Boutique[]arrayBoutique= (Boutique[])request.getAttribute("arrayBoutique");
 	Categorie[]boutique_categorie_boutique= (Categorie[])request.getAttribute("boutique_categorie_boutique");
 	Categorie[]articleCategorie= (Categorie[])request.getAttribute("articleCategorie");
 	String image= "";
 %>
<jsp:include page='../incs/header_common.jsp' />
<section>
    <div class="">
        <div class="site-section mb-1">
            <div class="container owl-2-style">
                <h4 class="fst-italic text-center py-3 text-center">Boutiques</h4>
                <div class="owl-carousel owl-2">
                    <% image =""; for(int i=0;i<arrayBoutique.length;i++){%>
                    <div class="media-29101">
                        <div class="m-10">
                            <div class="col-xs-12 col-sm-12">
                                <div class="card shadow">
                                    <div class="card-body text-center">
                                        <% 
                                        	image = request.getContextPath()+arrayBoutique[i].getLogo(); 
                                        %>
                                        <img src="<%=image%>" alt="">
                                        <h5 class="card-title text-center"><%=arrayBoutique[i].getDenomination()%> 
                                        </h5>
                                        <p class="card-text text-center">
                                        <div class="mt-2">
                                            <%=  arrayBoutique[i].getCategorielib()%>
                                        </div>
                                        </p>
                                        <a class="btn btn-dark"
                                            href="${pageContext.request.contextPath}/boutiques?ref=<%=arrayBoutique[i].getId() %>">Voir
                                            la boutique</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section><br><br>
<section class="text-center">
    <a href="${pageContext.request.contextPath}/galerie" class="text-decoration-none"><button
            class="btn btn-outline-dark btn-sm">Voir toutes les boutiques</button></a>
</section>
<br>
<section class="container" id="categorie">
    <div class="row g-5 mt-4">
        <div class="col-xs-8 col-sm-8 row text-center">
            <%for(int i=0;i<boutique_categorie_boutique.length;i++){%>
            <div class="col-xs-6 col-sm-6">
                <!-- Card Dark -->
                <div class="card mb-3">
                    <% image = request.getContextPath()+"/doshopa/assets/uploads/cat-boutique.png";
                    %>
                    <!-- Card image -->
                    <div class="view overlay">
                        <img class="card-img-top" src="<%=image%>" alt="Card image cap">
                        <a>
                            <div class="mask rgba-white-slight"></div>
                        </a>
                    </div>
                    <!-- Card content -->
                    <div class="card-body elegant-color white-text rounded-bottom">

                        <!-- Social shares button -->
                        <!-- Title -->
                        <h4 class="card-title"><%= boutique_categorie_boutique[i].getCode()%></h4>
                        <hr class="hr-light">
                        <!-- Text -->
                        <p class="card-text text-dark mb-4"><%= boutique_categorie_boutique[i].getDescription()%></p>
                        <!-- Link -->
                        <a href="${pageContext.request.contextPath}/galerie?categorie_ref=<%=boutique_categorie_boutique[i].getId()%>"
                            class="text-dark d-flex justify-content-end text-decoration-none">
                            <h5>Voir tous <i class="fas fa-angle-double-right"></i></h5>
                        </a>
                    </div>
                </div>
                <!-- Card Dark -->
            </div>
            <% }%>
        </div>

        <div class="col-xs-4 col-sm-4">
            <div class="position-sticky" style="top: 2rem;">
                <div class="p-4 mb-3 bg-light rounded">
                    <h4 class="fst-italic" id="apropos"></h4>
                    <p class="mb-0 text-dark">Vous souhaitez acheter des produits ou des services sans avoir à vous rendre dans un magasin physique ? 
Doshopa le rend possible pour vous ! Avec notre plateforme e-commerce, 
vous pouvez acheter dans les boutiques ce que vous voulez de n'importe où, en toute sécurité, facilement et rapidement.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<br>
<section>
    <div class="">
        <div class="site-section mb-3">
            <div class="container owl-2-style">
                <h4 class="fst-italic text-center py-3 text-center">Blogs</h4>
                <div class="owl-carousel owl-2">
                    <%for(int i=0;i<arrayBlog.length;i++){ image = request.getContextPath()+""+arrayBlog[i].getImage();
                    %>
                    <div class="media-29101 card mb-20 col-xs-12 col-sm-12 shadow">
                        <!-- Card -->
                        <div class="card">
                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top"
                                    src="<%=image %>"
                                    alt="Card image cap">
                                <a href="#!">
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title"><%=arrayBlog[i].getTitre()%></h4>
                                <!-- Text -->
                                <p class="card-text text-dark text-truncate" style="height: 96px;">
                                    <%= arrayBlog[i].getBody() %></p>
                                <!-- Button -->
                                <a href="${pageContext.request.contextPath}/blog?ref=<%=arrayBlog[i].getId() %>"
                                    class="btn btn-dark shadow-lg">Lire la suite</a>

                            </div>

                        </div>
                        <!-- Card -->
                    </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section><br>
<jsp:include page='../incs/footer_common.jsp' />
<% }catch(Exception e){e.printStackTrace();%>
<script language="JavaScript">
    alert('<%=e.getMessage()%>');
    history.back();
</script>
<%}%>