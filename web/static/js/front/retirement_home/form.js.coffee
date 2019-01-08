jQuery ->
  $(document).on 'click', '.rating', (e) ->
    array_id = $(e.target).attr("id").split("_")
    array_id_length = array_id.length - 1
    rating = array_id[array_id_length]
    $("#retirement_home_rating_director").attr("value", 6-rating) if $("#retirement_home_rating_director").length > 0
    $("#appreciation_rating_director").attr("value", 6-rating) if $("#appreciation_rating_director").length > 0
