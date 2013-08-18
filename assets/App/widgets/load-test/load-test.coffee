define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'
	count = 0
	timeStamp = +new Date

	class Toolbar

		constructor: (elem, settings) ->
			that = @
			events.includeIn @
			container = settings.container

			@atplusIcon = "@+"
			@notifications = ko.observableArray()
			@activeIcon = ko.observable()
			@position = ko.observable
				left: 100 + Math.random() * 600 + 'px'
				bottom: 100 + Math.random() * 600 + 'px' 

			@toolIcons = [
				'Clip', 
				'Notification', 
				'Public', 
				'Private', 
				'Sale', 
				'Settings' 
			]

			@interestingPointsCount = ko.computed ()->
				@notifications().length
			, @	

			active = (icon)-> 
				if icon is null or icon is that.activeIcon() 
					that.activeIcon null
				else 
					if icon not in that.toolIcons then icon = undefined
					that.activeIcon icon
					container.trigger 'toolbar:icon-active', icon 

			checkNotification = (notification)->
				that.notifications.remove notification
				container.trigger 'toolbar:notification-check', notification 

			@active = active
			@checkNotification = checkNotification

			container.on 'toolbar:active-icon', active
			container.on 'toolbar:check-notification', checkNotification 

			databus.on 'data-bus:all-notifications-loaded', @notifications
			databus.getAllNotifications()

	Toolbar
