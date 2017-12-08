<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>洋葱头溯源-注册公司</title>
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/cioclass/css/or.css">
</head>
<body>
<img class="bk" src="/cioclass/images/bk.jpg">
<div class="container">
	<div class="row clearfix">
		<div class="col-xs-12 column">
			<h3><img class="icon" src="/cioclass/images/pz.png">注册公司</h3>
			<form role="form" action="/cioclass/or/company/saveCompany" method="post">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#show" data-toggle="tab">展示项</a></li>
					<li><a href="#summary" data-toggle="tab">简介信息</a></li>
					<li><a href="#link" data-toggle="tab">联系信息</a></li>
					<li><a href="#remark" data-toggle="tab">备注项</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 展示项开始 -->
					<div class="tab-pane fade in active" id="show">
						<div class="form-group">
							<label for="enterpriseName">企业名称</label>
							<input id="enterpriseName" name="enterpriseName" type="text" required="required" class="form-control" placeholder="请输入企业名称，例如:洋葱头（厦门）信息科技有限公司">
							<span class="help-block">请输入企业名称，例如:洋葱头（厦门）信息科技有限公司</span>
						</div>
						<div class="form-group">
							<label for="abbreviation">企业简称</label>
							<input id="abbreviation" name="abbreviation" type="text" required="required" class="form-control" placeholder="请输入企业简称，例如:洋葱头信息科技">
							<span class="help-block">请输入企业简称，例如:洋葱头信息科技</span>
						</div>
						<div class="form-group">
							<label for="enterpriseCode">企业代码(四位字符)</label>
							<input id="enterpriseCode" name="enterpriseCode" type="text" required="required" size="4" maxlength="4" min="4" class="form-control" placeholder="请输入企业代码，例如:0592">
							<span class="help-block">请输入企业代码，例如:0592</span>
						</div>
						<div class="form-group">
							<label for="responsiblePerson">法人名称</label>
							<input id="responsiblePerson" name="responsiblePerson" type="text" required="required" class="form-control" placeholder="请输入法人名称，例如：张三丰">
							<span class="help-block">请输入法人名称，例如：张三丰</span>
						</div>
						<div class="form-group">
							<label for="region">所属地域</label>
							<input id="region" name="region" type="text" class="form-control" required="required" placeholder="请输入所属地域，例如：福建厦门">
							<span class="help-block">请输入所属地域，例如：福建厦门</span>
						</div>
						<div class="form-group">
							<label for="industry">所属行业</label>
							<input id="industry" name="industry" type="text" class="form-control" required="required" placeholder="请输入所属行业，例如：果蔬">
							<span class="help-block">请输入所属行业，例如：果蔬</span>
						</div>
						<div class="form-group">
							<label for="homeAgent">归属代理商(公司编号)</label>
							<input id="homeAgent" name="homeAgent" type="text" class="form-control" placeholder="请输入归属代理商">
							<span class="help-block">请输入归属代理商</span>
						</div>
						<div class="form-group">
							<label for="periodOfValidity">有效期</label>
							<input id="periodOfValidity" name="periodOfValidity" type="date" class="form-control" required="required" placeholder="请输入有效期">
							<span class="help-block">请点击右边图标选择有效期（务必是最新版浏览器）</span>
						</div>
						<div class="form-group">
							<label for="mainProduct">主营业务介绍</label>
							<textarea id="mainProduct" name="mainProduct" class="form-control" rows="4" placeholder="请输入主营业务介绍"></textarea>
							<span class="help-block">请输入主营业务介绍</span>
						</div>	
					</div>
					<!-- 展示项结束 -->
					<!-- 简介信息开始 -->
					<div class="tab-pane fade" id="summary">
						<div class="form-group">
							<label for="businessRegistrationNo">工商注册号</label>
							<input id="businessRegistrationNo" name="businessRegistrationNo" type="text" class="form-control" placeholder="请输入工商注册号">
							<span class="help-block">请输入工商注册号</span>
						</div>
						<div class="form-group">
							<label for="legalRepresentative">法定代表人</label>
							<input id="legalRepresentative" name="legalRepresentative" type="text" class="form-control" placeholder="请输入法定代表人，例如：张三丰">
							<span class="help-block">请输入法定代表人，例如：张三丰</span>
						</div>
						<div class="form-group">
							<label for="registeredCapital">注册资本(单位万元)</label>
							<input id="registeredCapital" name="registeredCapital" type="text" value="0" class="form-control" placeholder="请输入注册资本额，例如：200.00">
							<span class="help-block">请输入注册资本额，例如：200.00</span>
						</div>
						<div class="form-group">
							<label for="numberOfEmployees">员工总数(单位人)</label>
							<input id="numberOfEmployees" name="numberOfEmployees" type="number" value="0" class="form-control" placeholder="请输入员工总数">
							<span class="help-block">请输入员工总数</span>
						</div>
						<div class="form-group">
							<label for="areaCovered">占地面积(单位平方米)</label>
							<input id="areaCovered" name="areaCovered" type="text" value="0.0" class="form-control" placeholder="请输入公司占地面积">
							<span class="help-block">请输入公司占地面积</span>
						</div>
						<div class="form-group">
							<label for="summarys">简介</label>
							<textarea id="summarys" name="summary" class="form-control" rows="4" placeholder="请输入简介"></textarea>
							<span class="help-block">请输入简介</span>
						</div>
					</div>
					<!-- 简介信息结束 -->
					<!-- 联系信息开始 -->
					<div class="tab-pane fade" id="link">
						<div class="form-group">
							<label for="mobilePhone">联系电话</label>
							<input id="mobilePhone" name="mobilePhone" type="text" class="form-control" placeholder="请输入联系电话，例如：18012345678">
							<span class="help-block">请输入联系电话，例如：18012345678</span>
						</div>
						<div class="form-group">
							<label for="email">公司联系邮箱</label>
							<input id="email" name="email" type="text" class="form-control" placeholder="请输入公司联系邮箱">
							<span class="help-block">请输入公司联系邮箱</span>
						</div>
						<div class="form-group">
							<label for="zipCode">邮编</label>
							<input id="zipCode" name="zipCode" type="text" class="form-control" placeholder="请输入邮编">
							<span class="help-block">请输入邮编</span>
						</div>
						<div class="form-group">
							<label for="mailingAddress">邮寄地址</label>
							<input id="mailingAddress" name="mailingAddress" type="text" class="form-control" placeholder="请输入邮寄地址">
							<span class="help-block">请输入邮寄地址</span>
						</div>
					</div>
					<!-- 联系信息结束 -->
					<!-- 备注项开始 -->
					<div class="tab-pane fade" id="remark">
						<div class="form-group">
							<label for="remarks">备注</label>
							<textarea id="remarks" name="remark" class="form-control" rows="4" placeholder="请输入备注"></textarea>
							<span class="help-block">请输入备注</span>
						</div>
						<button type="button" class="btn btn-default" onclick="javascript:history.go(-1);">返回</button>
						<button type="submit" class="btn btn-primary">提交</button>
					</div>
					<!-- 备注项结束 -->
				</div>
			</form>
			<br><br><br><br>
			<div class="cp">洋葱头(厦门）信息科技有限公司 版权所有<br>全国咨询热线：<a href="tel:400-1122-661">400-1122-661</a></div>
		</div>
	</div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
</body>
</html> 