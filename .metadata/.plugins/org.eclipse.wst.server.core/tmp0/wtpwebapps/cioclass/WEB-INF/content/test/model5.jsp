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
.h:nth-child(2n){background-color:#bbb}
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
<%@include file="../xx/attributeValueModel.jsp" %>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../js/handlebars.js"></script>
<script src="../js/common.js"></script>
<script type="text/javascript">
var data = null;
window.onload=function(){
	$.getJSON(config.serverIp+"xx/modal/model6",{"pageNo":"1","pageSize":"5"},function(r){
		data = $.parseJSON(r);
		if( data.code=="0"&& data.msg=="OK"){
			render_modal("#getValue-template",data.result,"#getValue");
		}else{
			console.log(data.msg);
		}
	});
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