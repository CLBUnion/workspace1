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
.modal{background-color:rgba(255,255,255,0.6);margin:4%;}
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
					</div>
					<!-- 基本信息结束 -->
				</div>
			</form>
			<div id="getValue"></div>
		</div>
	</div>
</div>
<script id="getValue-template" type="text/x-handlebars-template">
	<div class="modal fade" id="{{model_id}}" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">  
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">{{model_title}}</h3>
		</div>
		<div class="modal-body">
			<div>
				{{#each body_link}}	
				<button class="btn btn-default" onclick="{{js_fun}}">{{link_name}}</button>
				{{/each}}
				<hr>
				<table class="table" border="1">
					<caption>{{body_title}}</caption>
					<thead>
						<tr>
							{{#each body_head}}	
							<th><span title="{{this}}">{{this}}</span></th>
							{{/each}}
						</tr>
					</thead>
					<tbody>
						{{#each body_content}}
						<tr class="h" ondblclick="dbc(this);">
							<td><input type="{{type}}" name="{{name}}" value="{{value}}"></td>
							{{#each content_list}}	
							<td><span title="{{this}}">{{this}}</span></td>
							{{/each}}
						</tr>
						{{/each}}
					</tbody>
				</table>
			</div>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
		    <button type="submit" class="btn btn-primary" onclick="javaScript:{{getFun}};">取回</button>  
		</div>
	</div>
</script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/handlebars.js"></script>
<script type="text/javascript">
var data = null;
window.onload=function(){
	data='{'
		    +'"model_id":"classifyModal",'
			+'"model_title":"model_title",'
			+'"body_link":['
				+'{"js_fun":"create()","link_name":"增加"},'
				+'{"js_fun":"fresh()","link_name":"刷新"}'
				+'],'
			+'"body_title":"body_title",'
			+'"body_head":["单选","ID"],'
			+'"body_content":['
				+'{"type":"radio","name":"name","value":"1","content_list":["value1"]},'
				+'{"type":"radio","name":"name","value":"2","content_list":["value2"]},'
				+'{"type":"radio","name":"name","value":"3","content_list":["value3"]}'
				+'],'
			+'"getFun":"getFun()"'
		   +'}';
	render_modal("#getValue-template",$.parseJSON(data),"#getValue");
}
function create(){
	console.log("create()");
}
function fresh(){
	console.log("fresh()");
}
function getFun(){
	commit_fun("classifyModal","name","classify_id");
}
function commit_fun(modelId,name,valueId){
	$('#'+modelId).modal('hide');
	getRadio(name,valueId);
}
function dbc(o){
	o.children[0].children[0].checked="checked";
}
/**获取单选框的值*/
function getRadio(name,valueId){
	checks = $('input:radio[name="'+name+'"]:checked');
	if(checks.length==0){
		alert("未选中单选框");
	}else{
		classifyId=checks[0].value;
		$("#"+valueId).val(classifyId);
	}
}
/**获取多选框的值*/
function getCheckbox(name,valueId){
	var total = 0;
	var val = [],str="";
	var checks = $('input:checkbox[name="'+name+'"]:checked');
	for(var i=0;i<checks.length;i++){
		val[total]=checks[i].value;
		total++;
	}
	if(total == 0){
		alert("未选中复选框");
		return str;
	}else{
		for(var i=0;i<total;i++){
			str+=val[i]+","
		}
		return str;
	}
}
/**渲染模板*/
function render_modal(templateSelector,data,htmlSelector){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
}
</script>
</body>
</html>