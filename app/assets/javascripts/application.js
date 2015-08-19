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
//= require jquery-ui
//= require jquery.min
//= require turbolinks
//= require bootstrap
//= require bootstrap-sprockets
//= require bootstrap-multiselect

//= require_tree .
  // require foundation $(document).foundation();

$(document).ready(function() {

  // ======= multiselect =======
      $('#rt-multiselect').multiselect({
      //enableClickableOptGroups: true,
      //includeSelectAllOption: true,
      //enableFiltering: true,
      maxHeight: 200
      });

      $('#VM-multiselect').multiselect({
        //enableClickableOptGroups: true,
        includeSelectAllOption: true,
        enableFiltering: true,
        selectedClass: 'multiselect-selected'
      });

      $('#serv-multiselect').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        maxHeight: 200,
        selectedClass: 'multiselect-selected'
      });

    });
