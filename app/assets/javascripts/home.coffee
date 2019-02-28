# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('.downloaded-false').click ->
    elem = $(this)
    file = $(this).text()
    Rails.ajax
      type: 'POST'
      url: '/upload/' + file
      data: downloaded: true
      success: ->
        console.log('hey!')
        $(elem).removeClass('downloaded-false').addClass 'downloaded-true'
        return
    true