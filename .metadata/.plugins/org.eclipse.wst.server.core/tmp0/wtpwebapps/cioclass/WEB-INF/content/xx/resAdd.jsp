<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>增加物件</title>
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
			<h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">增加物件</h3>
			<form role="form" action="javaScript:addAttrValue()" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#show" data-toggle="tab">基本信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基本信息开始 -->
					<div class="tab-pane fade in active" id="show">
						
						<div class="form-group">
							<label for="name">物件名称</label>
							<input id="name" name="name" type="text" required="required" class="form-control" placeholder="请输入物件名称">
							<span class="help-block">请输入物件名称</span>
						</div>
						<button type="reset" class="btn btn-default">重置</button>  
		    			<button type="submit" class="btn btn-primary">添加</button>
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
		if( data.code==="0"&& data.msg==="OK"){
			render_modal("#getValue-template",data.result,"#getClassify");
		}else{
			console.log(data.msg);
		}
	});
});

function addAttrValue(){
	var name="";
	name = $("#name").val();
	$.post(config.serverIp+"xx/res/add",{"name":name},function(r) {
        data = $.parseJSON(r);
        if (data.code === "0" && data.msg === "OK") {
            console.log(data);
            alert("添加成功！");
        } else {
            alert(data.msg);
            alert("添加失败！")
        }
    });
}

function create(){
	console.log("create()");
}
function fresh(){
	console.log("fresh()");
}
</script>
</body>
</html>