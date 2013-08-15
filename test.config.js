var file, tests;
var NEED_FILES_RE = /(Scripts\/.*\.js)|(test-main)|(Spec\.js$)/

tests = [];

for (file in window.__karma__.files) {
	if (NEED_FILES_RE.test(file)) {
		tests.push(file);
	}
}

requirejs.config({

	baseUrl: 'base/',

	deps: tests,

	callback: window.__karma__.start
	
});
