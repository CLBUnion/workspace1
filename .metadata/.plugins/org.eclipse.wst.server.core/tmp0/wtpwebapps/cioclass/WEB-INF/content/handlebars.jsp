<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>handlebars</title>
</head>
<body>
<div id="page" class="page"></div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}}</div>
	<div>number:{{number}}</div>
	<div>code:{{code}}</div>
	<div>numberOfElements:{{numberOfElements}}</div>
	<div>size:{{size}}</div>
	<div>totalPages:{{totalPages}}</div>
	<div>totalElements:{{totalElements}}</div>
	
	<div>sort:
		{{#each sort.orders}}
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{direction}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{ignoreCase}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{nullHandling}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{property}}</div>
		{{/each}}
	</div>
	<div>content:
		{{#each content}}
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{create_time}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{direction}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{education}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{email}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{experience}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{id}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{name}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{phone}}</div>
		{{/each}}
	</div>
</script>
<script src="js/jquery.min.js"></script>
<script src="js/handlebars.js"></script>
<script src="js/common.js"></script>
<script>
/*render function*/
function render(templateSelector,data,htmlSelector){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
}
/*get page data*/
var pageAjax = $.getJSON(config.serverIp+"getMaximaPage",function(data){
	render("#page-template",$.parseJSON(data),"#page");
});
</script>
</body>
</html>

