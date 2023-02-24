<script src="${pageContext.request.contextPath}/doshopa/assets/js/jquery-3.3.1.min.js"></script>   
<script src="${pageContext.request.contextPath}/doshopa/assets/js/popper.min.js"></script>   
<script src="${pageContext.request.contextPath}/doshopa/assets/js/bootstrap.min.js"></script>  
<script src="${pageContext.request.contextPath}/doshopa/assets/js/bootstrap.bundle.min.js"></script>  
<script src="${pageContext.request.contextPath}/doshopa/assets/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/doshopa/assets/js/owl.main.js"></script>
<script src="${pageContext.request.contextPath}/doshopa/assets/fontawesome/js/all.min.js"></script>

<script>
		var owl = $('.owl-carousel');
		owl.owlCarousel({
			margin: 10,
			loop: true,
			responsive:{
				0:{
					items: 1
				},
				600:{
					items: 2
				},
				1000:{
					items: 3
				}
			}
		})
		
	
        /*var splide = new Splide('.splide', {
            type: 'loop',
            perPage: 4,
            rewind: true,
            breakpoints: {
                640: {
                    perPage: 2,
                    gap: '.7rem',
                    height: '12rem',
                },
                480: {
                    perPage: 1,
                    gap: '.7rem',
                    height: '12rem',
                },
            },
        });
        splide.mount();*/
    </script>
 