<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>批号信息</title>
</head>
<body>
<div>
<br><br>
<a href="retroactiveInfoList?id=${id}" target="_blank">批号追溯信息</a>&nbsp;&nbsp;
<a href="processLog?id=${id}" target="_blank">过程日志详细信息</a>&nbsp;&nbsp;
<a href="product?id=${id}" target="_blank">产品基础资料</a>&nbsp;&nbsp;
<a href="batchSub?id=${id}" target="_blank">子批号详细信息</a>&nbsp;&nbsp;
</div>
<div id="content"></div>
<div id="batchInfoId">${id}</div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var batchInfoId=$("#batchInfoId").html();
getJson("or/batchInfo/"+batchInfoId+"/");
$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");

var result = msg.result;
$("#content").append("<div>batchInfo.id="+result.id+"</div>");
$("#content").append("<div>batchInfo.batchNumber="+result.batchNumber+"</div>");
$("#content").append("<div>batchInfo.recallStatus="+result.recallStatus+"</div>");
$("#content").append("<div>batchInfo.dateOfManufacture="+result.dateOfManufacture+"</div>");
/*
var product = result.product;
$("#content").append("<br><div>batchInfo.product(产品信息)"+
		"<div>product.id="+product.id+"</div>"+
		"<div>product.productCode="+product.productCode+"</div>"+
		"<div>product.productName="+product.productName+"</div>"+
		"</div>");

$("#content").append("<br>batchInfo.inspectionInfo(检验信息)<ul>");
$.each(msg.result.inspectionInfoIds,function(index,tr){
	$("#content").append("<li><span>");
	$("#content").append("tr.id="+tr[0]+"<br>"+"");
	$("#content").append("tr.censorate="+tr[1]+"<br>"+"");
	$("#content").append("tr.result="+tr[2]+"<br>"+"");
	$("#content").append("tr.suggestion="+tr[3]+"<br>"+"");
	$("#content").append("tr.remark="+tr[4]+"<br>"+"");
	$("#content").append("</span></li>");
});
$("#content").append("</ul>");

$("#content").append("<br>batchInfo.processLog(过程日志)<ul>");
$.each(msg.result.processLogIds,function(index,tr){
	$("#content").append("<li><span>");
	$("#content").append("tr.id="+tr[0]+"<br>"+"");
	$("#content").append("tr.content="+tr[1]+"<br>"+"");
	$("#content").append("tr.tache_date="+tr[2]+"<br>"+"");
	$("#content").append("tr.tache_name="+tr[3]+"<br>"+"");
	$("#content").append("tr.tache_no="+tr[4]+"<br>"+"");
	$("#content").append("</span></li>");
});
$("#content").append("</ul>");

$("#content").append("<br>batchInfo.retroactiveInfo(追溯信息)<ul>");
$.each(msg.result.retroactiveInfoIds,function(index,tr){
	$("#content").append("<li><span>");
	$("#content").append("tr.id="+tr[0]+"<br>"+"");
	$("#content").append("tr.content="+tr[1]+"<br>"+"");
	$("#content").append("tr.trace_type="+tr[2]+"<br>"+"");
	$("#content").append("</span></li>");
});
$("#content").append("</ul>");
*/
</script>
</body>
</html>