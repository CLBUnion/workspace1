<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头溯源-增加检验信息</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">增加检验信息</h3>
			<form role="form" action="#" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#base" data-toggle="tab">基础信息</a></li>
					<li><a href="#batchInfo" data-toggle="tab">批次信息</a></li>
					<li><a href="#remark" data-toggle="tab">备注信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基础信息开始 -->
					<div class="tab-pane fade in active" id="base">
						<div class="form-group">
							<label for="censorate">检查机构名称</label>
							<input id="censorate" type="text" class="form-control" required="required" placeholder="请输入检查机构名称">
							<span class="help-block">请输入检查机构名称</span>
						</div>
						<div class="form-group">
							<label for="result">检验结果</label>
							<input id="result" type="text" class="form-control" required="required" placeholder="请输入检验结果">
							<span class="help-block">请输入检验结果</span>
						</div>
						<div class="form-group">
							<label for="suggestion">检查意见</label>
							<input id="suggestion" type="text" class="form-control" placeholder="请输入检查意见">
							<span class="help-block">请输入检查意见</span>
						</div>
						<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					<!-- 基础信息结束 -->
					<!-- 批次信息开始 -->
					<div class="tab-pane fade" id="batchInfo">
					</div>
					<!-- 批次信息结束 -->
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