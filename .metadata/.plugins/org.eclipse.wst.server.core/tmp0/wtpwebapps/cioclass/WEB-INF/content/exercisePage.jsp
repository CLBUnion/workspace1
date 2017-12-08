<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>活动表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
</head>
<body>
<!-- 分页的内容 -->
<div id="pages" class="pages"></div>
<!-- 分页的组件 -->
<div class="page"></div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}},code:{{code}}</div>
	<div><a href="http://cioclass.com/" target="_blank">增加</a>&nbsp;&nbsp;
	</div>
	<div>每页 {{size}} 条记录,共 {{totalElements}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>活动列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>title</th>
					<th>imgUrl</th>
					<th>url</th>
					<th>publishDate</th>
					<th>create_time</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td>{{id}}</td>
					<td>{{title}}</td>
					<td>{{imgUrl}}</td>
					<td>{{url}}</td>
					<td>{{publishDate}}</td>
					<td>{{create_time}}</td>
					<td><a href="javaScript:del('{{id}}');">删除</a>
						<a href="javaScript:get('{{id}}');">详细</a>
					</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/jquery.page.js"></script>
<script src="js/handlebars.js"></script>
<script src="js/common.js"></script>
<script>
/*调节每页大小*/
pageSize=4;
/*get page data*/
function tos(num){
	turn_to_page(config.serverIp+"getExercisePage",num);
}
/*turn to the current page*/
tos(current);

/*delete function*/
function del(id){
	if(window.confirm('你确定要删除id为'+id+'的记录？')){
		$.getJSON(config.serverIp+"delExerciseById",{"id":id},function(data){
			var msg=$.parseJSON(data).msg;
			if(msg!=null && msg=='OK'){
			    tos(current);
				alert("删除成功！");
			}else{
				alert(msg);
			}
		});
	}
}

/*getOne function*/
function get(id){
	$.getJSON(config.serverIp+"getExerciseById",{"id":id},function(data){
		var msg=$.parseJSON(data).msg;
		if(msg!=null && msg=='OK'){
			alert(data);
		}else{
			alert(msg);
		}
	});
}
</script>
</body>
</html>