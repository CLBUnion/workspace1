<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>公司具体信息</title>
</head>
<body>
<div id="content"></div>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
	getJson("or/batchInfo/findCompanysByBatchNumber?batchNumber=123456");
	$("#content").html("<span>msg.code="+msg.code+" msg.msg="+msg.msg+"</span>");
	$("#content").append("<ul>");
	$.each(msg.result,function(index,tr){
		$("#content").append("<li><span>");
		$("#content").append("tr.id="+tr.id+"<br>"+
			    "tr.abbreviation="+tr.abbreviation+"<br>"+
			    "tr.area_covered="+tr.areaCovered+"<br>"+
			    "tr.business_registration_no="+tr.businessRegistrationNo+"<br>"+
			    "tr.date_of_application="+tr.dateOfApplication+"<br>"+
			    "tr.email="+tr.email+"<br>"+
			    "tr.enterprise_code="+tr.enterpriseCode+"<br>"+
			    "tr.enterprise_name="+tr.enterpriseName+"<br>"+
			    "tr.home_agent="+tr.homeAgent+"<br>"+
			    "tr.industry="+tr.industry+"<br>"+
			    "tr.legal_representative="+tr.legalRepresentative+"<br>"+
			    "tr.mailing_address="+tr.mailingAddress+"<br>"+
			    "tr.main_product="+tr.mainProduct+"<br>"+
			    "tr.mobile_phone="+tr.mobilePhone+"<br>"+
			    "tr.number_of_employees="+tr.numberOfEmployees+"<br>"+
			    "tr.period_of_validity="+tr.periodOfValidity+"<br>"+
			    "tr.region="+tr.region+"<br>"+
			    "tr.registered_capital="+tr.registeredCapital+"<br>"+
			    "tr.remark="+tr.remark+"<br>"+
			    "tr.responsible_person="+tr.responsiblePerson+"<br>"+
			    "tr.summary="+tr.summary+"<br>"+
			    "tr.zip_code="+tr.zipCode);
		$("#content").append("</span></li>");
	});
	$("#content").append("</ul>");
</script>
</body>
</html>