//= require jquery
//= require jquery_ujs
//= require material
//= require materialize-sprockets
//= require bootstrap-sprockets
//= require turbolinks

$(document).on('turbolinks:load', function (){
    $(".button-collapse").sideNav();
    $('.collapsible-accordion').collapsible();
    $('.scrollspy').scrollSpy();
    $(".alert").alert()
    $('.parallax').parallax();
    $('.modal-trigger').leanModal();
});
