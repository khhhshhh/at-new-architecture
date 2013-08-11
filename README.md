# @+ 新架构示例

## 新架构的特点：
* data-binding
* modularization
* UI composition
* event-driven collaboration between components

## 依赖框架
* [Duanrandal](http://durandaljs.com/)
* [Knockout](http://knockoutjs.com/index.html)
* [jQuery](http://jquery.com/)
* [Require](http://requirejs.org/)

## 运行方式
1. Enter the `at-new-architecture` folder 
2. Use `make start` to start up an asset server and begin coding immediately.
3. Use `make build-opt` to create your optimized application. The deployable source will be output to a 'dist' folder.
4. See the [Mimosa](http://mimosajs.com/) project for details on how to customize the solution and use other features.

## 示例说明
示例提供了：兴趣点（interesting-point），工具栏（toolbar），蒙版（mask）三个widget的简单实现以及它们的组合。

按照以下顺序查看：

1. 兴趣点widget： `assets/App/widgets/interesting-point`
2. 蒙版widget：`assets/App/widgets/mask`
3. 工具栏widget: `assets/App/widgets/toolbar`
4. 蒙版和兴趣点组合widget： `assets/App/widgets/mask-interesting-point`

最后以一个route的view把上面的toolbar的widget，mask-interesting-point的widget组合起来：

1. `assets/App/route/mask`

示例涵盖以下特性：
* widget的构建
* widget之间组合
* widget之间的嵌套
* widget之间通过events进行通信
* 和data-bus进行数据交互

## ToDos

1. 自动化测试
2. 可视化测试
3. Routers
