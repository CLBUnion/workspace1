<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>资讯信息列表</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
<style type="text/css">
th{background-color:#ddd;}
.h:nth-child(2n){background-color:#eee;}
.h:hover{background-color:#888;color:#fff;font-weight:700;}
.h:hover a{color:#fff;}
</style>
</head>
<body>
<input name="url" id="url" placeholder="输入正确的网址:http://开头">
<button onclick="javaScript:find();">招标网</button>
http://www.sina.com.cn
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
function find(){
	var url = $("#url").val();
	if(url===null || ""===url){
		alert("请填写正确网址");
		return ;
	}else{
		$.getJSON(config.serverIp+"zx/searchLinks",{"url":url},function(data){
			msg = $.parseJSON(data);
			if( msg.code=="0"&& msg.msg=="OK"){
				get(1);
			}else{
				alert("爬取失败");
			}
		});
	}
}
</script>
</body>
</html>