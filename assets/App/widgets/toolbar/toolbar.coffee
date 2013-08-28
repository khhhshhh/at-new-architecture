define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class Toolbar

		constructor: (elem, settings) ->
			# 变量声明
			that = @
			events.includeIn @
			container = settings.container

			# 静态属性
			@atplusIcon = "@+"
			@notifications = ko.observableArray()
			@activeIcon = ko.observable()
			@toolIcons = [
				'Clip', 'Notification',
				'Public', 'Private',
				'Sale', 'Settings'
			]

			# 监控属性
			@interestingPointsCount = ko.computed ()->
				@notifications().length
			, @	

			# 私有方法
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

			# 暴露事件
			@active = active
			@checkNotification = checkNotification

			# 暴露事件API
			container.on 'toolbar:active-icon', active
			container.on 'toolbar:check-notification', checkNotification 

			# 数据交换
			databus.on 'data-bus:all-notifications-loaded', @notifications
			databus.getAllNotifications()

	Toolbar
