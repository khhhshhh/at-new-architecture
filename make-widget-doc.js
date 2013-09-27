var fs = require('fs')
var path = require('path')
var _ = require('underscore')
var ejs = require('ejs')

var RED_COL = '\u001b[31m'
var BLUE_COL  = '\u001b[34m'
var RESET_COL = '\u001b[0m'
var GREEN_COL = '\x1B[32m'
var YELLOW_COL = '\x1B[33m'

var widgetDir = 'assets/App/widgets'
var widgetName = process.argv[2]

var defaultDocJSON = {
    widgetName: widgetName
}

function makeWidgetDoc(widgetName) {
    var file = readWidgetFile(widgetName)
    var parsedDoc = parseDoc(file)
    var isOk = createReadMeDoc(parsedDoc) 
    if (isOk) {
        log('success', '---> ' + widgetName + '\'s doc has been successfully created!!' )
    }
}

function readWidgetFile(widgetName) {
    var filePath = getWidgetFilePath(widgetName)
    if (isWidgetExists(widgetName)) {
        return fs.readFileSync(filePath, 'utf-8')
    } else {
        log('error', 'widget ' + widgetName + ' doesn\'t exist.')
        process.exit()
    }
}

function parseDoc(file) {
    var docTemplate = fs.readFileSync(path.join(widgetDir, '.widget-boilerplate', 'README.md'), 'utf-8')
    var profile = parseProfile(file)

    var containerRequestEvents = parseEvent('container\.trigger', file, 'containerRequestEvents')
    var containerResponseEvents = parseEvent('container\.on', file, 'containerResponseEvents')
    var currentRequestEvents = parseEvent('@trigger', file, 'currentRequestEvents')
    var currentResponseEvents = parseEvent('@on', file, 'currentResponseEvents')

    var eventBusEvent = parseEventBusEvent(file)
    var renderData = _.extend(
        {}, profile,
        currentResponseEvents, 
        currentRequestEvents, 
        containerResponseEvents, 
        containerRequestEvents, eventBusEvent
    )
    return render(docTemplate, renderData)
}

function parseProfile(file) {
    var PROFILE_RE = /###[\s\S]*?###/
    var defaultProfile = {
        description: '',
        widgets: [],
        note: ''
    }

    result = file.match(PROFILE_RE)[0]
    if (!result) {
        return defaultProfile
    }

    var description = parseTagBlock('description', result)
    var widgets = parseTagBlock('widgets', result).replace(/\s|\n|\r/g, '').split(',')
    widgets = widgets[0] === '' ? [] : widgets
    var note = parseTagBlock('note', result)

    return {
        description: description,
        composeWidgets: widgets,
        note: note
    }
}

function parseTagBlock(tag, str) {
    var MATCH_RE = new RegExp('@' + tag + '[\\s\\S]*?(@|$)')
    var REMOVE_RE = new RegExp('@' + tag + '|@\\s*?|###$', 'g')
    var LINKE_BREAK_RE = /\r\n/g
    var result = str.match(MATCH_RE)

    if (result) {
        return result[0].replace(REMOVE_RE, '').replace(LINKE_BREAK_RE, '<br/>')
    } else {
        return ''
    }
}

function parseEvent(prefix, str, propName) {
    var EVENT_RE = new RegExp(prefix + '\\s[\'\"].*?[\'\"]', 'g')
    var REMOVE_RE = new RegExp(prefix + '|[\'\"]|\\s', 'g')

    var defaultEvent = {
        widgetName: 'no widget',
        eventName: 'no event name',
        description: 'no description',
        params: []
    }

    var existedEvent = {}
    var result = str.match(EVENT_RE)
    var events = []

    if (result) {

        result.forEach(function(name) {
            if (existedEvent[name]) {
                return 
            } else {
                existedEvent[name] = true
            }       

            var eventStr = name.replace(REMOVE_RE, '').split(':')
            var event = {
                'widgetName': eventStr[0],
                'eventName': eventStr[1]
            }
            var eventProfile = parseEventProfile(name, str)

            event = _.extend({}, defaultEvent, event)
            events.push(event)
        })
        var returnObj = {}
        returnObj[propName] = events
        return returnObj

    } else {
        var returnObj = {}
        returnObj[propName] = []
        return returnObj
    }
}

function parseEventBusEvent(file) {
    return {}
}

function parseEventProfile(name, str) {
    var PROFILE_RE = new RegExp('###[\\s\\S]*?' + '(?=###\\s*?' + name.replace('.', '\\.') + ')', 'g')
    var result = str.match(PROFILE_RE)
    if (result) {
        var profile = result[0]
        lastAt = profile.lastIndexOf('###')
        var profile = profile.substr(lastAt + 3)
        var description = parseTagBlock('description', profile)
        var params = parseParams(profile)
    }
}

function parseParams(str) {
    var PARAM_RE = /@param.*?(\r\n|\n)/g
    var REMOVE_RE = /\r\n|\n/g
    var result = str.match(PARAM_RE)
    if (result) {
        var params = []
        result.forEach(function(param) {
            var type = param.match(/\{\w+\}/)[0].replace(/[\{\}]/g, '')
            var name = param.match(/\}\s\w+\s/)[0].replace(/\}\s*/, '')
            var description = param.match(/\}.*/)[0].replace(/\}\s*/, '')
            params.push({
                name: name,
                type: type,
                description: description
            })
        })
        console.log(params)
    } else {
        return []
    }
}


function render(docTemplate, renderData) {
    return ejs.render(docTemplate, _.extend(defaultDocJSON, renderData))
    // return ejs.render(docTemplate, {
    //     'widgetName': widgetName,
    //     'description': 'fucking the shit',
    //     'composeWidgets': ['toolbar', 'wc'],
    //     'note': 'This is a shit',
    //     'currentResponseEvents': [
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }, 
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }
    //         // {name: 'fuck'}
    //     ],
    //     'currentRequestEvents':  [
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }, 
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }
    //         // {name: 'fuck'}
    //     ],
    //     'containerResponseEvents':  [
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }, 
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }
    //         // {name: 'fuck'}
    //     ],
    //     'containerRequestEvents': [
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }, 
    //         {
    //             widgetName: 'toolbar',
    //             eventName: 'testing-shit',
    //             name: 'shit',
    //             description: 'This is a pile of shit',
    //             params: [
    //                 {name: 'name', type: 'String', description: 'shit name'},
    //                 {name: 'smelly', type: 'Boolean', description: 'if the shi is smelly'}
    //             ]
    //         }
    //         // {name: 'fuck'}
    //     ]
    // })
}

function createReadMeDoc(parsedDoc) {
    var targetFile = path.join(widgetDir, widgetName, 'README.md')
    return fs.createWriteStream(targetFile).write(parsedDoc)
}

function log(type, msg) {
    var colorsMap = {
        'error': RED_COL,
        'warn': YELLOW_COL,
        'success': GREEN_COL
    }

    console.log(colorsMap[type] + msg + RESET_COL)
}

function isWidgetExists(widgetName) {
    var filePath = getWidgetFilePath(widgetName)
    return fs.existsSync(filePath)
}

function getWidgetFilePath(widgetName) {
    var filePath = path.join(widgetDir, widgetName, widgetName + '.coffee') 
    return filePath
}

function capitalize (words) {
    return words[0].toUpperCase() + words.slice(1)
}

function toCamelCase(name) {
    var SPECIAL_CHARS_REGEXP = /([\:\-\_]+(.))/g

    return name.replace(SPECIAL_CHARS_REGEXP, function(_, separator, letter, offset) {
          return offset ? letter.toUpperCase() : letter
    })
}

makeWidgetDoc(widgetName)
