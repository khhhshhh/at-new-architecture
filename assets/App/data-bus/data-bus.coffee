define ['durandal/app'], (app)->
	getToolIcons: ->

	getInterestingPoints: ->
		[
			{topic: "西游记", messages:["孙悟空三打白骨精", "红孩儿大闹水帘洞"]},
			{topic: "封神榜", messages:["太乙真人发表严正声明", "钓鱼岛是我们的啊啊啊啊～～"]}
		]

	updateInterestingPoints: ->
		app.trigger('data-bus:interesting-points-update', [
			{topic: "War & Peace", messages:["Fighting in Talvocil", "Yesterday once more"]},
			{topic: "Obvilion", messages:["Odessy Mission Failed", "The world championship"]}
		]);