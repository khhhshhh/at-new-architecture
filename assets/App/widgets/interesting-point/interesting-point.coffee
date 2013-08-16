define (require)->
	events = require 'durandal/events'
	databus = require 'data-bus/data-bus'

	class InterestingPoint

		constructor: (elem, settings) ->
			events.includeIn @
			that = @ 
			container = settings.container

			interestingPoint = settings.interestingPoint

			@isShow = ko.observable(true) 
			@content = ko.observable(interestingPoint.content)
			@position = ko.observable(interestingPoint.position)

			@click = (ip, event)-> 
				container.trigger 'interesting-point:click', that.position(), that.content(), event

	InterestingPoint
