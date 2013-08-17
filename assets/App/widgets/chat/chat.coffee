define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class Chat

		constructor: (elem, settings) ->
			that = @
			events.includeIn @
			container = settings.container


		viewAttached: (view)->	
			
	Chat
