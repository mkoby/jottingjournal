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
  $("#location_checkbox").change ->
    if this.checked == false
      $("#location_checkbox").val "0"
      $("#latitude").val null
      $("#longitude").val null
    else
      $("#location_checkbox").val "1"
      get_location()

$(document).ready ->
  $("#entry-photos").hover ->
    $("#photo-delete-link").toggle()
      
this.get_location = ->
  navigator.geolocation.getCurrentPosition acquired_location, handle_error
acquired_location = (position) ->
  $("#latitude").val position.coords.latitude
  $("#longitude").val position.coords.longitude
handle_error = (err) ->
  $("#location_checkbox").val "0"
  $("#location_checkbox").prop('checked', false)

this.handle_favorite = (event, entry_id) ->
  $.ajax '/entries/' + entry_id + '/favorite',
    type: 'GET',
    data: { id: $('#entry').attr('entry-id') },
    success: success_favorite(entry_id)
  event.preventDefault()

success_favorite = (entry_id) ->
  fav_icon = $("#favorite_icon-" + entry_id)
  if fav_icon.hasClass('icon-star-empty')
    fav_icon.removeClass('icon-star-empty').addClass('icon-star')
  else
    fav_icon.removeClass('icon-star').addClass('icon-star-empty')
  

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
