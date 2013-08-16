define (require)-> 
	events = require 'durandal/events'
	databus = require 'data-bus/data-bus'

	class Mask

		constructor: (elem, settings) ->
			events.includeIn this
			that = this
			container = settings.container

			@isShow = ko.observable true
			@isClipShow = ko.observable false
			@clipStyle = ko.observable {}

			container.on 'mask:show-mask', ()-> 
				that.isShow true

			container.on 'mask:hide-mask', ()-> 
				that.isShow false

			container.on 'mask:set-clip-style', (style)->
				that.clipStyle style
			
			container.on 'mask:show-clip', ()->
				that.isClipShow true

			container.on 'mask:hide-clip', ()->
				that.isClipShow false

			container.on 'mask:is-show', ()->	
				that.isShow()

			container.on 'mask:is-clip-show', (callback)->	
				callback that.isClipShow()

			container.on 'mask:get-clip-style', (callback)->	
				callback that.clipStyle()

			@clickOnMask = (mask, event)-> 
				container.trigger 'mask:click-on-mask', event

	Mask
