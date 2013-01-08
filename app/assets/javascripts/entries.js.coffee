# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

this.load_entry = (entry_id) ->
  $.ajax '/entries/' + entry_id,
    type: 'GET',
    data: { layout: false },
    success: (data) -> 
      $('#entry-space').html(data)

this.new_entry = (event) ->
  $.ajax '/entries/new',
    type: 'GET',
    data: { layout: false },
    success: (data) -> 
      $('#entry-space').html(data)
  event.preventDefault()

$(document).ready ->
  $("#entry-photos").hover ->
    $("#photo-delete-link").toggle()
      
this.handleLocationButton = (event, button) ->
  locationButton = null

  if button != undefined
    locationButton = button
  else
    locationButton = $("#location-button")

  if locationButton.hasClass("btn-success") == true
    $("#attach_location").val "false"
    $("#latitude").val null
    $("#longitude").val null
    locationButton.removeClass("btn-success")
  else
    get_location()

  event.stopPropagation()

this.get_location = ->
  navigator.geolocation.getCurrentPosition acquired_location, handle_error
acquired_location = (position) ->
  $("#attach_location").val true
  $("#latitude").val position.coords.latitude
  $("#longitude").val position.coords.longitude
  $("#location-button").addClass("btn-success")
handle_error = (err) ->
  $("#attach_location").val false
  $("#location-button").removeClass("btn-success").addClass("btn-info")

this.handle_favorite = (event, entry_id) ->
  event.preventDefault()
  event.stopPropagation()
  $.ajax '/entries/' + entry_id + '/favorite',
    type: 'GET',
    data: { id: $('#entry').attr('entry-id') },
    success: -> 
      success_favorite(entry_id)

success_favorite = (entry_id) ->
  fav_icon = $("#favorite_icon-" + entry_id)
  if fav_icon.hasClass('icon-star-empty')
    fav_icon.removeClass('icon-star-empty').addClass('icon-star')
  else
    fav_icon.removeClass('icon-star').addClass('icon-star-empty')
  

this.load_favorites = ->
  event.preventDefault()
  event.stopPropagation()
  $.ajax '/entries/get_favorites',
    type: 'GET',
    data: { layout: false },
    success: (data) ->
      $('#right-sidebar-title').text("Favorites")
      $('#entry-space').html(data)

this.load_older_entries = (event) ->
  event.preventDefault()
  event.stopPropagation()
  $.ajax '/entries',
    type: 'GET',
    data: { layout: false },
    success: (data) ->
      $('#right-sidebar-title').text("Older Entries")
      $('#entry-space').html(data)

this.delete_entry_photo = (event, entry_id, entry_photo_id) ->
  event.preventDefault()
  event.stopPropagation()
  $.ajax "/entries/" + entry_id + "/delete_photo/" + entry_photo_id,
    type: 'GET',
    success: (data) ->
      $("#entry-photos").remove()

this.delete_entry_from_index = (event, entry_id) ->
  event.preventDefault()
  event.stopPropagation()
  if(confirm("Do you really want to delete this entry?"))
    $.ajax "/entries/" + entry_id,
      type: 'DELETE',
      success: (data) -> 
        entry_div = $("#entry-" + entry_id)
        if(entry_div.length != 0 )
          entry_div.remove()
        else
          window.location = "/"

