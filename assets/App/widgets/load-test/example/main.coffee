define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'
	timeStamp = +new Date
	count = 0

	class Example

		constructor: (elem, settings) ->
			that = @
			events.includeIn @

			@widgets = new Array(100)

		viewAttached: (view)->	

			
	Example
