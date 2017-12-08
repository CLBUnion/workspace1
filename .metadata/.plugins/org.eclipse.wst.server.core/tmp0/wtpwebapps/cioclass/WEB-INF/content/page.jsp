<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>JQuery简单分页</title>
<link href="${pageContext.request.contextPath}/css/page.css" rel="stylesheet">
</head>
<body>
<!-- 分页的内容 -->
<div id="pages" class="pages"></div>
<!-- 分页的组件 -->
<div class="page"></div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}},code:{{code}}</div>
	<div>每页大小:{{size}},共 {{totalElements}} 条记录</div>
	<div>content:
		{{#each content}}
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{id}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{direction}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{education}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{email}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{experience}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{name}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{phone}}</div>
			<div>&nbsp;&nbsp;&nbsp;&nbsp;{{create_time}}</div>
		{{/each}}
	</div>
</script>

<script src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
/*调节每页大小*/
pageSize=4;
/*get page data*/
function tos(num){
	turn_to_page(config.serverIp+"getMaximaPage",num);
}
/*turn to the current page*/
tos(current);
</script>
</body>
</html>