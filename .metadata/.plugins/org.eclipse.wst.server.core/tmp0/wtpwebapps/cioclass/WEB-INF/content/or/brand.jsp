<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>品牌溯源-洋葱头溯源系统</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
<style type="text/css">
.remark{max-width:100%;min-width: 100%}
</style>
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-sm-12 column">
			<h3>公司信息</h3>
			<div class="info-group">
				<div><b>公司全称：</b>${company.enterpriseName}</div>
				<div><b>公司简称：</b>${company.abbreviation}</div>
			</div>
			<div id="company_desc">${company.summary}</div>
			<h3>产品信息</h3>
			<div class="info-group">
				<%-- <div><b>产品编号：</b>${product.productCode}</div>
				<div><b>产品名称：</b>${product.productName}</div>
				<div><b>规格型号：</b>${product.spec}</div>
				<div><b>原产地：</b>${product.sourceArea}</div>
				<div><b>保质期：</b>${product.termOfValidity}</div> --%>
				<div><img class="remark" src="/cioclass/images/${product.remark}"></div>
			</div>
			<ul class="list-group"></ul>
			<div class="cp">洋葱头(厦门）信息科技有限公司 版权所有<br>全国咨询热线：<a href="tel:400-1122-661">400-1122-661</a></div>
		</div>
	</div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html> 