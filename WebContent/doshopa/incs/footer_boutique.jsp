<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<footer class="blog-footer">
  <p>Boutique sur <a href="www.doshopa.com" class="text-decoration-none text-dark"><img alt="" src="${pageContext.request.contextPath}/vendors/images/Doshopa16x16.png">Doshopa</a></p>
  <p>
    <a href="#" class="text-decoration-none text-dark">Aller en haut</a>
  </p>
</footer>
</body>
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
<jsp:include page='../incs/js.jsp' />
<style>
.blog-footer {
  padding: 2.5rem 0;
  color: #727272;
  text-align: center;
  background-color: #f9f9f9;
  border-top: .05rem solid #e5e5e5;
}
.blog-footer p:last-child {
  margin-bottom: 0;
}
</style>