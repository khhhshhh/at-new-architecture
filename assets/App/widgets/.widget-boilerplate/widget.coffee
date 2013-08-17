define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class WidgetName

		constructor: (elem, settings) ->
			that = @
			events.includeIn @
			container = settings.container


		viewAttached: (view)->	
			
	WidgetName
