var fs = require('fs') 
var	path = require('path') 
var util = require('util')

var red = '\u001b[31m'
var	blue  = '\u001b[34m'
var reset = '\u001b[0m'
var green = '\x1B[32m'
var yellow = '\x1B[33m'

var widget = process.argv[2]

var COMMAND_ERROR = "\nERROR: Please Use :\n\n" +
				  	"\t" + blue + "make widget yourWidgeName\n\n"
				  	 + reset + "to create a widget\n"

var WIDGET_EXISTS_ERROR = red + 'ERROR: Widget ' + widget + ' exists, please pick another name' + reset			  	  
var SAMPLE_NOT_FOUND_ERROR = red + 'ERROR: Widget sample directory not found' + reset

var SAMPLE_DIR = './assets/App/widgets/.widget-boilerplate'

if (widget === '') {
	error(COMMAND_ERROR)
} else {
	if (isSampleExists()) {
		createWidget(widget)
	} else {
		error(SAMPLE_NOT_FOUND_ERROR)
	}
}

function error (msg) {
	console.error(msg)
}

function isSampleExists () {
	return fs.existsSync(SAMPLE_DIR)
}

function createWidget (widget) {
	var targetDir = getWidgetDirFromName(widget) 

	if (fs.existsSync(targetDir)) {
		console.error(WIDGET_EXISTS_ERROR)
		return false
	}

	createWidgeDirectory(widget)
	createWidgetFiles(widget)
	console.log(yellow + '\nGood, every thing is done, enjoy yourself!' + reset)
}

function createWidgeDirectory (widget) {
	var targetDir = getWidgetDirFromName(widget) 
	makeDir(targetDir)
	makeDir(path.join(targetDir, 'example'))
	makeDir(path.join(targetDir, 'test'))
}

function createWidgetFiles (widget) {
	var files = [
		'README.md', 'widget.coffee', 'widget.html', 'widget.less',
		'example/main.coffee', 'example/main.html',
		'test/widget.Spec.coffee'
	]

	files.forEach(function(file, i) {
		tranportFile(widget, file)
	})
}

function tranportFile (widget, file) {
	var originFile = readFileInSample(file)
	var widgetClassName = widget[0].toUpperCase() + widget.slice(1)

	var targetDir = getWidgetDirFromName(widget) 
	var targetFileData = originFile.replace(/widgetName/g, widget).replace(/WidgetName/g, widgetClassName)

	writeFileInWidget(file, targetFileData)
}

function readFileInSample (file) {
	return fs.readFileSync(path.join(SAMPLE_DIR , file), 'utf-8')
}

function writeFileInWidget (file, data) {
	var targetDir = getWidgetDirFromName(widget)
	var file = file.replace('widget', widget)
	var targetFile = path.join(targetDir, file)
	fs.createWriteStream(targetFile).write(data)
	console.log(green + 'Creating ' + targetFile + '...' + reset)
}

function makeDir (dir) {
	fs.mkdirSync(dir)
}

function copy (src, dest) {
	fs.createReadStream(src).pipe(fs.createWriteStream(dest))
}

function getWidgetDirFromName (widget) {
	return './assets/App/widgets/' + widget
}