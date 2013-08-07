define ['data-bus/data-bus', 'durandal/app'], (dataBus, app)->
  class MaskWidgets
    constructor: ->

    viewAttached: (view)->
      $('.btn-change-friends').click (event)->
        event.preventDefault();
        dataBus.updateFriends();
        
      $('.btn-change-visitors').click (event)->
        event.preventDefault();
        dataBus.updateVisitors();
        
      $('.btn-change-interesting-points').click (event)->
        event.preventDefault();
        dataBus.updateInterestingPoints();
        
