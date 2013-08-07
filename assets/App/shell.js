define(['durandal/plugins/router', 'durandal/app'], function (router, app) {

    return {
        router: router,
        activate: function () {
            // router.mapNav('welcome', 'welcome/index');
            // router.mapNav('flickr', 'flickr/index');
            router.mapNav('toolbar', 'toolbar/index');
            router.mapNav('interesting-point', 'interesting-point/index');
            router.mapNav('people', 'people/index');
            router.mapNav('mask', 'mask/index');
            router.mapNav('mask-widgets', 'mask-widgets/index');

            return router.activate('mask');
        }
    };
});