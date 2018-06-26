# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.spell-tile', (event) ->
  event.preventDefault()
  event.stopPropagation()
  $('#spell-info-modal').modal('show')

$(document).on 'turbolinks:load', ->
  $('#search').focus()
