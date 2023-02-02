<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<% try{ 
	Categorie cat = new Categorie();
	cat.setCompleteTableName("article_categorie");
	Categorie[]articleCategorie =(Categorie[])Generalize.getListObject(cat, null);
//boutique catgeorie boutique
	cat.setCompleteTableName("boutique_categorie_boutique");
	Categorie[]boutique_categorie_boutique =(Categorie[])Generalize.getListObject(cat, null);
//4 first Boutique 
	Boutique boutique = new Boutique();
	boutique.setCompleteTableName("boutique_and_categorie_4first");
	Boutique[]arrayBoutique =(Boutique[])Generalize.getListObject(boutique, null);
	String image ="";
%>
<jsp:include page='../incs/header_common.jsp' />
<section class="container">
    <form action="" method="post">
        <div class="mt-4">
            <div class="mb-3 row">
                <div class="mt-4 col-xs-1 col-sm-1"></div>
                <label class="mt-4 col-xs-2 col-sm-2 col-form-label">Nom de produit</label>
                <div class="mt-4 col-xs-2 col-sm-2"><input type="text" value="" placeholder="Taper ici le nom" class="form-control" name="key_product"></div>
                <div class="mt-4 col-xs-3 col-sm-3">
                    <select class="form-select" aria-label="" name="categorie_ref">
                        <option value="%">Tous</option>
                        <%for (int cb = 0; cb <articleCategorie.length; cb++){%>
                        <option class="p-5" value="<%= articleCategorie[cb].getId()%>"><%= articleCategorie[cb].getDescription()%></option>
                        <% } %>
                    </select>
                </div>
                <div class="mt-4 col-xs-3 col-sm-3"><button type="submit" class="btn btn-dark">Chercher</button></div>
            </div>
        </div>
    </form>
</section>
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
                                        	image = request.getContextPath()+"/doshopa/assets/uploads/bg-boutique1.png";
                                        	if(util.Utility.stringWithoutNull(arrayBoutique[i].getLogo()).compareTo("")!=0){
                                                image = arrayBoutique[i].getLogo(); 
                                            }
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
                                            href="">Voir
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
    <a href="<?php echo base_url('boutique');?>" class="text-decoration-none"><button
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
                        <a href=""
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
vous pouvez acheter dans les boutiques ce que vous voulez de n'importe où en toute sécurité, facilement et rapidement.</p>
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
                    <?php for($i=0;$i<count($blog);$i++){?>
                    <div class="media-29101 card mb-20 col-xs-12 col-sm-12 shadow">
                        <!-- Card -->
                        <div class="card">
                            <!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top"
                                    src="<?php echo base_url('assets/images/pineapple-3836576_1920.jpg');?>"
                                    alt="Card image cap">
                                <a href="#!">
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title"><?php echo $blog[$i]->titre;?></h4>
                                <!-- Text -->
                                <p class="card-text text-dark text-truncate" style="height: 96px;">
                                    <?php echo $blog[$i]->body;?></p>
                                <!-- Button -->
                                <a href="<?php echo base_url('blog/'.$blog[$i]->id);?>"
                                    class="btn btn-dark shadow-lg">Lire la suite</a>

                            </div>

                        </div>
                        <!-- Card -->
                    </div>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>
</section><br>
<jsp:include page='../incs/footer_common.jsp' />
<% }catch(Exception e){%>
<script language="JavaScript">
    alert('<%=e.getMessage()%>');
    history.back();
</script>
<%}%>