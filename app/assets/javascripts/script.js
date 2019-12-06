$(window).scroll(function(){
	$('nav').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('#navbarColor03').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.hello').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.navbar-brand').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.nav-link').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.fa-user-circle').toggleClass('scrolled', $(this).scrollTop() > 300)
});