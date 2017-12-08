<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>检验信息列表-洋葱头溯源系统</title>
</head>
<body>
<div id="content"></div>
<div id="batchInfoId">${id}</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var batchInfoId=$("#batchInfoId").html();
getJson("or/inspection/"+batchInfoId+"/");
$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");

$("#content").append("<br>检验信息<ul>");
$.each(msg.result,function(index,tr){
	$("#content").append("<li><span>");
	$("#content").append("tr.id="+tr.id+"<br>"+"");
	$("#content").append("tr.censorate="+tr.censorate+"<br>"+"");
	$("#content").append("tr.suggestion="+tr.suggestion+"<br>"+"");
	$("#content").append("tr.remark="+tr.remark+"<br>"+"");
	$("#content").append("</span></li>");
	$("#content").append("<img src=\"../images/"+tr.result+"\">"+"");
});
$("#content").append("</ul>");
</script>
</body>
</html>