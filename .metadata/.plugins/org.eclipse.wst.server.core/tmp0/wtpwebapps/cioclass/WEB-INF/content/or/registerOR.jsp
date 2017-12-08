<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司列表</title>
<link rel="stylesheet" href="../statics/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
<link rel="stylesheet" href="../css/page.css">
<style type="text/css">
.modal{background-color:#eee;width:90%;margin:30px auto}
</style>
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">增加产品信息</h3>
			<form role="form" action="#" method="post">
				<div class="form-group">
					<label for="enterpriseCode">公司编码</label>
					<input name="enterpriseCode" id="en" type="text" class="form-control"
					required="required" placeholder="请选择公司编码，必填，唯一" data-toggle="modal" data-target="#companyModal">
					<span class="help-block">请选择公司编码，必填，唯一</span>
				</div>
				<div class="form-group">
					<label for="batchInfoId">批次编号</label>
					<input name="batchInfoId" id="bn" type="text" class="form-control"
					required="required" placeholder="请选择批次编号，必填，唯一" data-toggle="modal" data-target="#batchInfoModal">
					<span class="help-block">请选择批次编号，必填，唯一</span>
				</div>
				<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
				<button type="submit" class="btn btn-primary">提交</button>
			</form>
			<br><br><br><br>
			<div class="cp">洋葱头(厦门）信息科技有限公司 版权所有<br>全国咨询热线：<a href="tel:400-1122-661">400-1122-661</a></div>
		</div>
	</div>
	<!--获取公司信息弹出层开始-->  
	<div class="modal fade" id="companyModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">  
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">修改信息</h3>
		</div>
		<div class="modal-body">
			<div>
				<a href="#" target="_blank">增加</a>
				<button onclick="fresh()">刷新</button>
				每页显示条数：
				<select name="perPage" id="perpage">
				  <option value ="4">4</option>
				  <option value ="5">5</option>
				  <option value="10">10</option>
				  <option value="20">20</option>
				</select>
			</div>
			<br>
			<!-- 分页的内容 -->
			<div id="pages" class="pages"></div>
			<!-- 分页的组件 -->
			<div class="page"></div>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
		    <button type="submit" class="btn btn-primary" onclick="javaScript:getCompany();">取回</button>  
		</div>
	</div>
	<!--获取公司信息弹出层结束-->
	<!--获取批次信息弹出层开始-->  
	<div class="modal fade" id="batchInfoModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">  
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">选择批次信息</h3>
		</div>
		<div class="modal-body">
			<div>
				<a href="#" target="_blank">增加</a>
				<button onclick="fresh1()">刷新</button>
				每页显示条数：
				<select name="perPage" id="perpage1">
				  <option value ="4">4</option>
				  <option value ="5">5</option>
				  <option value="10">10</option>
				  <option value="20">20</option>
				</select>
			</div>
			<br>
			<!-- 分页的内容 -->
			<div id="pages1" class="pages"></div>
			<!-- 分页的组件 -->
			<div class="page page1"></div>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
		    <button type="submit" class="btn btn-primary">取回</button>  
		</div>
	</div>
	<!--获取批次信息弹出层结束-->
</div>
<script id="page-template" type="text/x-handlebars-template">
	<div>每页 {{size}} 条记录,共 {{totalElements}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>公司列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>abbreviation</th>
					<th>enterpriseCode</th>
					<th>enterpriseName</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td><input name="cid" type="radio" value="{{enterpriseCode}}"></td>
					<td>{{abbreviation}}</td>
					<td>{{enterpriseCode}}</td>
					<td>{{enterpriseName}}</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>

<script id="batchInfo-template" type="text/x-handlebars-template">
	<div>每页 {{size}} 条记录,共 {{totalElements}} 条记录</div>
	<div>
		<table class="table" border="1">
			<caption>批次列表</caption>
			<thead>
				<tr>
					<th>id</th>
					<th>catalogName</th>
				</tr>
			</thead>
			<tbody>
			{{#each content}}
				<tr>
					<td><input name="cid" type="radio" value="{{id}}"></td>
					<td>{{catalogName}}</td>
				</tr>
			{{/each}}
			</tbody>
		</table>
	</div>
</script>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/common.js"></script>
<script src="../js/jquery.page.js"></script>
<script src="../js/handlebars.js"></script>
<script type="text/javascript">
function getCompany(){
	$('#companyModal').modal('hide');
	var val=$('input:radio[name="cid"]:checked').val();
	$("#en").val(val);
}

</script>
<script>
/*调节每页大小*/
pageSize=4;
function tos(num){
	var perpage = $("#perpage").val();
	if(perpage !=""){
		pageSize = parseInt(perpage);
	}
	turn_to_page(config.serverIp+"or/company/companyPage",num);
}
tos(current);
$("#perpage").change(function(){
	tos(1);
});
function fresh(){
	tos(1);
}

function tos1(num){
	var perpage = $("#perpage1").val();
	if(perpage !=""){
		pageSize = parseInt(perpage);
	}
	turn_to_pages(config.serverIp+"shop/getGoodsCatalogPage",num,"batchInfo-template","pages1","page1","tos1");
}
tos1(current);
$("#perpage1").change(function(){
	tos1(1);
});
function fresh1(){
	tos1(1);
}
</script>
</body>
</html>