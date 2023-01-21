<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="front.*"%>
<%
	try {
		Utilisateur u = new Utilisateur();
		boolean val = u.treatLogin(request.getParameter("login"), request.getParameter("pwd"));
		String nextTarget = request.getParameter("nextTarget");
		if (val) {
			session.setAttribute("user", u);
			if (u != null && u.getRole_id().trim().compareTo("admin") == 0) {
				response.sendRedirect("../container.jsp?content=boutique/dashboard_global_read.jsp");
			} else if (u != null && u.getRole_id().trim().compareTo("boutique") == 0) {
				response.sendRedirect("../container.jsp?content=boutique/boutique_dashboard.jsp");
			}
		}
		throw new Exception("Echec d\'authentification");
	} catch (Exception e) {
		//e.printStackTrace();
%>
<script language="JavaScript"> 
	alert("<%=e.getMessage()%>");
    history.back();
</script>
<%
	}
%>