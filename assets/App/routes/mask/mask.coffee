define (require)->
    events = require 'durandal/events'
    databus = require 'data-bus/data-bus'

    class Mask

        constructor: () ->
            events.includeIn @
            that = @

            toolbar = null 
            maskInterestingPoint = null

            @initToolbar = (toolbarVM)->
                toolbar = toolbarVM

            @initMaskInterestingPoint = (maskInterestingPointVM)->         
                maskInterestingPoint = maskInterestingPointVM
                toolbar.on 'toolbar:active', maskInterestingPoint.showInterestingPoint

        viewAttached: (view)->    


    Mask        