<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>厦门企盟动力</title>
</head>
<body>
<h1>批号信息</h1>
${batchInfo}<br>
${batchInfo.id}<br>
${batchInfo.product}<br>
${batchInfo.batchNumber}<br>
${batchInfo.dateOfManufacture}<br>
${batchInfo.recallStatus}<br>
<a href="batchInfo?id=${batchInfo.id}" target="_blank">批号详细信息</a>&nbsp;&nbsp;
<hr>
<h1>企业信息</h1>
${company}<br>
${company.id}<br>
${company.enterpriseCode}<br>
${company.enterpriseName}<br>
${company.abbreviation}<br>
${company.responsiblePerson}<br>
${company.mobilePhone}<br>
${company.region}<br>
${company.industry}<br>
${company.mainProduct}<br>
${company.businessRegistrationNo}<br>
${company.legalRepresentative}<br>
${company.registeredCapital}<br>
${company.numberOfEmployees}<br>
${company.areaCovered}<br>
${company.email}<br>
${company.mailingAddress}<br>
${company.zipCode}<br>
${company.homeAgent}<br>
${company.periodOfValidity}<br>
${company.dateOfApplication}<br>
${company.remark}<br>
${company.summary}<br>
</body>
</html>