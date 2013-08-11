define (require)-> 
	events = require 'durandal/events'
	databus = require 'data-bus/data-bus'

	class Mask

		constructor: () ->
			events.includeIn this
			that = this

			@isShow = ko.observable true
			@isClipShow = ko.observable false
			@clipStyle = ko.observable {}

			@show = ()-> 
				that.isShow true
				that.trigger 'mask:show'
			

			@hide = ()-> 
				that.isShow false
				that.trigger 'mask:hide'
			

			@setClipStyle = (style)-> 
				that.clipStyle style
				that.trigger 'mask:clip-reset'
			

			@showClip = ()-> 
				that.isClipShow true
				that.trigger 'mask:clip-show'
			

			@hideClip = ()-> 
				that.isClipShow false
				that.trigger 'mask:clip-hide'

			@clickOnMask = ()-> 
				that.trigger 'mask:click'
		
	Mask
