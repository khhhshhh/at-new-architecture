// Karma configuration
// Generated on Thu Aug 15 2013 10:14:20 GMT+0800 (中国标准时间)


// base path, that will be used to resolve files and exclude


// list of files / patterns to load in the browser
files = [
  JASMINE,
  JASMINE_ADAPTER,
  'Scripts/vendor.js',
  REQUIRE,
  REQUIRE_ADAPTER,
  // {pattern: 'Scripts/vendor.js', included: false},
  {pattern: 'App/**/*.js', included: false},
  {pattern: 'App/**/*.html', included: false},
  {pattern: 'App/**/*.css', included: false},
  // {pattern: 'App/test-main.js', included: false},
  '../test.config.js'
];


// list of files to exclude
exclude = [
	// 'Scripts/vendor.js'
];


// test results reporter to use
// possible values: 'dots', 'progress', 'junit'
reporters = ['progress'];


// web server port
port = 9876;


// cli runner port
runnerPort = 9100;


// enable / disable colors in the output (reporters and logs)
colors = true;


// level of logging
// possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
logLevel = LOG_INFO;


// enable / disable watching file and executing tests whenever any file changes
autoWatch = true;


// Start these browsers, currently available:
// - Chrome
// - ChromeCanary
// - Firefox
// - Opera
// - Safari (only Mac)
// - PhantomJS
// - IE (only Windows)
browsers = ['PhantomJS'];


// If browser does not capture in given timeout [ms], kill it
captureTimeout = 60000;


// Continuous Integration mode
// if true, it capture browsers, run tests and exit
singleRun = false;
