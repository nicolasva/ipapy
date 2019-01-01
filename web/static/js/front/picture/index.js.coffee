jQuery ->
  $(document).ready ->
    regex_location_href = new RegExp("^.{1,}\/retirement_homes\/(.{1,})\/pictures$", "g")
    location_href = window.location.href
    if location_href.scan(regex_location_href).length > 0
      retirement_home_id = location_href.scan(regex_location_href)[0][0]
      $("#pictures_list").sortable({
        items: '.pictures',
        update: ->
          $.ajax({
            url: "/retirement_homes/#{retirement_home_id}/pictures/sorts",
            type: "GET",
            data: $(this).sortable('serialize'),
            failure: ->
              alert("Problem sortable list annoncment")
          })
      })
