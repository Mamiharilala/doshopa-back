<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<jsp:include page='../incs/header_boutique.jsp' />

<%
	try{
	Boutique boutique = (Boutique) request.getAttribute("boutique");
	String paginationArticle = (String) request.getAttribute("paginationArticle");
	Article[]arrayArticle = (Article[])request.getAttribute("arrayArticle");
	Promotion[]arrayPromotion = (Promotion[])request.getAttribute("arrayPromotion");
	Blog[]arrayBlog = (Blog[])request.getAttribute("arrayBlog");
	String image = "";
%>
<section class="py-1 text-center container">
	<div class="row py-lg-4">
		<div class="col-lg-6 col-md-8 mx-auto">
			<h1 class="fw-light">Chercher un produit</h1>
			<p class="lead text-muted">Nous offrons des produits de marque et
				moins chère</p>
			<p>
			<form action="<?php echo base_url('boutique/index')?>" method="get">
				<div class="btn my-2">
					<input type="search" class="form-control"
						placeholder="Nom de produit..." name="key_src" aria-label="Search">
				</div>
				<button type="submit" class="btn btn-secondary my-2">Rechercher</button>
			</form>
			</p>
		</div>
	</div>
</section><br>
<section>
	<div class="album py-5">
		<div class="container">
 			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<%for(int i=0;i<arrayArticle.length;i++){%>
				<div class="col">
					<div class="card shadow-sm">
						<% 
 							image = request.getContextPath()+"/doshopa/assets/images/svg/product-bg1.svg";
                    		if(util.Utility.stringWithoutNull(arrayArticle[i].getImage()).compareTo("")!=0){
                            	image = request.getContextPath()+arrayArticle[i].getImage(); 
                        	}
                        %>
						<a
							href=""><img
							src="<%=image%>" alt="" height="225px"
							class="card-img-top"></a>
						<div class="card-body">
							<h5 class="card-title">
								<a
									href="">
									<%= arrayArticle[i].getDesignation() %>
								</a>
							</h5>
							<p class="card-text">
								<%=Utility.format(arrayArticle[i].getPrix())+" "+arrayArticle[i].getDevise_id() %>
							</p>
							<p class="card-text">
								<%= Utility.stringWithoutNull(arrayArticle[i].getObservation()) %>
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<form action="${pageContext.request.contextPath}/doshopa/pages/treat.jsp" method="POST">
								<input type="hidden" value="<%=arrayArticle[i].getId()%>" name="ref_object">
								<input type="hidden" class="form-control" value="purchache_product" name="mode">
								<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/panier" name="after">		
								<div class="btn-group">
									 <button
											type="submit" class="btn btn-sm btn-warning text-white">Acheter</button>
								</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<% } %>
			</div>
			<div class="mt-4 container">
				<div class="text-center">
					<div><%=paginationArticle%></div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="mt-2">
	<div class="text-center">
		<div>
			<button type="button" class="btn btn-outline-dark">Voir plus</button>
		</div>
	</div>
</section>
<section>
	<div class="album py-5">
		<div class="container">
			<% if(arrayPromotion.length>0){%>
			<h4 class="fst-italic text-center py-3 text-center">Promotions</h4>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<%for(int i=0;i<arrayPromotion.length;i++){%>
				<div class="col">
					<div class="card shadow-sm">
						<%
											image = request.getContextPath()+"/doshopa/images/svg/product-bg1.svg";
                                            if(image!=null){
                                                image = request.getContextPath()+arrayPromotion[i].getImage(); 
                                            }
                        %>
						<a
							href=""><img
							src="<%= image%>" alt="" height="225px"
							class="card-img-top"></a>
						<div class="card-body">
							<h5 class="card-title">
								<a
									href="<?php echo base_url('boutique/produit/'.$promotion[$i]->id);?>">
									<%=arrayPromotion[i].getDesignation()%>
								</a>
							</h5>
							<p class="card-text">
								<%=Utility.format(arrayPromotion[i].getPrix_actuel())+" "+Utility.stringWithoutNull(arrayPromotion[i].getDevise_id())%>
							</p>
							<p class="card-text">
								<%= Utility.stringWithoutNull(arrayPromotion[i].getObservation()) %>
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a
										href=""><button
											type="button" class="btn btn-sm btn-warning text-white">Acheter</button></a>
								</div>

							</div>
						</div>
					</div>
				</div>
				<%} %>
			</div>
			<%} %>
		</div>
	</div>
</section>
<section class="mt-2">
	<div class="text-center">
		<div>
			<button type="button" class="btn btn-outline-dark">Voir plus</button>
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
                                <a href=""
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
</section>
<section class="mt-5">
	<div class="text-center">
		<div>
			<button type="button" class="btn btn-outline-dark">Voir plus</button>
		</div>
	</div>
</section>
<br>
<section id="" class="mt-4 bg-dark text-white">
	<div class="container p-5">
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<div>
					<h5>
						<%= boutique.getDenomination() %>
					</h5>
				</div>
				<div>
					Contact:
					 <%= Utility.stringWithoutNull(boutique.getTelephone()) %>
				</div>
				<div>
					<%=Utility.stringWithoutNull(boutique.getMail()) %>
				</div>
				<hr />
				<%= Utility.stringWithoutNull(boutique.getApropos()) %>
			</div>
			<div class="col-xs-6 col-sm-4">
				<%= Utility.stringWithoutNull(boutique.getNote()) %>
			</div>
			<div class="col-xs-6 col-sm-4">
				<%= Utility.stringWithoutNull(boutique.getInformation())%>
			</div>
		</div>
	</div>
</section>
<br>
<% }catch(Exception e){e.printStackTrace();%>
<script language="JavaScript">
    alert('<%=e.getMessage()%>');
    history.back();
</script>
<%}%>
<jsp:include page='../incs/footer_boutique.jsp' />