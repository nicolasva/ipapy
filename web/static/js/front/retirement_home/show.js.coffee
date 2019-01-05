jQuery ->
  $(document).ready ->
    $.each($(".ui-rating"), (key, rating_director) ->
      $(rating_director).attr("data-object", ++key)
    )
