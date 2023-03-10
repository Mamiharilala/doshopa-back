<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<section>
    <footer class="text-dark text-center text-lg-start">
        <!-- Grid container -->
        <div class="container p-4">
            <!--Grid row-->
            <div class="row">
                <!--Grid column-->
                <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                    <h5 class="text-uppercase"><img alt="" src="${pageContext.request.contextPath}/vendors/images/Doshopa_150x36.png"></h5>
                    <p class="text-dark">
                        Notre objectif est d'aider les boutiques ? se d?velopper et ? vendre plus de produits en ligne. 
Nous facilitons les ventes de mani?re simple et rapide.
                    </p>
                </div>
                <!--Grid column-->
				
                <!--Grid column-->
                <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                    <h5 class="text-uppercase">Liens</h5>

                    <ul class="list-unstyled mb-0">
                        <li>
                            <a href="${pageContext.request.contextPath}/galerie" class="text-dark">Galerie
                                commerciale</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/accueil" class="text-dark">One page</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/inscription" class="text-dark">S'inscrire</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/login" class="text-dark">Se connecter</a>
                        </li>

                    </ul>
                </div>
                <!--Grid column-->
            </div>
            <!--Grid row-->
        </div>
        <!-- Grid container -->

        <!-- Copyright -->
        <div class="text-center p-3">
           
        </div>
        <!-- Copyright -->
    </footer>
</section>
<section class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom text-dark">
    <!-- Left -->
    <div class="me-5 d-none d-lg-block">
        <span> ? 2023 <img alt="" src="${pageContext.request.contextPath}/vendors/images/Doshopa16x16.png"> Doshopa</span>
    </div>
    <!-- Left -->

    <!-- Right -->
    <div>
        <a href="https://www.facebook.com/profile.php?id=100089675814054" class="btn btn btn-floating text-dark" role="button">
            <i class="fab fa-facebook fa-xl"></i>
        </a>
    
        <a class="btn btn btn-floating text-dark"  href="https://www.instagram.com/doshopa/" role="button">
  <i class="fab fa-instagram fa-xl"></i>
</a>
    </div>
    <!-- Right -->
</section>
</body>
 <jsp:include page='../incs/js.jsp' />
 <script>
 /* Set the width of the side navigation to 250px */
 function openNav() {
   document.getElementById("sidemenuId").style.width = "250px";
 }

 /* Set the width of the side navigation to 0 */
 function closeNav() {
   document.getElementById("sidemenuId").style.width = "0";
 } 
 </script>
</html>