define (require)->
	events = require 'durandal/events'

	describe 'Testing widgetName', ()->

		WidgetName = require 'widgets/widgetName/widgetName'

		container = 
			__moduleId__: 'mock'

		events.includeIn container

		widgetName = new WidgetName $('<div>').get(0), 
			container: container
