define(['durandal/plugins/router', 'durandal/app'], function (router, app) {

    return {
        router: router,
        search: function() {
            //It's really easy to show a message box.
            //You can add custom options too. Also, it returns a promise for the user's response.
            app.showMessage('Search not yet implemented...');
        },
        activate: function () {
            // router.mapNav('welcome');
            // router.mapNav('flickr');
            router.map([
                {url: 'welcome', moduleId: 'welcome', name: '欢迎'},
                {url: 'flickr', moduleId: 'flickr', name: '相册'}
            ]);
            return router.activate('welcome');
        }
    };
});
