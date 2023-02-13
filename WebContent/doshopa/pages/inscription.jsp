<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<!DOCTYPE html>
<% 
	Categorie[]sexe= (Categorie[])request.getAttribute("sexe");
 %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inscription sur Doshopa</title>
<jsp:include page='../incs/css.jsp' />
</head>
<body>
	<section class="h-100">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<form action="${pageContext.request.contextPath}/inscription" method="post">
 					<input type="hidden" class="form-control" name="class" value="system.Utilisateur">
					<input type="hidden" name="mode" value="inscription">
					<div class="col">
						<div class=" card-registration my-4">
							<div class="row g-0">
								<div class="col-xl-6 d-none d-xl-block">
									<img
										src="${pageContext.request.contextPath}/doshopa/assets/images/inscription-image.jpg"
										alt="Sample photo" class="img-fluid"
										style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
								</div>
								<div class="col-xl-6">
									<div class="card-body p-md-5 text-black">
										<center>
											<div class="align-items-center mb-3 pb-1">
												<span class="h1 fw-bold mb-0">Doshopa</span>
											</div>
											<br>
											<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">
												Inscription</h5>
										</center>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<label class="form-label" for="form3Example1m">Nom</label>
													<input name="nom" type="text" id="form3Example1m"
														class="form-control form-control-lg btn-sm" />
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<label class="form-label" for="form3Example1n">Prénoms</label>
													<input name="prenom" type="text" id="form3Example1n"
														class="form-control form-control-lg btn-sm" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<label class="form-label" for="form3Example1n1">Pseudo/Identifiant</label>
													<input name="login" type="text" id="form3Example1n1"
														class="form-control form-control-lg btn-sm" />
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<label class="form-label" for="form3Example1n1">Nouveau
														mot de passe</label> <input name="mot_passe" type="password"
														id="form3Example1n1"
														class="form-control form-control-lg btn-sm" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<label class="form-label" for="form3Example1m1">Telephone</label>
													<input name="telephone" type="text" id="form3Example1m1"
														class="form-control form-control-lg btn-sm" />
												</div>
											</div>
											<div class="col-md-6 mb-4">
												<div class="form-outline">
													<label class="form-label" for="form3Example1m1">Adresse</label>
													<input name="adresse" type="text" id="form3Example1m1"
														class="form-control form-control-lg btn-sm" />
												</div>
											</div>
										</div>
										<div class="form-outline mb-4">
											<label class="form-label" for="form3Example9">E-mail</label>
											<input type="text" name="mail" id="form3Example9"
												class="btn-sm form-control form-control-lg" />
										</div>
										<div
											class="d-md-flex justify-content-start align-items-center mb-4 py-2">
											<h6 class="mb-0 me-4">Sexe:</h6>
											<div class="form-check form-check-inline mb-0 me-4">
												<select name="sexe" class="form-select">
													<% for(int i=0;i<sexe.length;i++){%>
 													<option value="<%=sexe[i].getId()%>"><%=sexe[i].getDescription()%></option>
 													<% }%>
												</select>
											</div>

										</div>
										<p class="mb-1 pb-lg-2" style="color: #393f81;">
											Déjà fait une inscription? <a
												href="${pageContext.request.contextPath}/login"
												style="color: #393f81;">Se connecter</a>
										</p>
										<a href="#!" class="small text-muted">Terms of use.</a> <a
											href="#!" class="small text-muted">Privacy policy</a>
										<div class="d-flex justify-content-end pt-2">
											<button type="submit" class="btn btn-dark btn-lg ms-2 btn-sm">S'inscrire</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
<jsp:include page='../incs/js.jsp' />
</html>