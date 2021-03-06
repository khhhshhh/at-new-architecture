﻿// Durandal hacking
// Hack it for automaticly loading style for individual widget
// by @Diajihau
// 2013-8-9
var timeStamp = window.timeStamp = startTime = +new Date 
var count = window.count = 0 

define(['./system', './composition', './events'], function (system, composition, events) {

    var widgetPartAttribute = 'data-part',
        widgetPartSelector = '[' + widgetPartAttribute + ']';

    var kindModuleMaps = {},
        kindViewMaps = {},
        bindableSettings = ['model','view','kind'];

    var widget = {
        getParts: function(elements) {
            var parts = {};

            if (!system.isArray(elements)) {
                elements = [elements];
            }

            for (var i = 0; i < elements.length; i++) {
                var element = elements[i];

                if (element.getAttribute) {
                    var id = element.getAttribute(widgetPartAttribute);
                    if (id) {
                        parts[id] = element;
                    }

                    var childParts = $(widgetPartSelector, element);

                    for (var j = 0; j < childParts.length; j++) {
                        var part = childParts.get(j);
                        parts[part.getAttribute(widgetPartAttribute)] = part;
                    }
                }
            }

            return parts;
        },
        getSettings: function(valueAccessor) {
            var value = ko.utils.unwrapObservable(valueAccessor()) || {};

            if (typeof value == 'string') {
                return value;
            } else {
                for (var attrName in value) {
                    if (ko.utils.arrayIndexOf(bindableSettings, attrName) != -1) {
                        value[attrName] = ko.utils.unwrapObservable(value[attrName]);
                    } else {
                        value[attrName] = value[attrName];
                    }
                }
            }

            return value;
        },
        registerKind: function(kind) {
            ko.bindingHandlers[kind] = {
                init: function() {
                    return { controlsDescendantBindings: true };
                },
                update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
                    var settings = widget.getSettings(valueAccessor);
                    settings.kind = kind;
                    widget.create(element, settings, bindingContext);
                }
            };

            ko.virtualElements.allowedBindings[kind] = true;
        },
        mapKind: function(kind, viewId, moduleId) {
            if (viewId) {
                kindViewMaps[kind] = viewId;
            }

            if (moduleId) {
                kindModuleMaps[kind] = moduleId;
            }
        },
        convertKindToModuleId: function(kind) {
            return kindModuleMaps[kind] || 'durandal/widgets/' + kind + '/controller';
        },
        convertKindToViewId: function (kind) {
            return kindViewMaps[kind] || 'durandal/widgets/' + kind + '/view';
        },
        //>> hack
        convertKindToStyleId: function (kind) {
            return kindViewMaps[kind] || 'durandal/widgets/' + kind + '/view';
        },
        //>> /hack
        beforeBind: function(element, view, settings) {
            var replacementParts = widget.getParts(element);
            var standardParts = widget.getParts(view);

            for (var partId in replacementParts) {
                $(standardParts[partId]).replaceWith(replacementParts[partId]);
            }
        },
        createCompositionSettings: function(settings) {
            if (!settings.model) {
                settings.model = this.convertKindToModuleId(settings.kind);
            }

            if (!settings.view) {
                settings.view = this.convertKindToViewId(settings.kind);
            } 

            //>> hack
            if (!settings.style) {
                settings.style = this.convertKindToStyleId(settings.kind);
            } 
            //>> /hack

            settings.preserveContext = true;
            settings.beforeBind = this.beforeBind;

            return settings;
        },
        create: function (element, settings, bindingContext) {
            if (typeof settings == 'string') {
                settings = {
                    kind: settings
                };
            }

            var compositionSettings = widget.createCompositionSettings(settings);
            composition.compose(element, compositionSettings, bindingContext);
        },
        // >> hack
        nestContainerEventMethod: function(settings) {

            if (typeof settings === 'string') {
                settings = {
                    kind: settings,
                    container: {}
                };
            }

            var $parent = settings.container || {};
            var container = {};

            container.__moduleId__ = $parent.__moduleId__ || '';

            if (isEventObject($parent)) {
                nestParentEventIntoContainer()
            } else {
                mockContainerEvent()
            }

            settings.container = container;
            return settings;

            function isEventObject (obj) {
              return obj.off && obj.on && obj.proxy && obj.trigger
            }

            function nestParentEventIntoContainer () {
                container.on = function() {
                    return $parent.on.apply($parent, arguments)
                } 

                container.off = function() {
                    return $parent.off.apply($parent, arguments)
                }

                container.trigger = function() {
                    return $parent.trigger.apply($parent, arguments)
                }

                container.proxy = function() {
                    return $parent.trigger.apply($parent, arguments)
                }
            }

            function mockContainerEvent () {
                events.includeIn(container)
            }

        }
        // >> /hack
    };

    function test (arguments) {
        thisTime = +new Date
        count++

        if (count === 1) startTime = thisTime 

        dist = thisTime - startTime
        // console.log(dist)
        timeStamp = thisTime 
    }

    ko.bindingHandlers.widget = {
        init: function() {
            return { controlsDescendantBindings: true };
        },
        update: function(element, valueAccessor, allBindingsAccessor, viewModel, bindingContext) {
            var settings = widget.getSettings(valueAccessor);
            // >> hack
            settings = widget.nestContainerEventMethod(settings)
            // >> /hack
            widget.create(element, settings, bindingContext);
            test()
        }
    };

    ko.virtualElements.allowedBindings.widget = true;

    return widget;
});