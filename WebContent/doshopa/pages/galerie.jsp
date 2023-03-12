<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<% 
Categorie[]arrayCategorieBoutique = (Categorie[])request.getAttribute("arrayCategorieBoutique");
String paginationArticle = (String)request.getAttribute("paginationArticle");
Boutique[]arrayBoutique = (Boutique[])request.getAttribute("arrayBoutique");
String image="";
%>
<jsp:include page='../incs/header_common.jsp' /><br>
<form action="${pageContext.request.contextPath}/galerie"
	method="post">
	<section class="container">
		<div class="mt-4">
			<div class="mb-3 row">
				<div class="mt-4 col-xs-1 col-sm-1"></div>
				<label class="mt-4 col-xs-2 col-sm-2 col-form-label">Nom de
					boutique</label>
				<div class="mt-4 col-xs-2 col-sm-2">
					<input type="text" class="form-control" name="product_key">
				</div>
				<div class="mt-4 col-xs-1 col-sm-1"></div>
				<div class="mt-4 col-xs-3 col-sm-3">
					<select class="form-select" aria-label="" name="categorie_ref">
						<option value="">Tous</option>
						<% for (int cb = 0; cb < arrayCategorieBoutique.length; cb++) { %>
						<option class="p-5"
							value="<%= arrayCategorieBoutique[cb].getId()%>">					 
							<%= arrayCategorieBoutique[cb].getDescription()%>
							</option>
						<% } %>
					</select>
				</div>
				<div class="mt-4 col-xs-3 col-sm-3">
					<button type="submit" class="btn btn-dark">Chercher</button>
				</div>
			</div>
		</div>
	</section>
	<div class="container container-fluid mt-5 mb-3">
		<div class="row">
			<%for (int i = 0; i < arrayBoutique.length; i++) { %>
			<div class="col-xs-6 col-sm-4">
				<div class="card p-3 mb-2 shadow">
					<% 
                     
                         image =  Utility.stringWithoutNull(request.getContextPath()+arrayBoutique[i].getLogo());
  
					%>

					<img src="<%=image%>" class="card-img-top" alt="...">
					<div class="card-body text-center">
						<h5 class="card-title">
							<%=arrayBoutique[i].getDenomination()%>
						</h5>
						<div class="mt-1">
							<%=arrayBoutique[i].getCategorielib()%>
						</div>
						<div class="mt-1">
							<%=arrayBoutique[i].getSiege()%>
						</div>
						<div class="mt-1">
							<%=arrayBoutique[i].getTelephone()%>
						</div>

						<div class="mt-1">
							<a
								href="${pageContext.request.contextPath}/boutiques?ref=<%=arrayBoutique[i].getId() %>"
								class="btn btn-danger active">Voir la boutique <i class="fa-solid fa-arrow-right text-light fa fa-lg"></i></a>
						</div>
					</div>
				</div>
			</div>
			<% } %>
		</div>
	</div>
	<div class="container">
		<nav>
			<ul class="pagination">
				<%=paginationArticle %>
			</ul>
		</nav>
	</div>
</form>
<jsp:include page='../incs/footer_common.jsp' />