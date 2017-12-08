<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>属性值列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<button onclick="fresh()">刷新</button><br>
每页显示条数：
<select name="perPage" id="perpage">
  <option value ="5">5</option>
  <option value ="10">10</option>
  <option value ="20">20</option>
  <option value ="30">30</option>
  <option value ="50">50</option>
</select>
<br>
<!-- 分页的内容 -->
<div id="pages" class="pages"></div>
<!-- 分页的组件 -->
<div class="page"></div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}},code:{{code}}</div>
	<div>每页 {{pageSize}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>属性值列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>classify_id</th>
					<th>resId</th>
					<th>attrId</th>
					<th>value</th>
					<th>score</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td>{{id}}</td>
					<td onclick="getClassifyOne('{{classify_id}}')">{{classify_id}}</td>
					<td onclick="getResOne('{{resId}}')">{{resId}}</td>
					<td onclick="getAttrOne('{{attrId}}')">{{attrId}}</td>
					<td>{{value}}</td>
					<td>{{score}}</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>
<script src="../js/jquery.page.js"></script>
<script src="../js/handlebars.js"></script>
<script src="../js/common.js"></script>
<script>
window.onload=function(){
	fresh();
}
/*调节每页大小*/
pageSize=4;

$("#perpage").change(function(){
	get(1);
});

function fresh(){
	get(1);
}

function getClassifyOne(id){
	window.open(config.serverIp+"xx/classifyOne?id="+id);
}

function getResOne(id){
	window.open(config.serverIp+"xx/resOne?id="+id);
}

function getAttrOne(id){
	window.open(config.serverIp+"xx/attributeOne?id="+id);
}

function render_news(templateSelector,data,htmlSelector){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
	
	pageCount = data.totalPages;
	current = data.number+1;
	$(".page").createPage({
	    pageCount:pageCount,
	    current:current,
	    funName:"get"
	});
}

function get(id){
	var perpage = $("#perpage").val();
	if(perpage !=""){
		pageSize = parseInt(perpage);
	}
	
	$.getJSON(config.serverIp+"xx/attributeValue/getPage",{"pageNo":id,"pageSize":pageSize},function(data){
		msg = $.parseJSON(data);
		if( msg.code=="0"&& msg.msg=="OK"){
			render_news("#page-template",$.parseJSON(data),"#pages");
		}else{
			console.log(msg.msg);
		}
	});
}
</script>
</body>
</html>