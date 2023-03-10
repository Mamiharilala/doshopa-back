<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<jsp:include page='../incs/header_common.jsp' />
<br>
<br>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<%
	String str = "";
	String numeroCommande = (String) request.getAttribute("idCommande");
	String paginationCommande = (String) request.getAttribute("paginationCommande");
	BoutiqueCommande[] arrayCommande = (BoutiqueCommande[]) request.getAttribute("arrayCommande");
	LocalisationLivraison[] localisation = (LocalisationLivraison[]) request.getAttribute("localisation");
%>
<div class="container">
	<!-- Delivery button -->
	<button type="button" class="btn btn-success" data-bs-toggle="modal"
		data-bs-target="#staticBackdrop">Livrer mes commandes</button>
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Livraison</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="${pageContext.request.contextPath}/doshopa/pages/treat.jsp" method="POST">
					<div class="modal-body">
						<input type="hidden" name="ref" value="<%=numeroCommande%>">
						<div class="mb-3 col-sm-7 col-xs-6">
							<label for="lieu_livraison" class="form-label">Lieu de
								livraison </label> <select class="form-select" id="lieu_livraison"
								aria-label="Localisation" name="localisation">
								<%for(int i=0;i<localisation.length;i++){%>
								<option value="<%=localisation[i].getLocalisation()%>"><%=localisation[i].getLocalisation()%></option>
								<%}%>
							</select>
						</div>
						<input type="hidden" class="form-control" value="${pageContext.request.contextPath}/panier" name="after">
						<div class="mb-3 col-sm-6 col-xs-6">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="localisation_checkbox" name="localisation_checkbox">
								<label class="form-check-label" for="localisation_checkbox">Autre</label>
							</div>
						</div>
						<input type="hidden" class="form-control" value="confirm_purchase" name="mode">
						<div class="mb-3 col-sm-6 col-xs-6" id="another_localisation"></div>
						<div class="mb-3 col-sm-6 col-xs-6">
							<label for="contact" class="form-label">Contact </label> <input
								type="text" name="contact" class="form-control" id="contact">
						</div>
						<div class="mb-3 col-sm-6 col-xs-6">
							<label for="estimated_delivery_cost" class="form-label">Frais
							</label> <input type="text" class="form-control" value="<%=Utility.format(Constant.frais)+" Ar"%>"
								id="estimated_delivery_cost" disabled>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Retour</button>
						<button type="submit" class="btn btn-success">Confirmer</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<form class="mt-2"
		action="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=update_order"
		method="POST">
		<div class="col-xs-2 col-sm-2">
			<input type="hidden" name="ref" value="<%=numeroCommande%>">
			<input type="hidden" name="after"
				value="${pageContext.request.contextPath}/panier">
		</div>
		<div class="table-responsive">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th scope="col" class="text-center">#</th>
						<th scope="col" class="text-center">Designation</th>
						<th scope="col" class="text-center">Quantité</th>
						<th scope="col" class="text-center">PU</th>
						<th scope="col" class="text-center">Montant</th>
						<th scope="col" class="text-center">Status</th>
					</tr>
				</thead>
				<tbody>
					<%
						int totalInProcess = 0;
						for (int i = 0; i < arrayCommande.length; i++) {
					%>
					<tr>
						<th scope="row">
							<%
								if (arrayCommande[i].getEtat() == Constant.createdState) {
							%> <input class="form-check-input" type="checkbox"
							name="commande_checkbox<%=i%>" value="<%=i%>"> <%
 	totalInProcess++;
 		}
 %>

						</th>
						<input type="hidden" name="idpanier<%=i%>"
							value="<%=arrayCommande[i].getId()%>">
						<input type="hidden" name="numero" value="<%=i%>">
						<td><%=arrayCommande[i].getDesignation()%></td>
						<td style="width: 150px;" align="right">
							<%
								if (arrayCommande[i].getEtat() == Constant.createdState) {
							%> <input class="form-control form-control-sm"
							value="<%=arrayCommande[i].getQuantite()%>" type="number" min="1"
							name="quantite<%=i%>" placeholder=".form-control-sm"
							aria-label=".form-control-sm example"> <%
 	} else {
 			out.println(arrayCommande[i].getQuantite());
 		}
 %>
						</td>
						<td align="right"><%=Utility.format(arrayCommande[i].getPu()) + " " + arrayCommande[i].getDevise_id()%></td>
						<td align="right"><%=Utility.format(arrayCommande[i].getMontant()) + " " + arrayCommande[i].getDevise_id()%></td>
						<td><%=arrayCommande[i].getEtatlib()%></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>

		</div>

		<div class="row">
			<div class="col-xs-4 col-sm-4">
				<nav>
					<ul class="pagination">
						<%=paginationCommande%>
					</ul>
				</nav>
			</div>
			<%
				if (totalInProcess > 0) {
			%>
			<div class="col-xs-2 col-sm-2">
				<button type="submit" id="modifier" class="btn btn-warning btn-sm">Modifier</button>
			</div>
			<div class="col-xs-2 col-sm-2">
				<button type="submit"
					formaction="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=remove_order"
					class="btn btn-success btn-sm">Annuler</button>
				</a>
			</div>
			<%
				}
			%>
		</div>

	</form>
</div>

<jsp:include page='../incs/footer_common.jsp' />
<script>
	$("#localisation_checkbox").change(
			function() {
				if (this.checked) {
					$('#another_localisation').append(
							'<input type="text" class="form-control" name="another_localisation">');
					$('#lieu_livraison').attr('disabled', 'disabled');
				} else {
					$('#another_localisation input').remove();
					$("#lieu_livraison").removeAttr('disabled');
				}
			});
</script>