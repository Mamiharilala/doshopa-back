<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page='../incs/header_common.jsp' />
<br><br>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<%
	String str = "";
	String numeroCommande = (String)request.getAttribute("idCommande");
	String paginationCommande = (String)request.getAttribute("paginationCommande");
	BoutiqueCommande[]arrayCommande = (BoutiqueCommande[])request.getAttribute("arrayCommande");
%>
<div class="container">
    <form action="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=update_order" method="POST">
        <div class="col-xs-2 col-sm-2">
            <input type="hidden" name="ref" value="<%=numeroCommande %>">
            <input type="hidden" name="after" value="${pageContext.request.contextPath}/panier">
        </div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">N° commande</th>
                        <th scope="col">Designation</th>
                        <th scope="col">Quantité</th>
                        <th scope="col">PU</th>
                        <th scope="col">Montant</th>
                        <th scope="col">Status</th>
                    </tr>
                </thead>
                <tbody>
                    <% int totalInProcess =0; for(int i=0;i<arrayCommande.length;i++){  %>
                    <tr>
                        <th scope="row">
                            <% if(arrayCommande[i].getEtat()==Constant.createdState){%>
                            <input class="form-check-input" type="checkbox" name="commande_checkbox<%=i%>"
                                value="<%=i %>">
                            <% totalInProcess++; } %>   
                                  
                        </th>
                        <td>
                        	 <% if(arrayCommande[i].getEtat()>Constant.createdState){%>
                        	 	<b><%=arrayCommande[i].getIdmere() %></b>
                        	 <% } %>   
                        </td>
                        <input type="hidden" name="idpanier<%=i%>" value="<%= arrayCommande[i].getId()%>">
                        <input type="hidden" name="numero" value="<%=i%>">      
                        <td><%= arrayCommande[i].getDesignation() %></td>
                        <td style="width: 150px;" align="right">
                            <% if(arrayCommande[i].getEtat()==Constant.createdState){%>
                            <input class="form-control form-control-sm" value="<%=arrayCommande[i].getQuantite()%>"
                                type="number" min="1" name="quantite<%=i %>" placeholder=".form-control-sm"
                                aria-label=".form-control-sm example">
                            <% }else{ 
                                 out.println(arrayCommande[i].getQuantite());
                            }%>                
                        </td>
                        <td align="right"><%=Utility.format(arrayCommande[i].getPu())+" "+arrayCommande[i].getDevise_id()%></td>
                        <td align="right"><%=Utility.format(arrayCommande[i].getMontant())+" "+arrayCommande[i].getDevise_id()%></td>
                        <td><%=arrayCommande[i].getEtatlib()%></td>
                    </tr>
                    <% }%>
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
            <%if(totalInProcess>0){%>
            <div class="col-xs-2 col-sm-2">
                <button type="submit" id="modifier" class="btn btn-warning btn-sm">Modifier</button>
            </div>
            <div class="col-xs-2 col-sm-2">
                <button type="submit" formaction="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=validate_order"
                    class="btn btn-success btn-sm">Valider</button></a>
            </div>
            <div class="col-xs-2 col-sm-2">
                <button type="submit" formaction="${pageContext.request.contextPath}/doshopa/pages/treat.jsp?mode=validate_all_order"
                    class="btn btn-success btn-sm">Valider tous</button></a>
            </div>
             <%}%> 
        </div>
       
    </form>
</div>
<jsp:include page='../incs/footer_common.jsp' />