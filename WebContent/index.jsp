<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	if(session.getAttribute("user") == null){
		response.sendRedirect("auth/login.jsp?next=dashboard");
	}else{
		response.sendRedirect("container.jsp?content=boutique/boutique_dashboard.jsp");
	}
%>
