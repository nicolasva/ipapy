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
    container = $(e.target).parent()
    retirement_home_id = $(e.target).parent().attr("data-object")
    csrf_token = $(e.target).parent().attr("data-action")
    $.ajax({
      url: "/retirement_homes/#{retirement_home_id}/rating_directors",
      type: "GET",
      dataType: "json",
      success: (result) ->
        rating_director_BD = result.rating_director
        rating_director_average = (parseFloat(rating_director_BD) + parseFloat(rating_director)) / 2
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
            $(container).children().remove()
            cpt = 1
            if result.rating_director > 0
              #for(i = 0; i < parseInt(result.rating_director); i++) {
              for i in [0...parseInt(result.rating_director)]
                $(container).append("<span class='ui-rating ui-rating_valid' data-object='#{cpt}'></span>")
                ++cpt
              #}
            if result.rating_director < 5
              rating_director = 5 - result.rating_director
              for i in [0...parseInt(rating_director)]
                $(container).append("<span class='ui-rating ui-rating_not_valid' data-object='#{cpt}'></span>")
                ++cpt
        })
    })
    #$.ajax({
    #  url: "/retirement_homes/#{retirement_home_id}/rating_directors/#{director_rating}"
    #})
