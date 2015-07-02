// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.min
//= require turbolinks
//= require foundation
//= require_tree .
$(function() {
  $(document).foundation();

  $(document).ready(function(){
    var clickOnPopupLink = function(){
      $('body').on('click', '.static-popup-link', function(){
        $('#show_app_modal').modal('show');
      });
    }

    clickOnPopupLink();

  });

  $('a.reveal-link').trigger('click');
  $('a.close-reveal-modal').trigger('click');

// or directly on the modal
  $('#show_app_modal').foundation('reveal', 'open', {
    //var menuId = $( this ).attr( "href" );
    url: app_path,
    data: {id: '1'}
    success: function(data) {
        alert('modal data loaded');
    },
    error: function() {
        alert('failed loading modal');
    });
  $('#show_app_modal').foundation('reveal', 'close');

  });
