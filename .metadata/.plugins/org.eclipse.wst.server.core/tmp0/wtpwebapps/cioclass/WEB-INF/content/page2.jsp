<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>千里马列表</title>
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
	<div><a href="http://cioclass.com/qlmbm_c.html" target="_blank">增加初级千里马</a>&nbsp;&nbsp;
		<a href="http://cioclass.com/qlmbm_z.html" target="_blank">增加中级千里马</a>&nbsp;&nbsp;
		<a href="http://cioclass.com/qlmbm_g.html" target="_blank">增加高级千里马</a>
	</div>
	<div>每页 {{size}} 条记录,共 {{totalElements}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>千里马列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>direction</th>
					<th>education</th>
					<th>email</th>
					<th>phone</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td>{{id}}</td>
					<td>{{name}}</td>
					<td>{{direction}}</td>
					<td>{{education}}</td>
					<td>{{email}}</td>
					<td>{{phone}}</td>
					<td><a href="javaScript:del('{{id}}');">删除</a>
						<a href="javaScript:get('{{id}}');">详细</a>
					</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
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

/*delete function*/
function del(id){
	if(window.confirm('你确定要删除id为'+id+'的记录？')){
		$.getJSON(config.serverIp+"delMaximaById",{"id":id},function(data){
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
	$.getJSON(config.serverIp+"getMaximaById",{"id":id},function(data){
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