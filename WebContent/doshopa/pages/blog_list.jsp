<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="system.*"%>
<%@ page import="doshopa.*"%>
<%@ page import="util.*"%>
<% 
String paginationBlog = (String)request.getAttribute("paginationBlog");
Blog[]arrayBlog = (Blog[])request.getAttribute("arrayBlog");
String image="";
%>
<jsp:include page='../incs/header_common.jsp' /><br>
<form action="${pageContext.request.contextPath}/galerie"
	method="post">
	<div class="container container-fluid mt-5 mb-3">
		<div class="row">
			<%for (int i = 0; i < arrayBlog.length; i++) { image = request.getContextPath()+""+arrayBlog[i].getImage();%>
			<div class="col-xs-6 col-sm-4">
				<div class="card p-3 mb-2 shadow">
					<!-- Card image -->
                            <div class="view overlay">
                                <img class="card-img-top"
                                    src="<%=image %>"
                                    alt="Card image cap">
                                <a href="#!">
                                    <div class="mask rgba-white-slight"></div>
                                </a>
                            </div>

                            <!-- Card content -->
                            <div class="card-body">

                                <!-- Title -->
                                <h4 class="card-title"><%=arrayBlog[i].getTitre()%></h4>
                                <!-- Text -->
                                <p class="card-text text-dark text-truncate" style="height: 96px;">
                                    <%= arrayBlog[i].getBody() %></p>
                                <!-- Button -->
                                <a href="${pageContext.request.contextPath}/blog?ref=<%=arrayBlog[i].getId() %>"
                                    class="btn btn-dark shadow-lg">Lire la suite</a>

                            </div>
				</div>
			</div>
			<% } %>
		</div>
	</div>
	<div class="container">
		<nav>
			<ul class="pagination">
				<%=paginationBlog %>
			</ul>
		</nav>
	</div>
</form>
<jsp:include page='../incs/footer_common.jsp' />