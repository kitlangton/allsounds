# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#add-band-form").click ->
    $("#hidden-band-form").find(".band-form").clone().appendTo("#bands-section").find(".added").typeahead
      hint: true
      highlight: true
      minLength: 2
    ,
      name: "bands"
      displayKey: "value"
      source: window.substringMatcher(window.bands)
