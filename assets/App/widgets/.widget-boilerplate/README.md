# <%- widgetName %>

## Description

**功能描述**: <%- description %>
**组合widgets**: <% -%>
<% composeWidgets.forEach(function(widget) { %>
 * <%- widget.replace(/<br\/>/g, '') -%>
<% }) %>    

**特殊说明（注意事项）**: <%- note %>

## Events

### 提供给container的响应事件：container.on <%- -%>
<% containerResponseEvents.forEach(function(event) { %>
* <%- event.widgetName %>:<%- event.eventName %>
    * description: <%- event.description %>
    * params:<%- -%>
        <% event.params.forEach(function(param) { %>
        * <%- param.name %>: <%- param.type %>, <%- param.description -%>
        <% }) -%>
<% }) %>

### 提交给container的请求事件：container.trigger <%- -%>
<% containerRequestEvents.forEach(function(event) { %>
* <%- event.widgetName %>:<%- event.eventName %>
    * description: <%- event.description %>
    * params:<%- -%>
        <% event.params.forEach(function(param) { %>
        * <%- param.name %>: <%- param.type %>, <%- param.description -%>
        <% }) -%>
<% }) %>

### 需要特定widget提交的响应事件：this.on <%- -%>
<% currentResponseEvents.forEach(function(event) { %>
* <%- event.widgetName %>:<%- event.eventName %>
    * description: <%- event.description %>
    * params:<%- -%>
        <% event.params.forEach(function(param) { %>
        * <%- param.name %>: <%- param.type %>, <%- param.description -%>
        <% }) -%>
<% }) %>

### 需要特定的widget提供的请求事件：this.trigger <%- -%>
<% currentRequestEvents.forEach(function(event) { %>
* <%- event.widgetName %>:<%- event.eventName %>
    * description: <%- event.description %>
    * params:<%- -%>
        <% event.params.forEach(function(param) { %>
        * <%- param.name %>: <%- param.type %>, <%- param.description -%>
        <% }) -%>
<% }) %>
