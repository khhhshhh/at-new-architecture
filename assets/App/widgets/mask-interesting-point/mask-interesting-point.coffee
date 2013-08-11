define (require)->
    events = require 'durandal/events'
    databus = require 'data-bus/data-bus'

    class MaskInterestingPoint

        constructor: () ->
            # 1. 为widget添加events，缓存this
            events.includeIn @
            that = @

            # 2. 初始化局部变量
            mask = null

            # 3. 初始化vm静态属性
            # do stuff here

            # 4. 初始化vm动态属性(observable)
            @interestingPoints = ko.observableArray()

            # 5. 初始化依赖widget以及绑定它们之间的事件
            @initMask = (maskVM)->        
                mask = maskVM
                mask.on 'mask:click', that.backToPreviousState

            @initInterestingPoint = (interestingPoint)->    
                interestingPoint.on 'interesting-point:click', (interestingPoint, event)->
                    event.stopPropagation()
                    mask.showClip()
                    mask.setClipStyle interestingPoint.position()

            # 6. 初始化vm方法
            @backToPreviousState = ()->        
                if mask.isClipShow() then mask.hideClip()
                else mask.hide()

            @showInterestingPoint = (type)->    
                mask.show()

            # 7. 从databus中获取数据    
            databus.on 'data-bus:interesting-points-loaded', that.interestingPoints
            databus.getInterestingPoints()

        viewAttached: (view)->    


    MaskInterestingPoint        