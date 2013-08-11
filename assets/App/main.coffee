﻿require.config
    paths: 
        'text': 'durandal/amd/text'

    map: 
        '*': 
            'css': 'durandal/amd/require-css/css'
        
    
define (require) ->
    app = require 'durandal/app'
    widget = require 'durandal/widget'
    viewLocator = require 'durandal/viewLocator'
    system = require 'durandal/system'
    router = require 'durandal/plugins/router'
    
    # //>>excludeStart "build", tru e
    system.debug true
    # //>>excludeEnd "build "

    app.title = '@+'

    # // override widget default location
    widget.convertKindToModuleId =  (kind)->
        return "widgets/" + kind + '/' + kind
    
    widget.convertKindToViewId =  (kind)->
        return "widgets/" + kind + '/' + kind

    widget.convertKindToStyleId =  (kind)->
        return "widgets/" + kind + '/' + kind
    
    
    widget.registerKind 'toolbar'
    widget.registerKind 'interesting-point'
    widget.registerKind 'people'

    app.start().then ()->
        # //Replace 'viewmodels' in the moduleId with 'views' to locate the view.
        # //Look for partial views in a 'views' folder in the root.
        viewLocator.useConvention()

        # //configure routing
        router.useConvention()
        app.adaptToDevice()
        
        # //Show the app by setting the root view model for our application with a transition.
        app.setRoot 'shell'
