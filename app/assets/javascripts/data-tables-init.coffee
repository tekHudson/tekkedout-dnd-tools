$(document).on "turbolinks:load", ->
  $(".data-table").each ->
    table = $(@)

    return if $.fn.dataTable.isDataTable(table)

    options =
      responsive: true

    unless table.hasClass("sort-asc")
      options["order"] = [[ 0, "desc" ]]

    if table.hasClass("no-paging")
      options["paging"] = false

    table.DataTable(options)
