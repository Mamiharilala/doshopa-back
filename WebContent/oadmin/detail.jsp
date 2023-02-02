<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="doshopa.Promotion"%>
<%@ page import="front.*"%>
<%@ page import="java.sql.Date"%>
<%
	Promotion p = new Promotion();
	p.setId("BTKPM925022");
	p.setSequenceName("seq_boutique_promotion");
	p.setSchema("public");
	p.setTableName("article_promotion");
	p.setCompleteTableName("article_promotion");
	p.setPrix_actuel(30000.0);
	p.setDate_debut(new Date(System.currentTimeMillis()));
	p.setDate_fin(new Date(System.currentTimeMillis()));
	p.setArticle_id("ART00003");
	p.setQuantite(3);
 
%>
<div class="pd-20 card-box mb-30">
	<div class="clearfix">
		<div class="pull-left">
			<h4 class="text-blue h4">Default Basic Forms</h4>
			<p class="mb-30">All bootstrap element classies</p>
		</div>
	</div>
	<form>
		<%
			PageDetail pv = new PageDetail(p);
			pv.setVisibleEntry("id", false);
			pv.setNameDisplay("article_id", "Article");
			pv.setNameDisplay("quantite", "Quantit&eacute;");
			pv.chargeForm();
			out.println(pv.getLineForm());
		%>
	</form>
</div>