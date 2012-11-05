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

this.get_location = ->
  navigator.geolocation.getCurrentPosition acquired_location, handle_error
acquired_location = (position) ->
  $("#latitude").val position.coords.latitude
  $("#longitude").val position.coords.longitude
handle_error = (err) ->
  $("#location_checkbox").val "0"
  $("#attach_location").hide()

this.handle_favorite = ->
  $.ajax '/entries/' + $('#entry').attr('entry-id') + '/favorite',
    type: 'GET',
    data: { id: $('#entry').attr('entry-id') },
    success: success_favorite
success_favorite = ->
  fav_icon = $("#favorite_icon")
  if fav_icon.hasClass('icon-star-empty')
    fav_icon.removeClass('icon-star-empty').addClass('icon-star')
  else
    fav_icon.removeClass('icon-star').addClass('icon-star-empty')
  return false

this.load_favorites = ->
  $.ajax '/entries/get_favorites',
    type: 'GET',
    data: { layout: false },
    success: (data) ->
      $('#right-sidebar-title').text("Favorites")
      $('#entry-space').html(data)
  event.preventDefault()

this.load_older_entries = (event) ->
  $.ajax '/entries',
    type: 'GET',
    data: { layout: false },
    success: (data) ->
      $('#right-sidebar-title').text("Older Entries")
      $('#entry-space').html(data)
  event.preventDefault()

