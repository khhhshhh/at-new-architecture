define ['data-bus/data-bus', 'durandal/app'], (dataBus, app)->
  class Mask
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
        
    # you can get the view after it's bound and connected to it's parent dom node if you want