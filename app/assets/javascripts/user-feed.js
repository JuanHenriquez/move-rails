//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require turbolinks

$(document).on('turbolinks:load', () => {
    $(".button-collapse").sideNav();
});
