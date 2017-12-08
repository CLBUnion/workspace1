<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>物件属性值关系修改</title>
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
			<h3><img class="icon" src="${pageContext.request.contextPath}/images/pz.png">物件属性值关系修改</h3>
			<form role="form" action="javaScript:void(0);">
				<ul id="myTab" class="nav nav-tabs">
					<li class="active"><a href="#show" data-toggle="tab">基本信息</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<!-- 基本信息开始 -->
					<div class="tab-pane fade in active" id="show">
						<div class="form-group">
							<label for="classify_id">分类编号</label>
							<input id="classify_id" type="number" required="required" class="form-control" placeholder="请输入分类编号" data-toggle="modal" data-target="#classifyModal">
							<span class="help-block">请输入分类编号</span>
						</div>
						<div class="form-group">
							<label for="resId">物件编号</label>
							<input id="resId" type="number" required="required" class="form-control" placeholder="请输入物件编号" data-toggle="modal" data-target="#resModal">
							<span class="help-block">请输入物件编号</span>
						</div>
					</div>
					<!-- 基本信息结束 -->
				</div>
			</form>
			<!-- 分类模态窗展示区 -->
			<div id="getClassify"></div>
			<!-- 物件模态窗展示区 -->
			<div id="getRes"></div>
			<!-- 属性模态窗展示区 -->
			<div id="getAttr"></div>
		</div>
		<div class="col-xs-6 column">
			<div id="already_select"></div>
		</div>
		<div class="col-xs-6 column">
			<div id="can_select"></div>
		</div>
		<div class="col-xs-12 column">
			<button type="button" class="btn btn-default" onclick="getAttrs();">载入属性</button>
		</div>
	</div>
</div>
<%@include file="../xx/attributeValueModel.jsp" %>
<%@include file="../xx/resAttributeRelationModal.jsp" %>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script type="text/javascript">
var data = null;
var cid=-1;
var rid=-1;
function readValue(){
    cid=$("#classify_id").val()===""?-1:parseInt($("#classify_id").val());
    rid=$("#resId").val()===""?-1:parseInt($("#resId").val());
    if(cid==-1){
        alert("请选择类别！");
        return false;
    }
    if(rid==-1){
        alert("请选择物件！");
        return false;
    }
    if(cid!=-1 && rid!= -1){
        return true;
	}else{
		return false;
	}
}
$(function(){
	/*分类模态窗*/
	$.getJSON(config.serverIp+"xx/modal/classifyModal",function(r){
		data = $.parseJSON(r);
		if( data.code==="0"&& data.msg==="OK"){
			render_modal("#getValue-template",data.result,"#getClassify");
		}else{
			console.log(data.msg);
		}
	});
	/*物件模态窗*/
	$.getJSON(config.serverIp+"xx/modal/resModal",function(r){
		data = $.parseJSON(r);
		if( data.code==="0"&& data.msg==="OK"){
			render_modal("#getValue-template",data.result,"#getRes");
		}else{
			console.log(data.msg);
		}
	});
});

/*获取已选属性和未选属性*/
function getAttrs(){
    if(readValue()){
        getAttrList(cid,rid);
	}

}


function add_attr(attributeId){
    readValue();
    $.getJSON(config.serverIp+"xx/modal/addByResIdAndAttributeId",{"resId":rid,"attributeId":attributeId},function(r){
        data = $.parseJSON(r);
        if(data.code==="0"&& data.msg==="OK"){
            getAttrList(cid, rid);
        }else{
            alert(data.msg);
        }
    });
}
function del_attr(attributeId){
    readValue();
    $.getJSON(config.serverIp+"xx/modal/deleteByResIdAndAttributeId",{"resId":rid,"attributeId":attributeId},function(r){
        try {
            data = $.parseJSON(r);
        } catch(error) {
            data =r;
        }
        finally{
            if(data.code==="0"&& data.msg==="OK"){
                alert("删除成功！")
                getAttrList(cid, rid);
            }else{
                alert(data.msg);
            }
		}
    });
}

/**
 * 载入属性
 */
function getAttrList(classifyId,resId){
    cid = classifyId;
	/*已选属性模态窗*/
	$.getJSON(config.serverIp+"xx/modal/resAttrRelationModal",{"bt":"已选属性","resId":resId},function(r){
		data = $.parseJSON(r);
		if(data.code==="0"&& data.msg==="OK"){
			render_modal("#attr-template",data.result,"#already_select");
		}else{
			console.log(data.msg);
		}
	});
	/*未选属性模态窗*/
	$.getJSON(config.serverIp+"xx/modal/resAttrRelationModal",{"bt":"未选属性","classifyId":classifyId,"resId":resId},function(r){
		data = $.parseJSON(r);
		if( data.code==="0"&& data.msg==="OK"){
			render_modal("#attr-no-template",data.result,"#can_select");
		}else{
			console.log(data.msg);
		}
	});
}
function selectAttr(){
	console.log("selectAttr()");
}

function create(){
	console.log("create()");
}
function fresh(){
	console.log("fresh()");
}

/**获取物件编号*/
function getRes(){
	$('#resModal').modal('hide');
	var value = getRadio("res");
	$("#resId").val(value);
}
/**获取类别编号*/
function getClassify(){
	$('#classifyModal').modal('hide');
	var value = getRadio("classify");
	$("#classify_id").val(value);
}
</script>
</body>
</html>