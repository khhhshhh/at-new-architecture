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
        # // router.mapNav('welcome', 'welcome/index')
        # // router.mapNav('flickr', 'flickr/index')
        # // router.mapNav('toolbar', 'toolbar/toolbar')
        # // router.mapNav('interesting-point', 'interesting-point/interesting-point')
        # // router.mapNav('people', 'people/people')
        # // router.mapNav('mask-widgets', 'mask-widgets/mask-widgets')
        router.mapNav('mask', 'mask/mask')
        router.activate('mask')
