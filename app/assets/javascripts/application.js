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
//= require materialize-colorpicker
//= require turbolinks
//= require_tree .
Chart.defaults.global.legend.display = false;
$( document ).on('turbolinks:load', function() {
  $('#project_color').colorpicker({
    colorSelectors: {
      'red': '#f44336',
      'pink': '#e91e63',
      'purple': '#9c27b0',
      'deep-purple': '#673ab7',
      'indigo': '#3f51b5',
      'blue': '#2196f3',
      'light-blue': '#03a9f4',
      'cyan': '#00bcd4',
      'teal': '#009688',
      'green': '#4caf50',
      'light-green': '#8bc34a',
      'lime': '#cddc39',
      'yellow': '#ffeb3b',
      'amber': '#ffc107',
      'orange': '#ff9800',
      'deep-orange': '#ff5722',
      'brown': '#795548',
      'grey': '#9e9e9e',
      'blue-grey': '#607d8b',
      'black': '#000000',
      'white': '#ffffff'
    },
    format: 'hex',
    template:
      '<div class="colorpicker colorpicker-dropdown">' +
        '<div class="colorpicker-selectors"></div>' +
    '</div>',
  });
  $('.button-collapse').sideNav();
  $('.modal-trigger').leanModal();
  $('select').material_select();
  $('.datepicker').pickadate({});
  $(".js-clickable-row").click(function() {
      window.document.location = $(this).data("href");
  });
});
