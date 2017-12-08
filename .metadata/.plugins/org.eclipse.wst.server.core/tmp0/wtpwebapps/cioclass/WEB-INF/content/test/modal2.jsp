<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模态窗取值</title>
<link href="https://cdn.bootcss.com/bootstrap/3.0.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="default">  
	<p id="c1">姓名</p>
	<p id="c2">手机</p>
	<p id="c3">地址</p>
</div>
<input type="button" class="btn upd" value="修改" data-toggle="modal" data-target="#addressModal" 
	onclick="editAddress(1,this)">
	<!-- 主要就是点击这个button弹出模态框，让div中的参数传递到模态框中。 -->
<!--修改地址弹出层-->  
<div class="modal fade" id="addressModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">  
	<form id="saveAddForm" action="javaScript:show(this);" method="get">
		<input type="hidden" name="id" value="" id="rid"/>
		<div class="modal-header">  
			<h3 id="myModalLabel">修改信息</h3>  
		</div>
		<div class="modal-body">
			<div class="row">
			    <div class="lable"><b>*</b>姓名</div>
			    <div class="input">  
			        <input type="text" name="consignee" id="con" value="" placeholder="姓名"/>  
			    </div>
			</div><br>
			<div class="row">  
			    <div class="lable"><b>*</b>手机</div>  
			    <div class="input">  
			        <input type="text" name="phone" id="pho" value="" placeholder="手机" />  
			    </div>  
			</div><br> 
			<div class="row">  
			    <div class="lable"><b>*</b>地址</div>  
			    <div class="input">  
			        <input type="text" name="address" id="add" value="" placeholder="地址"/>  
			    </div>
			</div><br>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal" id="close_modal">关闭</button>  
		    <button type="submit" class="btn btn-primary">保存</button>  
		</div>
	</form>
</div>
<!--弹出层结束-->
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
//模态框传值  
function editAddress(id,obj){
	$("#rid").val(id);
	
	var consignee =$("#c1").text();
	$("#con").val(consignee);
	
	var mob=$("#c2").text();
	$("#pho").val(mob);
	
	var addr=$("#c3").text();
	$("#add").val(addr);
}

function show(obj){
	$("#c1").text($("#con").val());
	$("#c2").text($("#pho").val());
	$("#c3").text($("#add").val());
	$("#close_modal").click();
}

</script>
</body>
</html>