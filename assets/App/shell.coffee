define (require)-> 
    router = require 'durandal/plugins/router'
    app = require 'durandal/app' 

    ko.bindingHandlers.fade = 

        init: (elem, valueAccessor)-> 
            isShow = valueAccessor()
            if isShow 
                $(elem).fadeIn 500
             else 
                $(elem).fadeOut 500

        update: (elem, valueAccessor)-> 
            isShow = valueAccessor()
            if isShow 
                $(elem).fadeIn 500
             else 
                $(elem).fadeOut 500

    router: router,
    activate: ()-> 
        router.mapNav('mask', 'routes/mask/mask')
        router.activate('mask')
