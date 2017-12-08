<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头溯源-增加产品信息</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">增加产品信息</h3>
			<form role="form" action="#" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#base" data-toggle="tab">基础信息</a></li>
					<li><a href="#retroactiveInfo" data-toggle="tab">追溯信息</a></li>
					<li><a href="#remark" data-toggle="tab">备注信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基础信息开始 -->
					<div class="tab-pane fade in active" id="base">
						<div class="form-group">
							<label for="productCode">产品代码</label>
							<input id="productCode" type="text" class="form-control" required="required" placeholder="请输入产品代码，例如：1456">
							<span class="help-block">请输入产品代码，必填，唯一</span>
						</div>
						<div class="form-group">
							<label for="productName">产品名称</label>
							<input id="productName" type="text" class="form-control" required="required" placeholder="请输入产品名称">
							<span class="help-block">请输入产品名称，必填</span>
						</div>
						<div class="form-group">
							<label for="spec">规格型号</label>
							<input id="spec" type="text" class="form-control" placeholder="请输入规格型号">
							<span class="help-block">请输入规格型号</span>
						</div>
						<div class="form-group">
							<label for="sourceArea">原产地</label>
							<input id="sourceArea" type="text" class="form-control" placeholder="请输入原产地">
							<span class="help-block">请输入原产地</span>
						</div>
						<div class="form-group">
							<label for="termOfValidity">保质期/有效期(文字描述)</label>
							<input id="termOfValidity" type="text" class="form-control" placeholder="请输入保质期/有效期(文字描述)">
							<span class="help-block">请输入保质期/有效期(文字描述)</span>
						</div>
						<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					<!-- 基础信息结束 -->
					<!-- 追溯信息开始 -->
					<div class="tab-pane fade" id="retroactiveInfo">
					</div>
					<!-- 追溯信息结束 -->
					<!-- 备注信息开始 -->
					<div class="tab-pane fade" id="remark">
						<div class="form-group">
							<label for="remark">备注</label>
							<textarea id="remark" class="form-control" rows="4" placeholder="请输入备注"></textarea>
							<span class="help-block">请输入备注</span>
						</div>
					</div>
					<!-- 备注信息结束 -->
				</div>
			</form>
			<br><br><br><br>
			<div class="cp">洋葱头(厦门）信息科技有限公司 版权所有<br>全国咨询热线：<a href="tel:400-1122-661">400-1122-661</a></div>
		</div>
	</div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>