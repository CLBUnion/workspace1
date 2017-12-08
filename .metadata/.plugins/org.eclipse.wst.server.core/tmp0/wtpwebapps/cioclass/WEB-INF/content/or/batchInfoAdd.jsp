<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头溯源-增加批次信息</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">增加批次信息</h3>
			<form role="form" action="/cioclass/or/batchInfo/add" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#base" data-toggle="tab">基础信息</a></li>
					<li><a href="#product" data-toggle="tab">产品信息</a></li>
					<li><a href="#retroactiveInfo" data-toggle="tab">追溯信息</a></li>
					<li><a href="#processLog" data-toggle="tab">过程日志</a></li>
					<li><a href="#inspectionInfo" data-toggle="tab">检验信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基础信息开始 -->
					<div class="tab-pane fade in active" id="base">
						<div class="form-group">
							<label for="batchNumber">批次编号</label>
							<input id="batchNumber" name="batchNumber" type="text" size="6" max="6" min="6" class="form-control" placeholder="请输入批次编号，例如：123456">
							<span class="help-block">请输入批次编号，例如：123456</span>
						</div>
						<div class="form-group">
							<label for="dateOfManufacture">生产日期</label>
							<input id="dateOfManufacture" type="text" class="form-control" placeholder="请输入生产日期，例如：2017-08-09">
							<span class="help-block">请输入生产日期，例如：2017-08-09</span>
						</div>
						<div class="form-group">
							<label for="recallStatus">召回状态</label>
							<input id="recallStatus" type="text" class="form-control" placeholder="请输入召回状态">
							<span class="help-block">请输入召回状态</span>
						</div>
						<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					<!-- 基础信息结束 -->
					<!-- 产品信息开始 -->
					<div class="tab-pane fade" id="product">
					</div>
					<!-- 产品信息结束 -->
					<!-- 追溯信息开始 -->
					<div class="tab-pane fade" id="retroactiveInfo">
					</div>
					<!-- 追溯信息结束 -->
					<!-- 过程日志开始 -->
					<div class="tab-pane fade" id="processLog">
					</div>
					<!-- 过程日志结束 -->
					<!-- 检验信息开始 -->
					<div class="tab-pane fade" id="inspectionInfo">
					</div>
					<!-- 检验信息结束 -->
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