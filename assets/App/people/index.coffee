define ['data-bus/data-bus', 'durandal/app'], (dataBus, app)->
  TITLE_VISITORS = '�ο�'
  TITLE_FRIENDS = '����'

  class toolbar
    constructor: ->
      @description =  ko.observable('')
      @persons = ko.observableArray([])

      app.on('data-bus: friends-updated').then (friends)=>
        @description(TITLE_FRIENDS)
        @persons(friends);  

      app.on('data-bus: visitors-updated').then (visitors)=>
        @description(TITLE_VISITORS)
        @persons(visitors);

    activate: ->
      @description(TITLE_VISITORS)
      @persons(dataBus.getVisitors())

    viewAttached: (view)->
    # you can get the view after it's bound and connected to it's parent dom node if you want
