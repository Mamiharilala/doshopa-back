<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Doshopa</title>
<!-- Site favicon -->
<link rel="site-brand-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa180x180.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa16x16.png" />
<jsp:include page='../incs/css.jsp' />
<jsp:include page='../incs/css.jsp' />
</head>
<body>
<section>
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col col-xl-10">
                    <div class="" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="${pageContext.request.contextPath}/doshopa/assets/images/login-image.jpg" alt="login form"
                                    class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-4 col-lg-5 d-flex align-items-center">
                                <div class="card-body p-3 p-lg-4 text-black">
                                    <form action="${pageContext.request.contextPath}/login" method="post">
                                        <center>
                                            <div class="align-items-center mb-3 pb-1">
                                                <img src="${pageContext.request.contextPath}/vendors/images/Doshopa_150x36.png" alt="Doshopa" width="158" height="38" >
                                            </div>
                                            <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">                   
                                                Identification
                                             </h5>
                                        </center>
                                        <div class="form-outline mb-4">
                                            <label class="form-label" for="form2Example18">Identifiant</label>
                                            <input type="text" name="login" id="form2Example18"
                                                class="btn-sm form-control form-control-lg" />
                                        </div>
                                        <div class="form-outline mb-3">
                                            <label class="form-label" for="form2Example27">Mot de passe</label>
                                            <input name="mot_passe" type="password" id="form2Example27"
                                                class="btn-sm form-control form-control-lg" />
                                        </div>
                                        <div class="pt-1 mb-2">
                                            <div class="d-grid gap-2">
                                                <button class="btn btn-dark" type="submit">Se connecter</button>
                                            </div>
                                        </div>
                                        <a class="small text-muted" href="#!">Mot de passe oubli&eacute;?</a>
                                        <p class="mb-5 pb-lg-2" style="color: #393f81;">Vous n'avez pas de compte ? Inscrivez-vous d&egrave;s maintenant pour acc&eacute;der aux boutiques et recevoir des offres sp&eacute;ciales. <a
                                                href="${pageContext.request.contextPath}/inscription" style="color: #393f81;">S'inscrire</a></p>
                                        <a href="#!" class="small text-muted">Conditions d'utilisation</a>
                                        <a href="#!" class="small text-muted">Politique de confidentialit&eacute;</a>
                                     </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
<jsp:include page='../incs/js.jsp' />