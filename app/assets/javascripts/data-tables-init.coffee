$(document).on "turbolinks:load", ->
  $(".data-table").each ->
    table = $(@)

    return if $.fn.dataTable.isDataTable(table)

    options =
      responsive: true

    unless table.hasClass("sort-asc")
      options["order"] = [[ 0, "desc" ]]

    if table.hasClass("sort-1-desc")
      options["order"] = [[ 1, "desc" ]]

    if table.hasClass("sort-2-desc")
      options["order"] = [[ 2, "desc" ]]

    if table.hasClass("no-paging")
      options["paging"] = false

    options["pagingType"] = "numbers"

    table.DataTable(options)
