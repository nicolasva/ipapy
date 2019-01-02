jQuery ->
  $(document).ready ->
    if $(".retirement_homes").length > 0
      retirement_lists = $(".retirement_homes").children()
      $.each(retirement_lists, (key, li_retirement_list) ->
        $.each($(li_retirement_list).children(), (key, content) ->
          $.each($(content).children().last().children(), (key, rating_director) ->
            $(rating_director).attr("data-object", ++key)
          )
        )
      )
  $(document).on 'click', '.ui-rating', (e) ->
    director_rating = $(e.target).attr("data-object")
    retirement_home_id = $(e.target).parent().parent().parent().attr("data-object")
    $.ajax({
      url: "/retirement_homes/#{retirement_home_id}/rating_directors",
      type: "GET",
      dataType: "json",
      success: (result) ->
        console.log result
    })
    #$.ajax({
    #  url: "/retirement_homes/#{retirement_home_id}/rating_directors/#{director_rating}"
    #})
