<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic Page Info -->
<meta charset="utf-8" />
<title>Doshopa</title>

<!-- Site favicon -->
<link rel="site-brand-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa180x180.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/vendors/images/Doshopa16x16.png" />

<!-- Mobile Specific Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
	rel="stylesheet" />
<!-- CSS -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendors/styles/core.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendors/styles/icon-font.min.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/vendors/styles/style.css" />

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=G-GBZ3SGGX85"></script>
<script>
			window.dataLayer = window.dataLayer || [];
			function gtag() {
				dataLayer.push(arguments);
			}
			gtag("js", new Date());

			gtag("config", "G-GBZ3SGGX85");
		</script>
<!-- Google Tag Manager -->
<script>
			(function (w, d, s, l, i) {
				w[l] = w[l] || [];
				w[l].push({ "gtm.start": new Date().getTime(), event: "gtm.js" });
				var f = d.getElementsByTagName(s)[0],
					j = d.createElement(s),
					dl = l != "dataLayer" ? "&l=" + l : "";
				j.async = true;
				j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
				f.parentNode.insertBefore(j, f);
			})(window, document, "script", "dataLayer", "GTM-NXZMQSS");
		</script>
<!-- End Google Tag Manager -->
</head>
<body class="login-page">
	<div class="login-header box-shadow">
		<div
			class="container-fluid d-flex justify-content-between align-items-center">
			<div class="brand-logo">
				<a href="${pageContext.request.contextPath}"
					class="d-flex align-items-center col-md-2 mb-2 mb-md-0 text-dark text-decoration-none">
					<img src="${pageContext.request.contextPath}/vendors/images/Doshopa_150x36.png" alt="Doshopa" width="150" height="36" >
				</a>
			</div>
		</div>
	</div>
	<div
		class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 col-lg-7"></div>
				<div class="col-md-6 col-lg-5">
					<div class="login-box bg-white box-shadow border-radius-10">
						<div class="login-title">
							<h2 class="text-center text-dark">Bienvenue</h2>
						</div>
						<form
							action="${pageContext.request.contextPath}/oadmin/auth/treat_login.jsp"
							method="POST">
							<div class="input-group custom">
								<input type="text" name="login" value=""
									class="form-control form-control-lg" placeholder="Login" />
								<div class="input-group-append custom">
									<span class="input-group-text"><i
										class="icon-copy dw dw-user1"></i></span>
								</div>
							</div>
							<div class="input-group custom">
								<input type="password" name="pwd" value=""
									class="form-control form-control-lg" id="password"
									placeholder="**********" />
								<div class="input-group-append custom">
									<span class="input-group-text"><i
										class="dw dw-padlock1"></i></span>
								</div>
							</div>
							<div class="row pb-30">
								<div class="col-6">
									<div class="custom-control custom-checkbox">
										<input id="customCheck1" type="checkbox"
											class="custom-control-input" /> <label
											class="custom-control-label" for="customCheck1">Afficher
											le mot de passe</label> <input type="hidden" name="nextTarget"
											value="<%= request.getParameter("next") %>" />
									</div>
								</div>
								<div class="col-6">
									<div class="forgot-password">
										<a href="forgot-password.html">Mot de passe oublier?</a>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="input-group mb-0">

										<input class="btn btn-dark btn-lg btn-block" type="submit"
											value="Se connecter">

									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- js -->
	<script
		src="<%= request.getContextPath() %>/vendors/scripts/core.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/script.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/process.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/layout-settings.js"></script>
	<script>
			const togglePassword = document.querySelector("#customCheck1");
			const password = document.querySelector("#password");
			togglePassword.addEventListener("click", function () {
				const type = password.getAttribute("type") === "password" ? "text" : "password";
				password.setAttribute("type", type);
			});
		</script>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
</body>
</html>
