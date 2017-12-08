<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>增加属性值</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
<style>
.modal{background-color:rgba(255,255,255,0.6);margin:100px;}
.h:hover {background-color:#888;}
</style>
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">增加属性值</h3>
			<form role="form" action="/cioclass/xx/attributeValue/add" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#show" data-toggle="tab">基本信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基本信息开始 -->
					<div class="tab-pane fade in active" id="show">
						<div class="form-group">
							<label for="classify_id">分类编号</label>
							<input id="classify_id" type="number" required="required" class="form-control" placeholder="请输入分类编号" data-toggle="modal" data-target="#classifyModal">
							<span class="help-block">请输入分类编号</span>
						</div>
						<div class="form-group">
							<label for="resId">物件编号</label>
							<input id="resId" type="number" required="required" class="form-control" placeholder="请输入物件编号">
							<span class="help-block">请输入物件编号</span>
						</div>
						<div class="form-group">
							<label for="attrId">属性编号</label>
							<input id="attrId" type="number" required="required" class="form-control" placeholder="请输入属性编号">
							<span class="help-block">请输入属性编号</span>
						</div>
						<div class="form-group">
							<label for="value">属性值</label>
							<input id="value" type="number" required="required" class="form-control" value="5" placeholder="属性值，如5">
							<span class="help-block">属性值，如5</span>
						</div>
					</div>
					<!-- 基本信息结束 -->
				</div>
			</form>
		</div>
	</div>
	<div class="modal fade" id="classifyModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">  
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">取回分类</h3>
		</div>
		<div class="modal-body">
			<div>
				<button class="btn btn-default" onclick="fresh()">增加</button>
				<button class="btn btn-default" onclick="fresh()">刷新</button>
				<hr>
				<table class="table" border="1">
					<caption>分类列表</caption>
					<thead>
						<tr>
							<th>单选</th>
							<th>多选</th>
							<th>id</th>
						</tr>
					</thead>
					<tbody>
						<tr class="h">
							<td><input type="checkbox" name="checkbox-xs" value="checkbox-1"></td>
							<td><input type="radio" name="radio-xs" value="1"></td>
							<td>1</td>
						</tr>
						<tr class="h">
							<td><input type="checkbox" name="checkbox-xs" value="checkbox-2"></td>
							<td><input type="radio" name="radio-xs" value="2"></td>
							<td>2</td>
						</tr>
						<tr class="h">
							<td><input type="checkbox" name="checkbox-xs" value="checkbox-3"></td>
							<td><input type="radio" name="radio-xs" value="3"></td>
							<td>3</td>
						</tr>
						<tr class="h">
							<td><input type="checkbox" name="checkbox-xs" value="checkbox-4"></td>
							<td><input type="radio" name="radio-xs" value="4"></td>
							<td>4</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
		    <button type="submit" class="btn btn-primary" onclick="javaScript:getClassify();">取回</button>  
		</div>
	</div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
var checks = null;
var classifyId=null;
function getClassify(){
	$('#classifyModal').modal('hide');
	getCheckbox();
	getRadio();
}
function getCheckbox(){
	var total = 0;
	var val = [];
	checks = $('input:checkbox[name="checkbox-xs"]:checked');
	for(var i=0;i<checks.length;i++){
		val[total]=checks[i].value;
		total++;
	}
	for(var i=0;i<total;i++){
		console.log(val[i]);
	}
}
function getRadio(){
	checks = $('input:radio[name="radio-xs"]:checked');
	if(checks.length==0){
		alert("未选中单选框");
	}else{
		classifyId=checks[0].value;
		$("#classify_id").val(classifyId);
	}
}
$(".h").bind("dblclick",function(){
	this.children[1].children[0].checked="checked";
	getClassify();
})
</script>
</body>
</html>