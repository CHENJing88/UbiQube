
$(function() {
  //====== button =======
      $('#add_vm').click({
        //var brands=$('#VM-multiselect option:selected')
        var selected-vms=$('#VM-multiselect option:selected').map(function(a, item){return item.value;});
        console.log(selected);
        var selected = [];
        $(brands).each(function(index, brand){
            selected.push([$(this).val()]);
            //$('#vm-table tr:last').after().html("<%= escape_javascript(render(:partial => 'vms/vm')) %>");
            //('<tr></tr><tr></tr>');
        });
        onChange: function(element, checked) {
          var brands = $('#VM-multiselect option:selected');
          var selected = [];
          $(brands).each(function(index, brand){
              selected.push([$(this).val()]);
          });

          console.log(selected);
        }

        $("#remCF").on('click',function(){
  		       $(this).parent().parent().remove();
  	    });

      });


  });


function remove_fields(link) {
$(link).previous("input[type=hidden]").value = "1";
$(link).up(".fields").hide();
}

function add_fields(link, association, content) {
var new_id = new Date().getTime();
var regexp = new RegExp("new_" + association, "g")
$(link).up().insert({
before: content.replace(regexp, new_id)
});
}

var rowBuilder = function() {
    // Private property that define the default <TR> element text.
    var row = $('<tr>', { class: 'fields' });

    // Public property that describes the "Remove" link.
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this VM.'
    }).append($('<i>', { class: 'icon-remove' }));

    // A private method for building a <TR> w/the required data.
    var buildRow = function(fields) {
        var newRow = row.clone();

        $(fields).map(function() {
            $(this).removeAttr('class');
            return $('<td/>').append($(this));
        }).appendTo(newRow);

        return newRow;
    }

    // A public method for building a row and attaching it to the end of a <TBODY> element.
    var attachRow = function(tableBody, fields) {
        var row = buildRow(fields);
        $(row).appendTo($(tableBody));
    }

    // Only expose public methods/properties.
    return {
        addRow: attachRow,
        link: link
    }
}();

var addVMFieldsUI = {
    init: function() {
        $('#add_vm').on('click', function() {
            vmFormHandler.appendFields();
            vmFormHandler.hideForm();
        });
    }
};

var vmFormHandler = {
    // Public method for adding a new row to the table.
    appendFields: function() {
        // Get a handle on all the input fields in the form and detach them from the DOM (we will attach them later).
        var inputFields = $(cfg.formId + ' ' + cfg.inputFieldClassSelector);
        inputFields.detach();

        // Build the row and add it to the end of the table.
        rowBuilder.addRow(cfg.getTBodySelector(), inputFields);

        // Add the "Remove" link to the last cell.
        rowBuilder.link.appendTo($('tr:last td:last'));
    },

};

var cfg = {
    formId: '#new-pilot-fields',
    tableId: '#vm-table',
    inputFieldClassSelector: '.field',
    getTBodySelector: function() {
        return this.tableId + ' tbody';
    }
};
