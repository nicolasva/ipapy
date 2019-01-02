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
    rating_director = $(e.target).attr("data-object")
    retirement_home_id = $(e.target).parent().parent().parent().attr("data-object")
    csrf_token = $(e.target).parent().parent().parent().attr("data-action")
    $.ajax({
      url: "/retirement_homes/#{retirement_home_id}/rating_directors",
      type: "GET",
      dataType: "json",
      success: (result) ->
        rating_director_BD = result.rating_director
        rating_director_average = (parseInt(rating_director_BD) + parseInt(rating_director)) / 2
        hash_rating_director =
          _csrf_token: csrf_token
          retirement_home:
            rating_director: rating_director_average
        $.ajax({
          url: "/retirement_homes/#{retirement_home_id}/rating_directors/#{rating_director_average}",
          type: "PUT",
          dataType: 'json',
          data: hash_rating_director,
          success: (result) ->
            console.log result
        })
    })
    #$.ajax({
    #  url: "/retirement_homes/#{retirement_home_id}/rating_directors/#{director_rating}"
    #})
