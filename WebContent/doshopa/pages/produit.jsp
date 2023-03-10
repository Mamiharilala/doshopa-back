<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 
<html>
<head>
	<title>Product Detail Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <jsp:include page='../incs/css.jsp' />
	 <jsp:include page='../incs/js.jsp' />
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-md bg-dark navbar-dark">
  <a class="navbar-brand" href="#">Product Detail</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">About</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Product Detail -->
<div class="container mt-5">
	<div class="row">
		<div class="col-md-4">
			<img src="product-image.jpg" class="img-fluid" alt="Product Image">
		</div>
		<div class="col-md-8">
			<h1>Product Title</h1>
			<p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			<hr>
			<h4>Product Description:</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
			<h4>Product Details:</h4>
			<ul>
				<li>Product Code: PRD001</li>
				<li>Price: $19.99</li>
				<li>Size: Medium</li>
				<li>Color: Blue</li>
			</ul>
			<button class="btn btn-primary">Add to Cart</button>
		</div>
	</div>
</div>

</body>
</html>