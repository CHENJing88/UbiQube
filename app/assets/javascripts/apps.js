function triggettechmultiselect(){
    $('#uar_fonc_multi').multiselect({
      //enableClickableOptGroups: true,
      //includeSelectAllOption: true,
      enableFiltering: true,
      selectedClass: 'multiselect-selected'
    });

    $('#uar_tech_multi').multiselect({
      enableFiltering: true,
      selectedClass: 'multiselect-selected'
    });
  }
  $(function() {
  $('#edit_app_modal').on('show', function(){
          triggettechmultiselect();
      });
  });
