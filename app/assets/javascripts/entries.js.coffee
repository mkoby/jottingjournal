# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

this.get_location = ->
  navigator.geolocation.getCurrentPosition acquired_location, handle_error
acquired_location = (position) ->
  $("#latitude").val position.coords.latitude
  $("#longitude").val position.coords.longitude
handle_error = (err) ->
  $("#location_checkbox").val "0"
  $("#attach_location").hide()

this.handle_favorite = ->
  console.log "Clicked fav"
  fav_icon = $("#favorite_icon")
  if fav_icon.hasClass('icon-star-empty')
    console.log "remove empty, replace with full"
    fav_icon.removeClass('icon-star-empty').addClass('icon-star')
  else
    console.log "remove full, replace with empty"
    fav_icon.removeClass('icon-star').addClass('icon-star-empty')
  return false;
