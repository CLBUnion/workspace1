<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>资讯信息列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
<style type="text/css">
th{background-color:#ddd;}
.h:nth-child(2n){background-color:#eee;}
.h:hover{background-color:#888;color:#fff;font-weight:700;}
.h:hover a{color:#fff;}
</style>
</head>
<body>
<button onclick="fresh()">刷新</button>
<button onclick="updateTitle()">更新标题</button>

<br>
每页显示条数：
<select name="perPage" id="perpage">
  <option value ="5">5</option>
  <option value ="10" selected="selected">10</option>
  <option value ="20">20</option>
  <option value ="30">30</option>
  <option value ="50">50</option>
</select>
<br>

<div>
	<label for="title">标题</label>
	<input type="text" name="title" class="search" id="title">
	<label for="keyword">关键字</label>
	<input type="text" name="keyword" class="search" id="keyword">
         日期区间：
	<input type="date" name="startTime" class="search" id="startTime">-<input type="date" name="endTime" class="search" id="endTime">
	<button onclick="fresh()" class="search">搜索</button><br>
</div>


<!-- 分页的内容 -->
<div id="pages" class="pages"></div>
<!-- 分页的组件 -->
<div class="page"></div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}},code:{{code}}</div>
	<div>每页 {{pageSize}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>资讯信息列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>链接</th>
					<th>新增日期</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr class="h" onclick="javaScript:window.open('{{url}}')">
					<td>{{id}}</td>
					<td>
					{{#if title}}
						<a href="javaScript:void(0);" target="_blank" title="{{title}}">{{title}}</a>
					{{else}}
						<a href="javaScript:void(0);" target="_blank" title="{{text}}">{{text}}</a>
					{{/if}}
					</td>
					<td>{{createTime}}</td>
					<td class="zindex"><a href="javaScript:find('{{url}}')">爬取</a>
					  <a href="javaScript:del('{{id}}')">删除</a>
					</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
var p_no = 1;
$(document).ready(function(){
	fresh();
});
/*调节每页大小*/
pageSize=10;

$("#perpage").change(function(){
	get(1);
});
function fresh(){
	get(1);
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

function find(url){
	$.getJSON(config.serverIp+"zx/searchLinks",{"url":url},function(data){
		msg = $.parseJSON(data);
		if( msg.code==="0"&& msg.msg==="OK"){
			get(1);
		}else{
			alert("爬取失败");
		}
	});
}

function get(id){
	var perpage = $("#perpage").val();
	if(perpage !=""){
		pageSize = parseInt(perpage);
	}
	p_no = id;
	$.getJSON(config.serverIp+"zx/getPage",{"pageNo":id,"pageSize":pageSize },function(data){
		msg = $.parseJSON(data);
		if( msg.code=="0"&& msg.msg=="OK"){
			render_news("#page-template",$.parseJSON(data),"#pages");
		}else{
			console.log(msg.msg);
		}
	});
}

function del(id){
	if(window.confirm('确定删除该链接（'+id+'）？')){
		$.getJSON(config.serverIp+"zx/delById",{"id":id},function(data){
			msg = $.parseJSON(data);
			if( msg.code==="0"&& msg.msg==="OK"){
				alert("删除成功");
				get(p_no);
			}else{
				alert(msg.msg);
			}
		});
    }else{
        return false;
    }
}

function updateTitle(){
	$.getJSON(config.serverIp+"zx/updateTitle",function(data){
		get(p_no);
		alert(data.msg);
	});
}
</script>
</body>
</html>