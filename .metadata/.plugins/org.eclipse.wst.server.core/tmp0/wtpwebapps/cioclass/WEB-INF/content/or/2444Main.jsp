<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头溯源-品质 品牌 品位</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-sm-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">品质溯源</h3>
			<div class="info-group">
				<div><b>品名：</b>${result.productName}</div>
				<div><b>规格：</b>${result.spec}</div>
				<div><b>生产厂商（原产地）：</b>${result.abbreviation}（${result.sourceArea}）</div>
				<div><b>批次编号：</b>${result.batchNumber}</div>
				<div><b>出厂日期：</b>${result.dateOfManufacture}</div>
				<div><b>保质期：</b>${result.termOfValidity}</div>
				<div><b>检验证号：</b>
				<c:forEach var="id" items="${result.inspectionIds}">
			    	<a href="inspection/info?id=${id}" target="_blank">SN0000${id}</a>&nbsp;&nbsp;
				</c:forEach>
				</div>
			</div>
			<h3><img class="icon" src="/cioclass/images/pp.png"><a href="searchBrand?cid=${result.companyId}&pid=${result.productId}" target="_blank">品牌溯源</a></h3>
			<h3><img class="icon" src="/cioclass/images/video.png"><a href="video" target="_blank">视频溯源</a></h3>
			<div class="cp">洋葱头(厦门）信息科技有限公司 版权所有<br>全国咨询热线：<a href="tel:400-1122-661">400-1122-661</a></div>
		</div>
	</div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html> 
