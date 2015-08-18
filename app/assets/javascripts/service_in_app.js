
var rowBuilder = function() {
    // Private property that define the default <TR> element text.
    var row = $('<tr>', { class: 'fields' });

    // Public property that describes the "Remove" link.
    var link = $('<a>', {
        href: '#',
        onclick: 'remove_fields(this); return false;',
        title: 'Delete this Pilot.'
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
