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
      enableClickableOptGroups: true,
      includeSelectAllOption: true,
      enableFiltering: true,
      maxHeight: 200
      });

      $('#VM-multiselect').multiselect({
      enableClickableOptGroups: true,
      includeSelectAllOption: true,
      enableFiltering: true,
      maxHeight: 200
      });

      $('#serv-multiselect').multiselect({
        includeSelectAllOption: true,
        enableFiltering: true,
        maxHeight: 200
      });

      $('#add_vm').on('click', function() {

        var selected_vms = [];
        $('#serv-multiselect option:selected').each(function() {
            selected_vms.push($(this).val());
        });

        selected_vms.sort(function(a,b)){
          return a[0]-b[0];
        });

        $.ajax({
          url: '/posts/',
          type: 'POST',
          dataType: 'JSON',
          data:{
                title:$('#title_d').val(),
                body:$('#body_d').val(),
                author:$('#author_d').val()
                }
          success:function(data){
            alert("dfdf");
            $("#vm-table").append('<tr><td>data.title</td>
                                    <td>data.body</td>
                                    <td>data.author</td></tr>');
          }
        });

    });
