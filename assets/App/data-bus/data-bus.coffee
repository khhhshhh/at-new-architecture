define ['durandal/app'], (app)->
	getToolIcons: ->

	getInterestingPoints: ->
		[
			{topic: "西游记", messages:["孙悟空三打白骨精", "红孩儿大闹水帘洞"]},
			{topic: "封神榜", messages:["太乙真人发表严正声明", "钓鱼岛是我们的啊啊啊啊～～"]}
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
		app.trigger 'data-bus: interesting-points-updated', [
			{topic: "War & Peace", messages:["Fighting in Talvocil", "Yesterday once more"]},
			{topic: "Obvilion", messages:["Odessy Mission Failed", "The world championship"]}
		]

	updateVisitors: ->
		app.trigger 'data-bus: visitors-updated', [
			{name: "James Bond", motto: "007 a never end legend"},
			{name: "Charle Cooper", motto: "Dude, you have a incoming call"}
		]

	updateFriends: ->
		app.trigger 'data-bus: friends-updated', [
			{name: "马云", motto: "我被@+惊呆了……"},
			{name: "马化腾", motto: "你们看不见我，我确定"}
		]
