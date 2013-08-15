define (require)->

	describe 'Testing Toolbar: ', ()->

		toolbar = null
		Toolbar = null

		it 'Get toolbar view model\'s constructor and instantite a view model', ()->

			Toolbar = require '../toolbar.js'
			expect(_.isFunction Toolbar).toBeTruthy()

			toolbar = new Toolbar	
			expect(_.isObject toolbar).toBeTruthy()	

		it 'Actived Icon should be what has been actived, e.g. `Clip`', ()->
			toolbar.active 'Clip'
			expect(toolbar.activeIcon()).toBe('Clip')

		it 'Cannot active icon that was not in toolbar icons list', ()->
			toolbar.active 'Hello'
			expect(toolbar.activeIcon()).toBeUndefined()

		it 'Check notification', ()->		
			notifications = toolbar.notifications()
			notificationsCount = notifications.length
			toolbar.checkNotification(notifications[0])
			expect(toolbar.notifications().length).toBe(2)
