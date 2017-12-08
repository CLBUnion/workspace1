<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>CGPV列表</title>
<link href="../css/page.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
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
	<div>每页 {{size}} 条记录,共 {{totalElements}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>CGPV列表</caption>
			<thead>
				<tr>
					<th>id.catalogId</th>
					<th>id.goodsId</th>
					<th>id.propId</th>
					<th>value</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td>{{id.catalogId.catalogName}}</td>
					<td>{{id.goodsId.goodsName}}</td>
					<td>{{id.propId.propertyName}}</td>
					<td>{{value}}</td>
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
<!-- <script src="../js/bootstrap.min.js"></script> -->
<script>
/*调节每页大小*/
pageSize=4;
/*get page data*/
function tos(num){
	var perpage = $("#perpage").val();
	if(perpage !=""){
		pageSize = parseInt(perpage);
	}
	turn_to_page(config.serverIp+"shop/getCGPVPage",num);
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
</script>
</body>
</html>