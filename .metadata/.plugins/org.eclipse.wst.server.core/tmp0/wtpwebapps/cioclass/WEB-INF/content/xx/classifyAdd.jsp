<%@ page language="java" pageEncoding="UTF-8"%>
<%--
  ~ Copyright (c) 2017.  by 洋葱头信息科技有限公司
  --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>增加类别</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/or.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<img class="bk" src="${pageContext.request.contextPath}/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">增加类别</h3>
			<form role="form" action="javaScript:addClassifyValue()" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#show" data-toggle="tab">基本信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基本信息开始 -->
					<div class="tab-pane fade in active" id="show">
						<div class="form-group">
							<label for="name">类别名称</label>
							<input id="name" name="name" type="text" required="required" class="form-control" placeholder="请输入类别名称，如ERP软件">
							<span class="help-block">请输入类别名称，如ERP软件</span>
						</div>

                        <button type="reset" class="btn btn-default">重置</button>
                        <button type="submit" class="btn btn-primary">添加</button>
					</div>
					<!-- 基本信息结束 -->
				</div>
			</form>
		</div>
	</div>
</div>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>
    function addClassifyValue(){
        var name = $("#name").val();
        $.post(config.serverIp+"xx/classify/add",{"name":name},function(data){
            msg = $.parseJSON(data);
            if( msg.code==="0"&& msg.msg==="OK"){
                console.log(msg);
                alert("添加成功");
            }else{
                console.log(msg.msg);
                alert("添加失败");
            }
        });
    }
</script>
</body>
</html>