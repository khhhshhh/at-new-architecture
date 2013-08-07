define(['data-bus/data-bus', 'durandal/app'], function(dataBus, app){
	var that; // use to hold the created instance
	var InterestingPointList = function(){
		that = this;	
		this.description = "兴趣点列表";
		this.interestingPoints = ko.observableArray([]);
	  this.interestingPoints(dataBus.getInterestingPoints());
		// this.activate = function(){
	 //  }
	};

  InterestingPointList.prototype.viewAttached = function (view) {
      //you can get the view after it's bound and connected to it's parent dom node if you want
  };

  app.on('data-bus:interesting-points-updated').then(function(interestingPoints){
  	that.interestingPoints(interestingPoints);
  });

  return InterestingPointList;

})