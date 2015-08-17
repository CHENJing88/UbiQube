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
//= require bootstrap
//= require bootstrap-multiselect

//= require_tree .
  // require foundation $(document).foundation();

$(document).ready(function() {
      $('#rt-multiselect').multiselect({
      //enableClickableOptGroups: true,
      //includeSelectAllOption: true,
      //enableFiltering: true,
      maxHeight: 200
      });

      $('#VM-multiselect').multiselect({
      enableClickableOptGroups: true,
      includeSelectAllOption: true,
      enableFiltering: true,
      maxHeight: 200
      onChange: function(element, checked) {
        var brands = $('#VM-multiselect option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
        });

        console.log(selected);
      }

      });

      $('#serv-multiselect').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        maxHeight: 200
      });

      $('#add_vm').click({
        var brands = $('#VM-multiselect option:selected');
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
            //$('#vm-table tr:last').after().html("<%= escape_javascript(render(:partial => 'vms/vm')) %>");
            //('<tr></tr><tr></tr>');
        });
      $("#remCF").on('click',function(){
		       $(this).parent().parent().remove();
	    });
      
      });


    });
