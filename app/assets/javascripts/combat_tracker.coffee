
# addCombatantRow = () ->
#   tbody = $(".combatant-table tbody")
#   tbody.append tmpl("combatant-row-template", {})

#   prevInputNum = tbody.find("tr:nth-last-child(2) input.name").attr('name').match /\d+/

#   new_row = $(".combatant-table tbody tr:last")
#   elements = []
#   elements.push new_row.find("input.name")
#   elements.push new_row.find("input.init")
#   elements.push new_row.find("input.max_hp")
#   elements.push new_row.find("input.hp")
#   elements.push new_row.find("input.ac")
#   elements.push new_row.find("input.dc")

#   for element in elements
#     do ->
#       element.attr("name", element.attr("name").replace(/replace_this/, parseInt( prevInputNum, 10 ) + 1))

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
  # addCombatantRow()

$(document).on "click", "#add-creature", (event) ->
  event.preventDefault()
  addCreature()

$(document).on "turbolinks:load", ->
  $("select").select2({ theme: "bootstrap" })
