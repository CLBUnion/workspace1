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
    <style>
        .form-control{display:inline;text-align: left;}
    </style>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<img class="bk" src="${pageContext.request.contextPath}/images/bk.jpg">
<div class="container">
    <div class="row clearfix">
        <div class="col-xs-12 column">
            <h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">基本状况</h3>
            <form role="form" action="javaScript:void(0);">
                    <div class="tab-pane fade in active" id="show">
                        <div id="questions"></div>
                        <button type="reset" class="btn btn-default">重置</button>
                        <button type="submit" class="btn btn-primary" onclick="addAttrValue();">选择</button>
                    </div>
            </form>
        </div>
    </div>
</div>
<%@include file="../xx/examModal.jsp" %>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
	var msg = null;
    var data = [{"question":"1","questionDesc":"是否需要生产","item":[{"itemDesc":"需要生产","itemValue":"1"},{"itemDesc":"不需要生产","itemValue":"0"}]}];
    
    $(function(){
        render_modal("#question-template",data,"#questions");
    	/* $.getJSON(config.serverIp+"xx/questionItem/getQuestionById",{"id":1},function(data){
    		msg = $.parseJSON(data);
    		if( msg.code=="0"&& msg.msg=="OK"){
    			render_modal("#question-template1",msg.result,"#pages");
    		}else{
    			console.log(msg.msg);
    		}
    	}); */
    });
    
    function addAttrValue(){
    	if($("input[name='1']")[0].checked){
    		location.href=config.serverIp+"xx/xxIndex";
    	}else{
    		location.href=config.serverIp+"xx/xxIndex1";
    	}
    }
</script>
</body>
</html>