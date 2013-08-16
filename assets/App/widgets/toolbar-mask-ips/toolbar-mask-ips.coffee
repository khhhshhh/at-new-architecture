define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class ToolbarMaskIps

		constructor: (elem, setttings) ->
			that = @
			events.includeIn @
			container = setttings.container

			@on 'toolbar:icon-active', (icon)->
				that.trigger 'mask-interesting-point:show-mask'

			@on	'mask-interesting-point:mask-hide', ()->
				that.trigger 'toolbar:active-icon', null

	ToolbarMaskIps
