<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<jsp:include page='../incs/header_boutique.jsp' />

<%
	Boutique boutique = (Boutique) request.getAttribute("boutique");
	String paginationArticle = (String) request.getAttribute("paginationArticle");
	Article[]arrayArticle = (Article[])request.getAttribute("arrayArticle");
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
</section>
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
								<%= arrayArticle[i].getPrix()+" "+arrayArticle[i].getDevise_id() %>
							</p>
							<p class="card-text">
								<%= arrayArticle[i].getObservation() %>
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a
										href="<?php echo base_url('utilisateur/commander?product='.$article[$i]->id);?>"><button
											type="button" class="btn btn-sm btn-warning text-white">Acheter</button></a>
								</div>

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

			<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
				<?php for($i=0;$i<count($promotion);$i++){ ?>
				<div class="col">
					<div class="card shadow-sm">
						<?php 
                                            $image = base_url('assets/images/svg/product-bg1.svg');
                                            if($promotion[$i]->image!=null){
                                                $image = $promotion[$i]->image; 
                                            }
                        ?>
						<a
							href="<?php echo base_url('boutique/produit/'.$promotion[$i]->id);?>"><img
							src="<?php echo $image;?>" alt="" height="225px"
							class="card-img-top"></a>
						<div class="card-body">
							<h5 class="card-title">
								<a
									href="<?php echo base_url('boutique/produit/'.$promotion[$i]->id);?>">
									<?php echo $promotion[$i]->designation;?>
								</a>
							</h5>
							<p class="card-text">
								<?php echo $promotion[$i]->prix." ".$promotion[$i]->devise_description;?>
							</p>
							<p class="card-text">
								<?php echo $promotion[$i]->observation?>
							</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<a
										href="<?php echo base_url('utilisateur/commander?product='.$promotion[$i]->id);?>"><button
											type="button" class="btn btn-sm btn-warning text-white">Acheter</button></a>
								</div>

							</div>
						</div>
					</div>
				</div>
				<?php } ?>
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
<section id="" class="mt-4 bg-dark text-white">
	<div class="container p-5">
		<div class="row">
			<div class="col-xs-6 col-sm-4">
				<div>
					<h5>
						<?php echo $boutique->denomination;?>
					</h5>
				</div>
				<div>
					Contact:
					<?php echo $boutique->telephone;?>
				</div>
				<div>
					<?php echo $boutique->mail;?>
				</div>
				<hr />
				<?php echo $boutique->apropos;?>
			</div>
			<div class="col-xs-6 col-sm-4">
				<?php echo $boutique->note;?>
			</div>
			<div class="col-xs-6 col-sm-4">
				<?php echo $boutique->information;?>
			</div>
		</div>
	</div>
</section>
<br>
<section class="text-center mt-5">
	<h3 class="fw-light">Produits populaires</h3>
</section>
<br>
<section>
	<div class="">
		<div class="site-section mb-1">
			<div class="container owl-2-style">
				<div class="owl-carousel owl-2 p-2">
					<?php for($i=0;$i<count($article_populaire);$i++){?>
					<div class="card shadow p-4 mb-5">
						<img src="<?php echo $article_populaire[$i]->image;?>"
							height="225px" class="card-img-top" alt="...">
						<div class="mt-15 text-center">
							<h6>
								<a class="text-decoration-none text-dark"
									href="<?php echo base_url('boutique/produit');?>">
									<?php echo $article_populaire[$i]->designation;?>
								</a>
							</h6>
						</div>
						<div style="text-decoration: line-through;" class="text-red"></div>
						<div class="size-font-25 text-center">
							<strong>
								<?php echo $article_populaire[$i]->prix.' '.$article_populaire[$i]->devise;?>
							</strong>
						</div>

						<div class="mt-15 card-body">
							<form action="<?php echo base_url('utilisateur/commander');?>"
								method="post">
								<input type="hidden" name="afterurl"
									value="<?php echo base_url('boutique?id='.$boutique->id);?>">
								<input type="hidden" name="product"
									value="<?php echo $article_populaire[$i]->id;?>"
									class="form-control">
								<div class="mb-3 col-xs-12 col-sm-12 mt-2 text-center">
									<button type="submit" class="btn btn-outline-dark">Ajouter
										au panier</button>
								</div>
							</form>
						</div>
					</div>
					<?php } ?>
				</div>
			</div>
		</div>
	</div>
</section>
<br>
<section class="text-center mt-5">
	<h3 class="fw-light">Blogs</h3>
</section>
<br>
<section>
	<div class="">
		<div class="site-section mb-1">
			<div class="container owl-2-style">
				<div class="owl-carousel owl-2">
					<?php for($i=0;$i<count($blog);$i++){?>
					<div class="media-29101 card mb-20 col-xs-12 col-sm-12 shadow"
						style="width: 20rem;">
						<img
							src="<?php echo base_url('assets/images/pineapple-3836576_1920.jpg');?> "
							class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">
								<?php echo $blog[$i]->titre;?>
							</h5>
							<?php echo $blog[$i]->date_insert;?>
							<p class="card-text text-black text-truncate"
								style="height: 80px">
								<?php echo $blog[$i]->body;?>
							</p>
							<a href="#" class=""><b>Lire la suite</b></a>
						</div>
					</div>
					<?php } ?>
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
<<jsp:include page='../incs/footer_boutique.jsp' />