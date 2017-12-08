<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头 -ERP相关新闻</title>
<link rel="stylesheet" href="../statics/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/page.css">
<style>
.center{text-align:center}
</style>
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<button onclick="fresh()">刷新</button><br>
			每页显示条数：
			<select name="perPage" id="perpage">
			  <option value ="5">5</option>
			  <option value="10" selected="selected">10</option>
			  <option value ="20">20</option>
			  <option value ="30">30</option>
			  <option value ="50">50</option>
			</select>
			<br>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<!-- 
			title      模糊搜索标题
			keyword    模糊搜索关键字
			startTime  2017-9-10(格式)
			endTime    2017-9-10(格式)
			 -->
			<div>
				<label for="title">标题</label>
				<input type="text" name="title">
				<label for="keyword">关键字</label>
				<input type="text" name="keyword">
			         日期区间：
				<input type="date" name="startTime">-<input type="date" name="endTime" id="endTime">
			</div>
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<!-- 分页的内容 -->
			<div id="pages" class="pages"></div>
			<!-- 分页的组件 -->
			<div class="page"></div>
		</div>
	</div>
</div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}},code:{{code}}</div>
	<div>每页 {{pageSize}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption class="center">ERP相关新闻</caption>
			<thead>
				<tr>
					<th>关键字</th>
					<th>新闻标题</th>
					<th>新闻发布日期</th>
				</tr>
			</thead>
			<tbody>
			{{#each result}}
				<tr>
					<td>{{keyword}}</td>
					<td><a href="{{resrouceUrl}}" target="_blank">{{title}}</td>
					<td>{{happenTime}}</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/jquery.page.js"></script>
<script src="../js/handlebars.js"></script>
<script>
window.onload=function(){
	fresh();
}
/*调节每页大小*/
pageSize=10;

$("#perpage").change(function(){
	get(1);
});
/*refresh*/
function fresh(){
	get(1);
}

function render_news(templateSelector,data,htmlSelector){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
	
	pageCount = data.totalpage;
	current = data.currentNo;
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
	$.getJSON("http://www.ssdat.com.cn:8080/informationqimeng/home/showData",{"pageNo":id,"pageSize":pageSize },function(data){
		msg = data;
		if(data.msg=="OK" && data.code=="200"){
			render_news("#page-template",data,"#pages");
		}else{
			console.log(msg.msg);
		}
	});
}
</script>
</body>
</html>