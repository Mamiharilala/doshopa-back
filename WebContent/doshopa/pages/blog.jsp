<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:include page='../incs/header_common.jsp' />
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<%@ page import="system.*"%>
<% 
	Blog blog= (Blog)request.getAttribute("blog");
	Utilisateur u = (Utilisateur) request.getSession().getAttribute("user");
%>
<main class="container">
    <article class="blog-post">
        <h2 class="blog-post-title"><%=blog.getTitre()%></h2>
        <p class="blog-post-meta"><%=blog.getDate_insert()%>  écrit par <a href="${pageContext.request.contextPath}/boutiques?ref=<%=blog.getBoutique_id()%>"><%=blog.getBoutiquelib()%></a></p>

        <%=blog.getBody()%>
        
    </article><br>
    <hr>
</main>
 <jsp:include page='../incs/footer_common.jsp' />
 
</html>