// SCROLL NAVBAR SWITCH

$(window).scroll(function(){
	$('nav').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('#navbarColor03').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.hello').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.navbar-brand').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.nav-link').toggleClass('scrolled', $(this).scrollTop() > 300)
	$('.fa-user-circle').toggleClass('scrolled', $(this).scrollTop() > 300)
});

// ANIMATION H1 INDEX

const typedTextSpan = document.querySelector(".typed-text-index");
const cursorSpan = document.getElementById("test");
console.log(cursorSpan);
const textArray = ["musculation", "dance", "yoga", "..."];
const typingDelay = 200;    // vitesse d'écriture
const erasingDelay = 100;   // vitesse de suppression
const newTextDelay = 2000;  // temps avant un nouveau texte
let textArrayIndex = 0;
let charIndex = 0;

function type() {
  // chaque tour de la fonction ajoute une nouvelle lettre du mot
  if (charIndex < textArray[textArrayIndex].length) {
    // on ajoute la classe typing pour que le curseur ne clignotte pas
    if (!cursorSpan.classList.contains("typing")) cursorSpan.classList.add("typing");
    typedTextSpan.textContent += textArray[textArrayIndex].charAt(charIndex);
    charIndex ++;
    setTimeout(type, typingDelay);
  } 
  else {
    cursorSpan.classList.remove("typing");
    setTimeout(erase, newTextDelay);
  }
}

function erase() {
	if (charIndex > 0) {
    if(!cursorSpan.classList.contains("typing")) cursorSpan.classList.add("typing");
    typedTextSpan.textContent = textArray[textArrayIndex].substring(0, charIndex-1);
    charIndex--;
    setTimeout(erase, erasingDelay);
  } 
  else {
    cursorSpan.classList.remove("typing");
    textArrayIndex++;
    if(textArrayIndex>=textArray.length) textArrayIndex=0;
    setTimeout(type, typingDelay + 1100);
  }
}

// une fois le DOM chargé on lance la fonction
document.addEventListener("DOMContentLoaded", function() {
  if(textArray.length) setTimeout(type, newTextDelay + 250);
});


// ANIMATION TEXT INDEX

// const h1 = document.querySelector('#text-index');

// const tl = new TimelineLite({ paused : true, reversed: true });


