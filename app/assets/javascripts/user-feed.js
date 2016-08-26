//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require bootstrap-sprockets
//= material
//= require turbolinks

$(document).on('turbolinks:load', function (){
    $(".button-collapse").sideNav();
    $('.collapsible-accordion').collapsible();
    $('.scrollspy').scrollSpy();
    $(".alert").alert()
    $('.parallax').parallax();
});
