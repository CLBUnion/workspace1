<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>溯源系统-洋葱头</title>
</head>
<body>
<h3>品质溯源</h3>
<ul>
	<li>品名：${batchInfo.product.productName}</li>
	<li>规格：${batchInfo.product.spec}</li>
	<li>生产厂商（原产地）：${company.abbreviation}（${batchInfo.product.sourceArea}）</li>
	<li>出厂日期：${batchInfo.dateOfManufacture}</li>
	<li>保质期：${batchInfo.product.termOfValidity}</li>
	<li>检验证号：<a href="inspection?id=${batchInfo.id}" target="_blank">SN123456</a>&nbsp;&nbsp;</li>
</ul>
<h3><a href="brand" target="_blank">品牌溯源</a></h3>
<h3><a href="video" target="_blank">视频溯源</a></h3>

<%-- 
<h1>批号信息</h1>
${batchInfo.id}<br>
${batchInfo.product}<br>
<a href="batchInfo?id=${batchInfo.id}" target="_blank">批号详细信息</a>&nbsp;&nbsp;
<hr>
<h1>企业信息</h1>
${company}<br>
${company.id}<br>
</body>
</html> 
--%>