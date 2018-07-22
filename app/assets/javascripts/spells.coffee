# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.spell-tile', (event) ->
  event.preventDefault()
  event.stopPropagation()
  $('#spell-info-modal').modal('show')

$(document).on 'turbolinks:load', ->
  $('#spell-search').focus()

  $('#spell-search').on 'submit', (event) ->
    event.preventDefault()

  $('#spell-search').keyup (_) ->
    query = $.trim($(@).val()).toLowerCase()

    $('div.spell-card').each ->
      spellName = @.id

      if spellName.toLowerCase().indexOf(query) == -1
        $(this).fadeOut()
      else
        $(this).fadeIn()
      return
