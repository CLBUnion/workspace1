<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头溯源-增加追溯信息</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">增加追溯信息</h3>
			<form role="form" action="#" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#base" data-toggle="tab">基础信息</a></li>
					<li><a href="#batchInfo" data-toggle="tab">批次信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基础信息开始 -->
					<div class="tab-pane fade in active" id="base">
						<div class="form-group">
							<label for="content">主要内容</label>
							<input id="content" type="text" class="form-control" required="required" placeholder="请输入主要内容">
							<span class="help-block">请输入主要内容</span>
						</div>
						<div class="form-group">
							<label for="traceType_id">追溯类别</label>
							<select class="form-control" name="traceType_id">
								<option value="类别1">类别1</option>
								<option value="类别2">类别2</option>
								<option value="类别3">类别3</option>
								<option value="类别4">类别4</option>
								<option value="类别5">类别5</option>
							</select>
							<span class="help-block">请选择追溯类别</span>
						</div>
						<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					<!-- 基础信息结束 -->
					<!-- 批次信息开始 -->
					<div class="tab-pane fade" id="batchInfo">
					</div>
					<!-- 批次信息结束 -->
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