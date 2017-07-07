addCreature = () ->
  creature_id = $("select").val()
  creature_qty = $("select.creature_qty").val()
  combat_tracker_id = $("#combat_tracker_id").val()

  $.post '/combat_trackers/' + combat_tracker_id + '/add_combatant',
    creature_id: creature_id
    creature_qty: creature_qty

$(document).on "click", ".edit-combatant-btn", (event) ->
  event.preventDefault()

$(document).on "click", "#add-combatant-row", (event) ->
  event.preventDefault()

$(document).on "click", "#add-creature", (event) ->
  event.preventDefault()
  addCreature()

$(document).on "turbolinks:load", ->
  $("select").select2({ theme: "bootstrap" })
