require.config({
    paths: {
        'text': 'durandal/amd/text'
    }
});

define(function(require) {
    var app = require('durandal/app'),
        widget = require('durandal/widget')
        viewLocator = require('durandal/viewLocator'),
        system = require('durandal/system'),
        router = require('durandal/plugins/router');
    
    //>>excludeStart("build", true);
    system.debug(true);
    //>>excludeEnd("build");

    app.title = '@+';

    // override widget default location
    widget.convertKindToModuleId = function(kind){
        return "widgets/" + kind + '/viewmodel';
    }
    widget.convertKindToViewId = function(kind){
        return "widgets/" + kind + '/view';
    }
    
    widget.registerKind('toolbar');
    widget.registerKind('interesting-point');
    widget.registerKind('people');

    app.start().then(function () {
        //Replace 'viewmodels' in the moduleId with 'views' to locate the view.
        //Look for partial views in a 'views' folder in the root.
        viewLocator.useConvention();

        //configure routing
        router.useConvention();
        app.adaptToDevice();
        
        //Show the app by setting the root view model for our application with a transition.
        app.setRoot('shell', 'entrance');
    });
});