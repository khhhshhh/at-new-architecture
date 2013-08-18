define (require)->
	events = require 'durandal/events'

	describe 'Testing LoadTest', ()->

		LoadTest = require 'widgets/load-test/load-test'

		container = 
			__moduleId__: 'mock'

		events.includeIn container

		loadTest = new LoadTest $('<div>').get(0), 
			container: container
