<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="front.*"%>
<%@ page import="java.time.Year"%>
<%@ page import="system.*"%>
<%
	if (session.getAttribute("user") == null) {
		response.sendRedirect("auth/login.jsp");
	} else {
		Utilisateur u = (Utilisateur) session.getAttribute("user");
%>
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

<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag("js", new Date());

	gtag("config", "G-GBZ3SGGX85");
</script>

</head>
<body>
	<div class="header">
		<div class="header-left">
			<div class="menu-icon bi bi-list"></div>
			<div class="search-toggle-icon bi bi-search"
				data-toggle="header_search"></div>
			<div class="header-search">
				<form>
					<div class="form-group mb-0">
						<i class="dw dw-search2 search-icon"></i> <input type="text"
							class="form-control search-input" placeholder="Recherche" disabled />
						 
					</div>
				</form>
			</div>
		</div>
		<div class="header-right">
			<div class="user-notification">
				<div class="dropdown">
					<a class="dropdown-toggle no-arrow" href="#" role="button"
						data-toggle="dropdown"> <i
						class="icon-copy dw dw-notification"></i> <span
						class="badge notification-active"></span>
					</a>
					<div class="dropdown-menu dropdown-menu-right">
						<div class="notification-list mx-h-350 customscroll">
						<!--  
							<ul>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/vendors/images/img.jpg"
										alt="" />
										<h3>John Doe</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/vendors/images/photo1.jpg"
										alt="" />
										<h3>Lea R. Frith</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/vendors/images/photo2.jpg"
										alt="" />
										<h3>Erik L. Richards</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/vendors/images/photo3.jpg"
										alt="" />
										<h3>John Doe</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/vendors/images/photo4.jpg"
										alt="" />
										<h3>Renee I. Hansen</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
								<li><a href="#"> <img
										src="${pageContext.request.contextPath}/vendors/images/img.jpg"
										alt="" />
										<h3>Vicki M. Coleman</h3>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed...</p>
								</a></li>
							</ul>
						-->
						</div>
					</div>
				</div>
			</div>
			<div class="user-info-dropdown">
				<div class="dropdown">
					<a class="dropdown-toggle" href="#" role="button"
						data-toggle="dropdown"> <span class="user-icon"> <i class="icon-copy fa fa-user-circle" aria-hidden="true"></i>
					</span> <span class="user-name"><%=u.getLogin()%></span>
					</a>
					<div
						class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
						<a class="dropdown-item" href="${pageContext.request.contextPath}/oadmin/container.jsp?content=profil/user_detail.jsp"><i
							class="dw dw-user1"></i> Profile</a> <a class="dropdown-item"
							href="${pageContext.request.contextPath}/oadmin/container.jsp?content=profil/boutique_detail.jsp"><i class="dw dw-settings2"></i> Paramètres</a> <a
							class="dropdown-item" href="faq.html"><i class="dw dw-help"></i>
							Aide</a> <a class="dropdown-item" href="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=logout&after=${pageContext.request.contextPath}/oadmin"><i
							class="dw dw-logout"></i> Se déconnecter</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="right-sidebar">
		<div class="sidebar-title">
			<h3 class="weight-600 font-16 text-blue">
				Layout Settings <span class="btn-block font-weight-400 font-12">User
					Interface Settings</span>
			</h3>
			<div class="close-sidebar" data-toggle="right-sidebar-close">
				<i class="icon-copy ion-close-round"></i>
			</div>
		</div>
		<div class="right-sidebar-body customscroll">
			<div class="right-sidebar-body-content">
				<h4 class="weight-600 font-18 pb-10">Header Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary header-white active">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary header-dark">Dark</a>
				</div>

				<h4 class="weight-600 font-18 pb-10">Sidebar Background</h4>
				<div class="sidebar-btn-group pb-30 mb-10">
					<a href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-light active">White</a> <a
						href="javascript:void(0);"
						class="btn btn-outline-primary sidebar-dark">Dark</a>
				</div>
				<h4 class="weight-600 font-18 pb-10">Menu Dropdown Icon</h4>
				<div class="sidebar-radio-group pb-10 mb-10">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-1" name="menu-dropdown-icon"
							class="custom-control-input" value="icon-style-1" checked="" />
						<label class="custom-control-label" for="sidebaricon-1"><i
							class="fa fa-angle-down"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-2" name="menu-dropdown-icon"
							class="custom-control-input" value="icon-style-2" /> <label
							class="custom-control-label" for="sidebaricon-2"><i
							class="ion-plus-round"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebaricon-3" name="menu-dropdown-icon"
							class="custom-control-input" value="icon-style-3" /> <label
							class="custom-control-label" for="sidebaricon-3"><i
							class="fa fa-angle-double-right"></i></label>
					</div>
				</div>

				<h4 class="weight-600 font-18 pb-10">Menu List Icon</h4>
				<div class="sidebar-radio-group pb-30 mb-10">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-1" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-1" checked="" />
						<label class="custom-control-label" for="sidebariconlist-1"><i
							class="ion-minus-round"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-2" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-2" /> <label
							class="custom-control-label" for="sidebariconlist-2"><i
							class="fa fa-circle-o" aria-hidden="true"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-3" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-3" /> <label
							class="custom-control-label" for="sidebariconlist-3"><i
							class="dw dw-check"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-4" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-4" checked="" />
						<label class="custom-control-label" for="sidebariconlist-4"><i
							class="icon-copy dw dw-next-2"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-5" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-5" /> <label
							class="custom-control-label" for="sidebariconlist-5"><i
							class="dw dw-fast-forward-1"></i></label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" id="sidebariconlist-6" name="menu-list-icon"
							class="custom-control-input" value="icon-list-style-6" /> <label
							class="custom-control-label" for="sidebariconlist-6"><i
							class="dw dw-next"></i></label>
					</div>
				</div>

				<div class="reset-options pt-30 text-center">
					<button class="btn btn-danger" id="reset-settings">Reset
						Settings</button>
				</div>
			</div>
		</div>
	</div>

	<div class="left-side-bar">
		<div class="brand-logo">
			<a href="#">
				<div class="dark-logo" style="color: black;">Doshopa</div>
				<div class="light-logo">doshopa.com</div>
			</a>
			<div class="close-sidebar" data-toggle="left-sidebar-close">
				<i class="ion-close-round"></i>
			</div>
		</div>
		<div class="menu-block customscroll">
			<div class="sidebar-menu">
				<ul id="accordion-menu">
					<%
						Menu menu = new Menu();
						menu.setCompleteTableName("menu_granted");
						out.println(menu.getStringMenu(u));
					%>
				</ul>
			</div>
		</div>
	</div>
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="pd-ltr-20 xs-pd-20-10">
			<div class="min-height-200px">
				<!-- Default Basic Forms Start -->
				<jsp:include page='<%=request.getParameter("content")%>' />
				<!-- Default Basic Forms End -->
			</div>
		</div>
	</div>
	<div class="footer-wrap pd-20 mb-20">
		Copyright &copy;
		<%=Year.now()%>
		Doshopa Tous droits reserv<%="&eacute;"%>s
	</div>
	<!-- js -->
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/core.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/script.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/process.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/scripts/layout-settings.js"></script>
	<script src="${pageContext.request.contextPath}/src/scripts/popup.js"></script>
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NXZMQSS"
			height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
</body>
</html>
<%
	}
%>