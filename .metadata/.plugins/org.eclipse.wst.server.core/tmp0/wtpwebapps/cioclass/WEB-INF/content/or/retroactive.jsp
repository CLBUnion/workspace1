<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品追溯信息-洋葱头溯源系统</title>
</head>
<body>
<div id="content"></div>
<div id="productId">${id}</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var productId=$("#productId").html();
getJson("or/product/findRIByPID?id="+productId);
$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");
var retroactive=msg.result;
$("#content").append("<br>retroactive.id="+retroactive.id+"<br>"+"");
$("#content").append("retroactive.content="+retroactive.content+"<br>"+"");
$("#content").append("retroactive.typeName="+retroactive.traceType.typeName+"<br>"+"");
</script>
</body>
</html>