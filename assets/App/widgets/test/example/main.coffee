define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class Example

		constructor: (elem, settings) ->
			that = @
			events.includeIn @
			
		viewAttached: (view)->	
			
	Example
