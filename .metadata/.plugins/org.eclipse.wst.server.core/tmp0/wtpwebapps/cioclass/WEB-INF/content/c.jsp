<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>溯源系统标签生成器</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
<script type="text/javascript" src="http://static.runoob.com/assets/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="http://static.runoob.com/assets/qrcode/qrcode.min.js"></script>
<style>
.qrcode{float:left;margin:10px;}
.qrcode span{padding-bottom:10px;word-break:normal;width:auto;display:block;white-space:pre-wrap;word-wrap:break-word;overflow:hidden;}
</style>
</head>
<body>
<input id="text" type="text" value="2444123456"/><br />
<!-- <input type="hidden" id="page" name="page" value="http://cioclass.com:8090/cioclass/or/?s="/>
 -->
<input type="hidden" id="page" name="page" value="${pageContext.request.contextPath}/or/?s="/>

<button id="btn" onclick="print_paper()">打印</button>
<div id="qr"></div>
<script type="text/javascript">
var pageName=document.getElementById("page").value;
//中文编码格式转换
function utf16to8(str) {
	var out, i, len, c;
	out = "";
	len = str.length;
	for (i = 0; i < len; i++) {
		c = str.charCodeAt(i);
		if ((c >= 0x0001) && (c <= 0x007F)) {
			out += str.charAt(i);
		} else if (c > 0x07FF) {
			out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
			out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
			out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
		} else {
			out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
			out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
		}
	}
	return out;
}

function cq(id,content){
	var str = utf16to8(pageName+content);
	new QRCode(document.getElementById(id), {
		width : 100,
		height : 100
	}).makeCode(str);
}

function makeCode () {		
	var elText = document.getElementById("text");
	$("#qr").html("");
	if (!elText.value) {
		elText.focus();
		return;
	}else{
		var arry = elText.value.split(',');
		$.each(arry,function(index,value){
			if(!value=='')
			$("#qr").append("<div class=\"qrcode\"><div id=\"qrcode_"+index+value+"\"></div><span>"+value+"</span></div>");
			else{
			$("#qr").append("<div class=\"qrcode\"><div id=\"qrcode_"+index+value+"\" class=\"qrbody\"></div><span>null</span></div>");
			}
			cq("qrcode_"+index+value,value);
		});
	}
}
$("#text").on("blur", function () {
	makeCode();
	}).on("keydown", function (e) {
		if (e.keyCode == 13) {
			makeCode();
		}
});
function print_paper(){
	$("#text").css("display","none");
	$("#btn").css("display","none");
	window.print();
}
makeCode();
/**
$(function(){
	makeCode();
	print_paper();
});**/
</script>
</body>
</html>