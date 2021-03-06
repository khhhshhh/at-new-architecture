define (require)->
	events = require 'durandal/events'

	describe 'Testing WidgetName', ()->

		WidgetName = require 'widgets/widgetName/widgetName'

		container = 
			__moduleId__: 'mock'

		events.includeIn container

		widgetCamelName = new WidgetName $('<div>').get(0), 
			container: container
