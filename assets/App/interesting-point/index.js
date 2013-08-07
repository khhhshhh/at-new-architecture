define(['data-bus/data-bus', 'durandal/app'], function(dataBus, app){
	var that; // use to hold the created instance
	var toolbar = function(){
		that = this;	
		this.description = "兴趣点列表";
		this.interestingPoints = ko.observableArray([]);
		this.activate = function(){
	  	this.interestingPoints(dataBus.getInterestingPoints());
	  }
	};

  toolbar.prototype.activate = function(){
  	that.interestingPoints(dataBus.getInterestingPoints());
  }

  toolbar.prototype.viewAttached = function (view) {
      //you can get the view after it's bound and connected to it's parent dom node if you want
  };

  app.on('data-bus:interesting-points-update').then(function(interestingPoints){
  	that.interestingPoints(interestingPoints);
  });

  return toolbar;

})