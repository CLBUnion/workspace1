<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>夏商禽业 溯源系统</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/or.css">
</head>
<body>
<img class="bk" src="${pageContext.request.contextPath}/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">增加产品信息</h3>
			<form role="form" action="${pageContext.request.contextPath}/admin/or" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#base" data-toggle="tab">基础信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基础信息开始 -->
					<div class="tab-pane fade in active" id="base">
						<div class="form-group">
							<label for="num">生产数量*</label>
							<input id="num" type="number" name="num" max=10000 min=1 class="form-control" required="required" placeholder="请输入数量，例如：5000">
							<span class="help-block">请输入数量，例如：5000</span>
						</div>
						<div class="form-group">
							<label for="batchNo">批号代码*</label>
							<input id="batchNo" type="text" name="batchNo" size="6" maxlength="6" class="form-control" required="required" placeholder="请输入批号代码，例如：123456">
							<span class="help-block">请输入批号代码，例如：123456</span>
						</div>
						<button type="submit" class="btn btn-primary">提交申请打印</button>
						<button type="button" class="btn">前往获取文件</button>
					</div>
					<!-- 基础信息结束 -->
					<div class="message">${message}</div>
				</div>
			</form>
			<br><br><br><br>
			<div class="cp">洋葱头(厦门)信息科技有限公司 版权所有<br>全国咨询热线：<a href="tel:400-1122-661">400-1122-661</a></div>
		</div>
	</div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script>


</script>
</body>
</html>