$(window).scroll(function(){
	$('nav').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.navbar-brand').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.nav-link').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.right-div-nav').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.fa-user-circle').toggleClass('scrolled', $(this).scrollTop() > 300)
});