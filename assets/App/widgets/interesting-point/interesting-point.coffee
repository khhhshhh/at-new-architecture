define (require)->
	events = require 'durandal/events'
	databus = require 'data-bus/data-bus'

	class InterestingPoint

		constructor: (elem, settings) ->
			events.includeIn @

			that = @ 
			interestingPoint = @interestingPoint = settings.interestingPoint

			@isShow = ko.observable(true) 
			@content = ko.observable(interestingPoint.content)
			@position = ko.observable(interestingPoint.position)

			@click = (ip, event)-> 
			that.trigger('interesting-point:click', that, event)
			
	InterestingPoint
