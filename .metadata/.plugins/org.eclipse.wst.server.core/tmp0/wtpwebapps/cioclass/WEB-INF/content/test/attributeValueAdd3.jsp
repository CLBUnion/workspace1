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
.modal{background-color:rgba(255,255,255,0.6);margin:10%;}
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
							<input id="resId" type="number" required="required" class="form-control" placeholder="请输入物件编号" data-toggle="modal" data-target="#resModal">
							<span class="help-block">请输入物件编号</span>
						</div>
						<div class="form-group">
							<label for="attrId">属性编号</label>
							<input id="attrId" type="number" required="required" class="form-control" placeholder="请输入属性编号" data-toggle="modal" data-target="#attrModal">
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
	<%@include file="../xx/attributeValueModel.jsp" %>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
/**获取属性编号*/
function getAttr(){
	$('#attrModal').modal('hide');
	getRadio('input:radio[name="radio-attr"]:checked','#attrId');
}
/**获取物件编号*/
function getRes(){
	$('#resModal').modal('hide');
	getRadio('input:radio[name="radio-res"]:checked','#resId');
}
/**获取类别编号*/
function getClassify(){
	$('#classifyModal').modal('hide');
	getCheckbox();
	getRadio('input:radio[name="radio-xs"]:checked','#classify_id');
}
/**获取多选框的值*/
function getCheckbox(){
	var total = 0;
	var val = [];
	var checks = $('input:checkbox[name="checkbox-xs"]:checked');
	for(var i=0;i<checks.length;i++){
		val[total]=checks[i].value;
		total++;
	}
	for(var i=0;i<total;i++){
		console.log(val[i]);
	}
}
/**获取单选框的值*/
function getRadio(selector,valueSelector){
	var checks = $(selector);
	var tempValue=null;
	if(checks.length==0){
		alert("未选中单选框");
	}else{
		tempValue=checks[0].value;
		$(valueSelector).val(tempValue);
	}
}
/**双击选中对应的单选框*/
$(".h").bind("dblclick",function(){
	this.children[0].children[0].checked="checked";
})
</script>
</body>
</html>