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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/or.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<img class="bk" src="${pageContext.request.contextPath}/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">增加属性值</h3>
			<form role="form" action="javaScript:void(0);">
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
							<input id="value" type="text" required="required" class="form-control" value="5" placeholder="属性值，如5">
							<span class="help-block">属性值，如5</span>
						</div>
						<div class="form-group">
							<label for="score">属性值分值</label>
							<input id="score" type="number" min="0.0" max="10.0" required="required" class="form-control" value="5.0" placeholder="属性值分值，如5.0">
							<span class="help-block">属性值分值，如5.0</span>
						</div>
						<button type="reset" class="btn btn-default">重置</button>  
		    			<button type="submit" class="btn btn-primary" onclick="javaScript:addAttrValue();">添加</button>
					</div>
					<!-- 基本信息结束 -->
				</div>
			</form>
			<!-- 分类模态窗展示区 -->
			<div id="getClassify"></div>
			<!-- 物件模态窗展示区 -->
			<div id="getRes"></div>
			<!-- 属性模态窗展示区 -->
			<div id="getAttr"></div>
		</div>
	</div>
</div>
<%@include file="../xx/attributeValueModel.jsp" %>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
var data = null;
$(function(){
	/*分类模态窗*/
	$.getJSON(config.serverIp+"xx/modal/classifyModal",function(r){
		data = $.parseJSON(r);
		if( data.code=="0"&& data.msg=="OK"){
			render_modal("#getValue-template",data.result,"#getClassify");
		}else{
			console.log(data.msg);
		}
	});
	/*物件模态窗*/
	$.getJSON(config.serverIp+"xx/modal/resModal",function(r){
		data = $.parseJSON(r);
		if( data.code=="0"&& data.msg=="OK"){
			render_modal("#getValue-template",data.result,"#getRes");
		}else{
			console.log(data.msg);
		}
	});
	/*属性模态窗*/
	$.getJSON(config.serverIp+"xx/modal/attrModal",function(r){
		data = $.parseJSON(r);
		if( data.code=="0"&& data.msg=="OK"){
			render_modal("#getValue-template",data.result,"#getAttr");
		}else{
			console.log(data.msg);
		}
	});
});

function addAttrValue(){
	var cv = "",av="",rv="",value="",score="0.0";
	cv = $("#classify_id").val();
	av = $("#attrId").val();
	rv = $("#resId").val();
	value = $("#value").val();
	score =  $("#score").val();
	console.log(cv+" - "+av+" - "+rv+" - "+value);
	var addJson = {"classify_id":Number(cv),"attrId":Number(av),"resId":Number(rv),"value":value,"score":Number(score)};
	$.ajax({
	    url:config.serverIp+"xx/attributeValue/add",
	    type:'post',
	    dataType:'json',
	    contentType:'application/json;charse=UTF-8',
	    data:JSON.stringify(addJson),
	    success:function(r){
	    	console.log("result:"+r);
	    	data = $.parseJSON(r);
			if( data.code=="0"&& data.msg=="OK"){
				alert("添加成功！")
			}else{
				alert(data.msg);
			}
	    }
	});
}

function create(){
	console.log("create()");
}
function fresh(){
	console.log("fresh()");
}

/**获取属性编号*/
function getAttr(){
	$('#attrModal').modal('hide');
	var value = getRadio("attr");
	$("#attrId").val(value);
}
/**获取物件编号*/
function getRes(){
	$('#resModal').modal('hide');
	var value = getRadio("res");
	$("#resId").val(value);
}
/**获取类别编号*/
function getClassify(){
	$('#classifyModal').modal('hide');
	var value = getRadio("classify");
	$("#classify_id").val(value);
}
</script>
</body>
</html>