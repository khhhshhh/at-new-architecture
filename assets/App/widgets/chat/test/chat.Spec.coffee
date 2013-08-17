define (require)->
	events = require 'durandal/events'

	describe 'Testing chat', ()->

		Chat = require 'widgets/chat/chat'

		container = 
			__moduleId__: 'mock'

		events.includeIn container

		chat = new Chat $('<div>').get(0), 
			container: container
