define(['durandal/plugins/router', 'durandal/app'], function (router, app) {

    return {
        router: router,
        activate: function () {
            // router.mapNav('welcome', 'welcome/index');
            // router.mapNav('flickr', 'flickr/index');
            router.mapNav('toolbar', 'toolbar/toolbar');
            router.mapNav('interesting-point', 'interesting-point/interesting-point');
            router.mapNav('people', 'people/people');
            router.mapNav('mask', 'mask/mask');
            router.mapNav('mask-widgets', 'mask-widgets/mask-widgets');

            return router.activate('mask');
        }
    };
});