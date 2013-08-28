define (require)->
	events = require 'durandal/events'

	describe 'Testing Test', ()->

		Test = require 'widgets/test/test'

		container = 
			__moduleId__: 'mock'

		events.includeIn container

		test = new Test $('<div>').get(0), 
			container: container
