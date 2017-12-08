<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>添加商品分类</title>
<link rel="stylesheet" href="../statics/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">添加商品分类</h3>
			<form role="form" action="#" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#base" data-toggle="tab">基础信息</a></li>
					<li><a href="#props" data-toggle="tab">类别属性</a></li>
					<li><a href="#other" data-toggle="tab">备注</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基础信息开始 -->
					<div class="tab-pane fade in active" id="base">
						<div class="form-group">
							<label for="catalogName">类别名称</label>
							<input id="catalogName" type="text" class="form-control" placeholder="请输入类别名称，例如：正航软件">
							<span class="help-block">请输入类别名称，例如：正航软件</span>
						</div>
						<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					<!-- 基础信息结束 -->
					<!-- 类别属性开始 -->
					<div class="tab-pane fade" id="props">
					</div>
					<!-- 类别属性结束 -->
					<!-- 备注开始 -->
					<div class="tab-pane fade" id="other">
						<div class="form-group">
							<label for="remark">备注</label>
							<textarea name="remark" id="remark" class="form-control" rows="4" placeholder="请输入备注"></textarea>
							<span class="help-block">请输入备注</span>
						</div>
					</div>
					<!-- 备注结束 -->
				</div>
			</form>
		</div>
	</div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html>