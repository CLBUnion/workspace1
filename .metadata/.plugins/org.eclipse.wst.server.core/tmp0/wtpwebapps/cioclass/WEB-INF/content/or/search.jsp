<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>溯源系统-搜索</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
<style>
.input-group{width:40%;min-width:200px;margin:0 auto;padding-top:20%;}
</style>
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="input-group">
    <input type="text" class="form-control input-lg" id="s" name="s" value="2444123456">
    <span class="input-group-addon btn btn-primary" onclick="javascript:search()">搜索</span>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/cioclass/js/common.js"></script>
<script type="text/javascript">
	function search(){
		window.location.href=config.serverIp+"or/?s="+$("#s").val();
		//window.location.href="#or/?s="+$("#s").val();
		//console.log($("#s").val());
		//console.log(config.serverIp+"or/?s="+$("#s").val());
	}
</script>
</body>
</html>