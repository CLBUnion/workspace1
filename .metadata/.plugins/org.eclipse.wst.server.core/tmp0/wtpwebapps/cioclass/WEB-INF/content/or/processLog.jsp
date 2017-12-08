<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>过程日志信息-洋葱头溯源系统</title>
</head>
<body>
<div id="content"></div>
<div id="batchInfoId">${id}</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var batchInfoId=$("#batchInfoId").html();
getJson("or/batchInfo/findLogById?batchInfoId="+batchInfoId);
$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");
$.each(msg.result,function(index,tr){
	$("#content").append("<li><span>");
	$("#content").append("tr.id="+tr.id+"<br>"+"");
	$("#content").append("tr.content="+tr.content+"<br>"+"");
	$("#content").append("tr.tacheDate="+tr.tacheDate+"<br>"+"");
	$("#content").append("tr.tacheName="+tr.tacheName+"<br>"+"");
	$("#content").append("tr.tacheNo="+tr.tacheNo+"<br>"+"");
	$("#content").append("</span></li>");
});
</script>
</body>
</html>