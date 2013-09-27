###
@description 这是一个模块 1. 非常好 2. 非常棒
@widgets hello, shi, toolbar, then, kdlajfal
@note 吃蛮近
###

define (require)->
    events = require 'durandal/events'
    databus = require 'data-bus/data-bus'

    # @make-doc 
    class MaskInterestingPoint
        constructor: (elem, settings) ->
            events.includeIn @
            container = settings.container

            mask = null

            @interestingPoints = ko.observableArray()

            backToPreviousState = ()=>
                @trigger 'mask:is-clip-show', (isClipShow)=>
                    if isClipShow then @trigger 'mask:hide-clip'
                    else 
                        @trigger 'mask:hide-mask'
                        container.trigger 'mask-interesting-point:mask-hide'

            ###    
            @description 好好学习!
            @param {String} time the time you study
            @param {Object} books All the books you have read
            ###
            @on 'interesting-point:click', (ipPosition, ipContent, event)=>
                event.stopPropagation()
                @trigger 'mask:set-clip-style', ipPosition
                @trigger 'mask:show-clip'
                @trigger 'mask:show-clip'
                @trigger 'mask:show-clip'

            @on 'mask:click-on-mask', (event)=>
                backToPreviousState()

            container.on 'mask-interesting-point:show-mask', ()=>    
                @trigger 'mask:show-mask'

            ###    
            @description 让你飞i!~~!
            @param {String} height The height you will fly to.
            @param {Object} Stuff The Stuff you will bring.
            @return {Boolean} After hight way flying, whether you're still alive
            ###
            container.on 'mask-interesting-point:back-previous-state', ()=>    
                backToPreviousState()

            container.on 'xiejunling:sleep', ()->    
                console.log 'SHI'


            databus.on 'data-bus:interesting-points-loaded', @interestingPoints
            databus.getInterestingPoints()

        viewAttached: (view)->    


    MaskInterestingPoint        