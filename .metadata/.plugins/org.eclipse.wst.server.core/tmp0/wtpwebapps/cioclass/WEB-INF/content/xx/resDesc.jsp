<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>物件详细信息</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
<style>
.desc-nav{height:100px;border:1px solid blue}
</style>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<div class="container">
	<input class="hidden" id="res_id" name="res_id" value="${param.resId}">
	<input class="hidden" id="classifyId" name="classifyId" value="${param.resId}">
	<div class="row clearfix">
		<div id="res"></div>
	</div>
	<div class="row clearfix">
		<div class="col-xs-12 column desc-nav">
			<div>产品描述</div>
		</div>
	</div>
</div>

<script id="res-template" type="text/x-handlebars-template">
	<div class="col-xs-6 column">
		<img alt="产品图片" title="产品图片" src="../images/res.jpg" width="100%" height="100%">
	</div>
	<div class="col-xs-6 column">
		产品ID：{{id}}<br>
		产品名称：{{name}}<br>
		产品新增日期：{{createDate}}<br>
		<hr>
		各属性值<hr>
		{{#each attrs}}
			属性id:{{id}}<br>
			属性名称：{{name}}<br>
			属性新增日期：{{createDate}}<br>
			属性描述：{{describe}}<br>
		{{/each}}
	</div>
</script>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var resId= $("#res_id").val();
    var classifyId= $("#classifyId").val();
	
	$.getJSON(config.serverIp+"xx/res/getById",{"id":resId},function(data){
		msg = $.parseJSON(data);
		if( msg.code=="0"&& msg.msg=="OK"){
			console.log(msg.result);
			render("#res-template",msg.result,"#res");
		}else{
			console.log(msg.msg);
		}
	});
});

/**
 * 通用handbars渲染方法
 */
function render(templateSelector,data,htmlSelector){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
}
</script>
</body>
</html>