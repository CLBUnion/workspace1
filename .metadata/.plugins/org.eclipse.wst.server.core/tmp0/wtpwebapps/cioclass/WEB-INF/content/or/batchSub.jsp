<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>子批号查询</title>
</head>
<body>
<div id="content"></div>
<div id="batchInfoId">${id}</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var batchInfoId=$("#batchInfoId").html();
getJson("or/batchSub/"+batchInfoId+"/");
$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");
var result = msg.result;
$.each(msg.result,function(index,tr){
	$("#content").append("<li>batchSub<span>");
	$("#content").append("tr.id="+tr.id+"<br>"+"");
	$("#content").append("tr.code="+tr.code+"<br>"+"");
	$("#content").append("tr.status="+tr.status+"<br>"+"");
	$("#content").append("</span></li>");
});
</script>
</body>
</html>