define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class WidgetName

		constructor: (elem, settings) ->
			that = @
			events.includeIn @
			container = settings.container

			# 局部变量初始化


			# view model 静态数据初始化


			# view model 动态数据属性初始化


			# 函数定义


			# 对view暴露方法: @methodName = method


			# 对container暴露事件API: container.on


			# 向外层请求事件处理: container.trigger


			# 处理下一层事件请求: @on


			# 数据交互处理: databus.trigger && databus.on


		viewAttached: (view)->	
			
	WidgetName
