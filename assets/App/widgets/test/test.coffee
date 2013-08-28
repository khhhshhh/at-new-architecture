define (require)->
	databus = require 'data-bus/data-bus'
	events = require 'durandal/events'

	class Test

		constructor: (elem, settings) ->
			# intro
			that = @
			events.includeIn @
			container = settings.container

			# 局部变量初始化


			# VM 静态数据初始化


			# VM 动态数据属性初始化


			# 操作、函数定义


			# 对view暴露方法: @methodName = methodName


			# 对container暴露事件API: container.on


			# 向外层请求事件处理: container.trigger


			# 处理下一层事件请求: @on


			# 数据交互处理: databus.trigger && databus.on


		viewAttached: (view)->	
			
	Test
