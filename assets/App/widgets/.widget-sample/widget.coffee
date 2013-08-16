define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class Widget

		constructor: (elem, settings) ->
			that = @
			events.includeIn @
			container = event

			@atplusIcon = "@+"
			@notifications = ko.observableArray()
			@activeIcon = ko.observable()
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

			@checkNotification = (notification)->
				that.notifications.remove notification

			@active = (icon)-> 
				if icon is that.activeIcon() 
					that.activeIcon null
				else 
					if icon not in that.toolIcons then icon = undefined
					that.activeIcon icon
					that.trigger 'toolbar:active', icon

			databus.on 'data-bus:all-notifications-loaded', @notifications
			databus.getAllNotifications()

	Widget
