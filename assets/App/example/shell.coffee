define (require)-> 
    router = require '../durandal/plugins/router'
    app = require '../durandal/app' 

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

    # Auto to run example             
    router.mapAuto()

    router.autoConvertRouteToModuleId = (route, params)->            
        '../widgets/' + route + '/example/main'  

    router: router,
    activate: ()-> 
        router.activate('mask')
