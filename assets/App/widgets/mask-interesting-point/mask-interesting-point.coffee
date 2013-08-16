define (require)->
    events = require 'durandal/events'
    databus = require 'data-bus/data-bus'

    class MaskInterestingPoint

        constructor: (elem, settings) ->
            events.includeIn @
            that = @
            container = settings.container

            mask = null

            @interestingPoints = ko.observableArray()

            backToPreviousState = ()->
                that.trigger 'mask:is-clip-show', (isClipShow)->
                    if isClipShow then that.trigger 'mask:hide-clip'
                    else 
                        that.trigger 'mask:hide-mask'
                        container.trigger 'mask-interesting-point:mask-hide'

            @on 'interesting-point:click', (ipPosition, ipContent, event)->
                event.stopPropagation()
                that.trigger 'mask:set-clip-style', ipPosition
                that.trigger 'mask:show-clip'

            @on 'mask:click-on-mask', (event)->
                backToPreviousState()

            container.on 'mask-interesting-point:show-mask', ()->    
                that.trigger 'mask:show-mask'

            container.on 'mask-interesting-point:back-previous-state', ()->    
                backToPreviousState()

            databus.on 'data-bus:interesting-points-loaded', that.interestingPoints
            databus.getInterestingPoints()

        viewAttached: (view)->    


    MaskInterestingPoint        