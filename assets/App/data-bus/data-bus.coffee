define (require)->
	events = require 'durandal/events'
	databus = {}
	events.includeIn databus

	_.extend databus, 
		getToolIcons: ->

		getInterestingPoints: ->
			@trigger 'data-bus:interesting-points-loaded', [

				{
					position: 
						top: '100px',
						left: '100px'

					content: '逗比'
				},

				{
					position: 
						top: '200px',
						left: '200px'

					content: '人家最讨厌基佬了啦'
				},

				{
					position: 
						top: '400px',
						left: '400px'

					content: '女汉子就是屌'
				},

				{
					position: 
						top: '200px',
						left: '600px'

					content: '进击的巨神兵'
				},

				{
					position: 
						top: '650px',
						left: '450px'

					content: '不然你以为'
				}
			]

		getVisitors: ->
			[
				{name: "邝伟科", motto: "我不是一个人，我是邝伟科"},
				{name: "陈柏信", motto: "我不是二个人，我是陈柏信"}
			]

		getFriends: ->
			[
				{name: "Eric", motto: "Eric is the king of JS"},
				{name: "Dojjo", motto: "Dojjo is the queen of JS"}
			]

		updateInterestingPoints: ->
			@trigger 'data-bus:interesting-points-updated', [
				{topic: "War & Peace", messages:["Fighting in Talvocil", "Yesterday once more"]},
				{topic: "Obvilion", messages:["Odessy Mission Failed", "The world championship"]}
			]

		updateVisitors: ->
			@trigger 'data-bus:visitors-updated', [
				{name: "James Bond", motto: "007 a never end legend"},
				{name: "Charle Cooper", motto: "Dude, you have a incoming call"}
			]

		updateFriends: ->
			@trigger 'data-bus:friends-updated', [
				{name: "马云", motto: "我被@+惊呆了……"},
				{name: "马化腾", motto: "你们看不见我，我确定"}
			]

		getAllNotifications: ->	
			@trigger 'data-bus:all-notifications-loaded', [
				{type: '@', user: '邝伟科', times: 20, _id: 1},
				{type: '评论', user: 'ericwangqing', times: 30, _id: 2}
				{type: '回复', user: '萝卜头', times: 30, _id: 3}
			]
