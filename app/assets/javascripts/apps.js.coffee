# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $("#show_app").on("ajax:success", (e, data, status, xhr) ->
    $("#show_app").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#show_app").append "<p>ERROR</p>"
