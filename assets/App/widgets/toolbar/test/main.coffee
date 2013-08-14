tests = []
for file of window.__karma__.files 
    if /Spec\.js$/.test(file) then tests.push(file)

requirejs.config
    # // Karma serves files from '/base'
    baseUrl: '../../../'

    paths: 
        'text': 'durandal/amd/text'

    map: 
        '*': 
            'css': 'durandal/amd/require-css/css'

    trim:         

    # // ask Require.js to load these files (all our tests)
    deps: tests,

    # // start test run, once Require.js is done
    callback: window.__karma__.start
