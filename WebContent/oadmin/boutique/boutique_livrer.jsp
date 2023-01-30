<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="oadmin.*"%>
<div class="pd-20 card-box mb-30">
	<div class="clearfix">
		<h4 class="text-blue h4">Step wizard vertical</h4>
		<p class="mb-30">jQuery Step wizard</p>
	</div>
	<div class="wizard-content">
		<form class="tab-wizard wizard-circle wizard vertical" action="${pageContext.request.contextPath}/boutique/treat/treatBoutique.jsp">
			<h5>Personal Info</h5>
			<section>
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Code de livraison :</label> <input type="text" value=""
								name="code_livraison"
								class="form-control" />
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
			</section>	
			<div class="nav justify-content-center"><button type="submit" class="btn btn-success btn-lg">Livrer</button></div>
			<input type="hidden" class="form-control" name="mode" value="livrer" >
			<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/container.jsp?content=boutique/boutique_collecter.jsp" name="after">
			<input type="hidden" class="form-control" name="class" value="oadmin.CommandeMere">
		</form>
	</div>
</div>