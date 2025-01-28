/**
 * Created by Jeesoo on 2/18/2017.
 */

$(window).load(function() {
    // Animate loader off screen
    $(".se-pre-con").fadeOut("slow");

});

$( document ).ready(function() {
    // Add scrollspy to <body>
    $('body').scrollspy({target: ".navbar", offset: 50});

    $('#camera').fadeIn('slow');

// Add smooth scrolling on all links inside the navbar
    $("#navigation a").on('click', function(event) {

        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {

            // Prevent default anchor click behavior
            event.preventDefault();

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function(){

                // Add hash (#) to URL when done scrolling (default click behavior)
                window.location.hash = hash;
            });

        } // End if

    });

    //project image fade filter effect
    $(".project").hover(function() {
            $(this).find('.projectimage-hover').fadeIn(100);
            $(this).find('.projectimage-hover').find('.projectimage-text').fadeIn(100);
        },
        function() {

            $(this).find('.projectimage-hover').delay(300).fadeOut(300);
            $(this).find('.projectimage-hover').delay(300).find('.projectimage-text').fadeOut(300);
        });

});