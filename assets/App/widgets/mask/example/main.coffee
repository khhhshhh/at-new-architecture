define (require)->
    events = require 'durandal/events'
    databus = require 'data-bus/data-bus'

    class Mask

        constructor: () ->
            events.includeIn @
            that = @

            maskInterestingPoint = null

            @initMaskInterestingPoint = (maskInterestingPointVM)->         
                maskInterestingPoint = maskInterestingPointVM

        viewAttached: (view)->    


    Mask        