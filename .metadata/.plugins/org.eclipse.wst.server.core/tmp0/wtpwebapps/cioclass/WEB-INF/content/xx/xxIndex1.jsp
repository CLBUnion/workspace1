<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<title>选型首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/page.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/or.css">
<style>
.res-div{border:1px solid #0d6aad;margin:5px 20px;float:left}
.attr-div{margin-left:20px}
.addition{margin:20px;border:1px solid #0d6aad}
</style>
</head>
<body>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<%@include file="../shop/index_nav.html" %>
<button onclick="fresh()">确定排序</button><br>
<!-- 分类模态窗展示区 -->
<div id="getClassify"></div>
<div class="form-group">
	<label for="classify_id">分类编号</label>
	<input id="classify_id" type="number" required="required" class="form-control" placeholder="请输入分类编号" data-toggle="modal" data-target="#classifyModal">
	<span class="help-block">请输入分类编号</span>
</div>
<!-- 显示所有该类别的所有属性 -->
<div id="attr-list"></div>

<%--
<div class="addition">
	<div>筛选条件：<span id="sx"></span></div>
	<div>附加条件：<span id="fj"></span></div>
</div>
--%>

<!-- 显示所有该类别的商品-属性-值 -->
<div id="res-list"></div>
<!-- 分页的组件 -->
<!-- <div class="page"></div> -->
<script id="attr-template" type="text/x-handlebars-template">
	<div class="attr-div">
		{{#each result}}
		<div>
			<span title="id:{{id}},name:{{name}},describe:{{describe}},createDate:{{createDate}}">{{name}}</span>
			:<span id="attr-{{id}}"></span>
		</div>
		{{/each}}
	</div>
</script>
<script id="res-template" type="text/x-handlebars-template">
	<div>
		{{#each result}}
		<div class="res-div" onclick="to_desc('{{res_id}}')">
			<img alt="{{name}}" title="{{name}}" src="../images/res.jpg"><br>
			{{res_id}}-{{name}}<br>
			<div>价格：￥110</div>
			{{#each list}}
				<div title="attr_id:{{attr_id}},name:{{name}},attr_desc:{{attr_desc}},value:{{value}}">
					{{name}}:{{value}}
				</div>
			{{/each}}
		</div>
		{{/each}}
	</div>
</script>
<script id="value-template" type="text/x-handlebars-template">
	{{#each result}}
		<span>{{this}}&nbsp;&nbsp;&nbsp;&nbsp;</span>
	{{/each}}
</script>

<script src="${pageContext.request.contextPath}/js/jquery.page.js"></script>
<script src="${pageContext.request.contextPath}/js/handlebars.js"></script>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<%@include file="../xx/attributeValueModel.jsp" %>
<script>
var classifyId = 2;
var data = null;


function getClassify_id(){
    classifyId = $("#classify_id").val();
    if(classifyId===""||classifyId===-1){
        alert("请选择分类");
        return false;
    }else{
        classifyId=parseInt(classifyId);
        return true;
    }
}

function onloadFun(){
    if(getClassify_id()){
        getResByClassifyId(classifyId);
        getAttributeByClassifyId(classifyId);
    }
}

function fresh(){
    onloadFun();
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
    onloadFun();
});


/**获取类别编号*/
function getClassify(){
    $('#classifyModal').modal('hide');
    var value = getRadio("classify");
    $("#classify_id").val(value);
}

function create(){
    console.log("create()");
}

/**
 * 通过分类ID获取物件列表
 * @param id 分类ID
 */
function getResByClassifyId(id){
	$.getJSON(config.serverIp+"xx/attributeValue/getResByclassifyId",{"classifyId":id},function(data){
		msg = $.parseJSON(data);
		if( msg.code==="0"&& msg.msg==="OK"){
            render_modal("#res-template",$.parseJSON(data),"#res-list");
		}else{
			console.log(msg.msg);
			alert("暂时无符合条件的商品");
		}
	});
}
/**
 * 物件详细信息页面
 */
function to_desc(res_id){
	window.open(config.serverIp+"xx/resDesc?resId="+res_id+"&classifyId="+classifyId);
}

/**
 * 通过分类ID获取属性列表
 * @param id 分类ID
 */
function getAttributeByClassifyId(id){
	$.getJSON(config.serverIp+"xx/attribute/findByClassifyId",{"classifyId":id},function(data){
		msg = $.parseJSON(data);
		if( msg.code==="0"&& msg.msg==="OK"){
            render_modal("#attr-template",$.parseJSON(data),"#attr-list");
			/*存储属性ID列表*/
			$.each(msg.result, function(i,val){      
				getAttrValues(classifyId,val.id);
			});
		}else{
			console.log(msg.msg);
		}
	});
}
/**
 * 通过分类ID和属性ID获取所有的取值
 * @param classifyId classifyId 分类ID
 * @param attrId 属性ID
 */
function getAttrValues(classifyId,attrId){
	$.getJSON(config.serverIp+"xx/attributeValue/getAttrValues",{"classifyId":classifyId,"attrId":attrId},function(data){
		msg = $.parseJSON(data);
		if( msg.code==="0"&& msg.msg==="OK"){
            render_modal("#value-template",msg,"#attr-"+attrId);
		}else{
			console.log(msg.msg);
		}
	});
}
</script>
</body>
</html>