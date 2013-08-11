define (require)->
    events = require 'durandal/events'
    databus = require 'data-bus/data-bus'

    class MaskInterestingPoint

        constructor: () ->
            events.includeIn @
            @interestingPoints = ko.observableArray()
            that = @

            mask = null

            @initMask = (maskVM)->        
                mask = maskVM
                mask.on 'mask:click', that.backToPreviousState

            @initInterestingPoint = (interestingPoint)->    
                interestingPoint.on 'interesting-point:click', (interestingPoint, event)->
                    event.stopPropagation()
                    mask.showClip()
                    mask.setClipStyle interestingPoint.position()

            @backToPreviousState = ()->        
                if mask.isClipShow() then mask.hideClip()
                else mask.hide()

            @showInterestingPoint = (type)->    
                mask.show()

            databus.on 'data-bus:interesting-points-loaded', that.interestingPoints
            databus.getInterestingPoints()

        viewAttached: (view)->    


    MaskInterestingPoint        