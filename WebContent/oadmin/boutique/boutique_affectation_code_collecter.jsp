<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.*"%>
<div class="pd-20 card-box mb-30">
	<div class="clearfix">
		<h4 class="text-blue h4">Planning livraison commande par la boutique</h4>
		<p class="mb-30">Mettre le code g&eacute;n&eacute;rer dans les produits ayant le code que vous allez taper</p>
	</div>
	<div class="wizard-content">
		<form class="tab-wizard wizard-circle wizard vertical" action="${pageContext.request.contextPath}/oadmin/boutique/treat/treatBoutique.jsp">
			<h5>Affectation code</h5>
			<section>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Code collecter :</label> <input type="text" value="<%= CommandeMere.generateIDCollecter() %>"
								name="code_collecter"
								class="form-control" />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Numéro de commande :</label> <input type="text" name="commande"
								class="form-control" />
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</section>	
			<div class="nav justify-content-center"><button type="submit" class="btn btn-success btn-lg">Affecter le code</button></div>
			<input type="hidden" class="form-control" value="code_collecter" name="mode">
			<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/oadmin/container.jsp?content=boutique/boutique_affectation_code_collecter.jsp" name="after">
			<input type="hidden" class="form-control" name="class" value="doshopa.CommandeMere">
		</form>
	</div>
</div>