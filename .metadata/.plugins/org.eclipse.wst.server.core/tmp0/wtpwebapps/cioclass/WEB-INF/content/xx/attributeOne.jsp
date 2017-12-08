<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>属性${param.id}的值</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<input id="id" value="${param.id}" type="text" name="id">
<hr>
<div id="One"></div>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script id="one-template" type="text/x-handlebars-template">
    <div>msg:{{msg}}  code:{{code}}</div>
    <div>attrId:{{result.id}}</div>
    <div>attrName:{{result.name}}</div>
    <div>attrDescribe:{{result.describe}}</div>
    <div>attrCreateDate:{{result.createDate}}</div>
</script>
<script>
$(function(){
	get($("#id").val());
});
function get(id){
	$.getJSON(config.serverIp+"xx/attribute/getById",{"id":Number(id)},function(data){
		msg = $.parseJSON(data);
		if( msg.code=="0"&& msg.msg=="OK"){
		    console.log(msg);
            render_modal("#one-template",msg,"#One");
		}else{
			console.log(msg.msg);
		}
	});
}
</script>
</body>
</html>