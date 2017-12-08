<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品信息-洋葱头溯源系统</title>
</head>
<body>
<div id="navs">
</div>
<div id="content"></div>
<div id="batchInfoId">${id}</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var batchInfoId=$("#batchInfoId").html();
getJson("or/product/findBaseProductByBatchInfoId?id="+batchInfoId);
$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");
var product = msg.result;
$("#content").append("<br><div>product(产品信息)"+
		"<div>product.id="+product.id+"</div>"+
		"<div>product.productCode="+product.productCode+"</div>"+
		"<div>product.productName="+product.productName+"</div>"+
		"<div>product.sourceArea="+product.sourceArea+"</div>"+
		"<div>product.spec="+product.spec+"</div>"+
		"<div>product.termOfValidity="+product.termOfValidity+"</div>"+
		"<div>product.remark="+product.remark+"</div>"+
		"</div>");	
$("#navs").html("<a href=\"retroactive?id="+product.id+"\" target=\"_blank\">产品追溯信息</a>&nbsp;&nbsp;");
/*
getJson("or/product/findRIByPID?id="+batchInfoId);
//$("#content").append("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");
var retroactiveInfo = msg.result;
$("#content").append("<br><div>product.retroactiveInfo(追溯信息)"+
		"<div>retroactiveInfo.id="+retroactiveInfo.id+"</div>"+
		"<div>retroactiveInfo.content="+retroactiveInfo.content+"</div>"+
		"</div>");
var traceType = retroactiveInfo.traceType;
$("#content").append("<br><div>product.retroactiveInfo.traceType(追溯类型)"+
		"<div>traceType.id="+traceType.id+"</div>"+
		"<div>traceType.typeName="+traceType.typeName+"</div>"+
		"</div>");	
*/
</script>
</body>
</html>