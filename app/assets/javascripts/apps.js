$('#app_update').bind('toggle', function() {
  $.ajax({
    url: $(this).parents('form')[0].action,
    headers: {
      Accept : "text/javascript; charset=utf-8",
      "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8'
    },
    type: 'PATCH',
    data: {
      'user_id': $(this).siblings('[id*=user_]').val(),
      'authenticity_token': $(this).siblings('#authenticity_token').val()
    }
  });
});
