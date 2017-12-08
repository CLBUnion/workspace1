<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>备忘录列表</title>
<link rel="stylesheet" href="../statics/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/page.css">
</head>
<body>
每页显示条数：
<select name="perPage" id="perpage">
  <option value ="4">4</option>
  <option value ="5">5</option>
  <option value="10">10</option>
  <option value="20">20</option>
</select>
<br>
<button onclick="fresh()">刷新</button>
<!-- 分页的内容 -->
<div id="pages" class="pages"></div>
<!-- 分页的组件 -->
<div class="page"></div>
<script id="page-template" type="text/x-handlebars-template">
	<div>msg:{{msg}},code:{{code}}</div>
	<div><a href="addTrickler" target="_blank">增加</a>
	</div>
	<div>每页 {{size}} 条记录,共 {{totalElements}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>备忘录列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>title</th>
					<th>content</th>
					<th>createTime</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td>{{id}}</td>
					<td>{{title}}</td>
					<td>{{content}}</td>
					<td>{{createTime}}</td>
					<td><a href="javaScript:del('{{id}}');">删除</a>
						<a href="javaScript:get('{{id}}');">详细</a>
					</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>
<script src="../js/jquery-1.8.3.min.js"></script>
<script src="../js/jquery.page.js"></script>
<script src="../js/handlebars.js"></script>
<script src="../js/common.js"></script>
<script>
/*调节每页大小*/
pageSize=4;

/*get page data*/
function tos(num){
	var perpage = $("#perpage").val();
	if(perpage !=""){
		pageSize = parseInt(perpage);
	}
	turn_to_page(config.serverIp+"note/getTicklerPage",num);
}
/*turn to the current page*/
tos(current);
/*turn page to refresh*/
$("#perpage").change(function(){
	tos(1);
});
/*refresh*/
function fresh(){
	tos(1);
}

/*delete function*/
function del(id){
	if(window.confirm('你确定要删除id为'+id+'的记录？')){
		$.getJSON(config.serverIp+"note/delTicklerById",{"id":id},function(data){
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
	$.getJSON(config.serverIp+"note/getTicklerById",{"id":id},function(data){
		console.log(data);
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