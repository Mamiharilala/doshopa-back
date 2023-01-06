<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	if(session.getAttribute("user") == null){
		response.sendRedirect("auth/login.jsp?next=dashboard");
	}else{
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Tableau de bord</title>
</head>
<body>
	Dashboard
</body>
</html>

<% 
	}
%>
