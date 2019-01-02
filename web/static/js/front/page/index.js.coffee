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
    alert($(e.target).attr("data-object"))
