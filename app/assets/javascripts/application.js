// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize-sprockets
//= require chart
//= require turbolinks
//= require_tree .
Chart.defaults.global.legend.display = false;
$( document ).on('turbolinks:load', function() {
  $('.button-collapse').sideNav();
  $('.modal-trigger').leanModal();
  $('select').material_select();
  $('.datepicker').pickadate({});
  $(".js-clickable-row").click(function() {
      window.document.location = $(this).data("href");
  });
  $( ".js-tracker-day-chart" ).each(function() {
    display_dashboard_chart($(this));
  });
});
