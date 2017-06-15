
addCombatantRow = (combatantDetails) ->
  $(".combatant-table tbody").append tmpl("combatant-row-template", {})
  return unless combatantDetails

  row = $(".combatant-table tbody tr:last")
  name = row.find(".name")
  init = row.find(".init")
  max_hp = row.find(".max_hp")
  hp = row.find(".hp")
  ac = row.find(".ac")
  dc = row.find(".dc")

  name.val combatantDetails.name
  init.val combatantDetails.init
  max_hp.val combatantDetails.max_hp
  hp.val combatantDetails.hp
  ac.val combatantDetails.ac
  dc.val combatantDetails.dc

expose "addCombatantRows", ->
  $ ->
    added = false
    for combatant in data.combat_tracker.combatants
      added = true
      addCombatantRow(combatant)

    addCombatantRow() unless added


$(document).on "click", "#add-combatant-row", (event) ->
  event.preventDefault()
  addCombatantRow()

