define ['data-bus/data-bus', 'durandal/app'], (dataBus, app)->
  TITLE_VISITORS = '游客' 
  TITLE_FRIENDS = '好友'

  class People
    constructor: ->
      @description =  ko.observable ''  
      @persons = ko.observableArray [] 
      @description TITLE_VISITORS
      @persons dataBus.getVisitors() 

      app.on('data-bus:friends-updated').then (friends)=>
        @description TITLE_FRIENDS
        @persons friends   

      app.on('data-bus:visitors-updated').then (visitors)=>
        @description TITLE_VISITORS
        @persons visitors

    # activate: ->

    viewAttached: (view)->  
    # you can get the view after it's bound and connected to it's parent dom node if you want