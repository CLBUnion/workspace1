<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
  ~ Copyright (c) 2017.  by 洋葱头信息科技有限公司
  --%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>基本选型</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/or.css">
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<img class="bk" src="${pageContext.request.contextPath}/images/bk.jpg">
<div class="container">
    <div class="row clearfix">
        <div class="col-xs-12 column">
            <h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">基本条件</h3>
            <form role="form" action="javaScript:void(0);">
                <div class="tab-pane fade in active" id="show">
                    <div class="form-group">
                        <label for="name">物件名称</label>
                        <input id="name" type="number" required="required" class="form-control" placeholder="请输入物件名称">
                        <span class="help-block">请输入物件名称</span>
                    </div>
                    <div class="form-group">
                        <label for="pid">父物件编号</label>
                        <input id="pid" type="number" required="required" class="form-control" placeholder="请输入父物件编号">
                        <span class="help-block">请输入父物件编号</span>
                    </div>
                    <button type="reset" class="btn btn-default">重置</button>
                    <button type="submit" class="btn btn-primary" onclick="addAttrValue();">添加</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../xx/attributeValueModel.jsp" %>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">

</script>
</body>
</html>