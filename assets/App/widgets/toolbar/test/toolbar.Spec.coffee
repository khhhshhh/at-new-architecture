define (require)->
	events = require 'durandal/events'

	describe 'User interacting with the toolbar', ()->

		Toolbar = require '../toolbar.js'

		container = 
			__moduleId__: 'mock'

		events.includeIn container

		toolbar = new Toolbar $('<div>').get(0), 
			container: container

		describe 'User click on toolbar\'s icons', ()->	

			it 'Active the icon `Clip`', ()->
				container.trigger 'toolbar:active-icon', 'Clip'
				expect(toolbar.activeIcon()).toBe('Clip')

			it 'Cannot active icon that was not in toolbar icons list', ()->
				container.trigger 'toolbar:active-icon', 'Hello'
				expect(toolbar.activeIcon()).toBeUndefined()

		describe 'User check the notification', ()->		

			it 'Check one of the notifications, notification remove from list', ()->		
				notifications = toolbar.notifications()
				notificationsCount = notifications.length
				container.trigger 'toolbar:check-notification', notifications[0]
				expect(toolbar.notifications().length).toBe(2)
