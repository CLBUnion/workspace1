<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>产品选型首页</title>
<style>
.prop{height: 26px;line-height: 26px;}
.key{float:left;}
.value ul li{float:left;display: inline;margin-left:10px;}
.goods{width:30%;float:left;border:1px solid red;margin-top:10px;margin-right:3.3%;}
</style>
</head>
<body>
<script id="prop-template" type="text/x-handlebars-template">
	{{#each result}}
	<div class="prop">
	    <div class="key">
	        <span title="{{propertyName}}">{{propertyName}}</span>
	    </div>
	    <div class="value">
	        <ul class="sl-v-list" id="prop_{{id}}"></ul>
	    </div>
	</div>
	{{/each}}
</script>
<script id="prop-value-template" type="text/x-handlebars-template">
	{{#each this}}
		<li><a href="#" title="{{this}}">{{this}}</a></li>
	{{/each}}
</script>

<script id="goods-template" type="text/x-handlebars-template">
	{{#each result}}
	<div class="goods">
	    <div class="goodsId">
	        {{id.goodsId.id}}
	    </div>
	    <div class="goodsName">
	        {{id.goodsId.goodsName}}
	    </div>
		<div>
	        {{id.propId.id}}{{id.propId.propertyName}}{{value}}
	    </div>
	</div>
	{{/each}}
</script>
<div class="container">
	<div class="base_prop">
		基本属性
	</div>
	<div class="option_prop">
		附加属性
	</div>
	<div class="props"></div>
	<div class="goods_content"></div>
</div>
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../js/handlebars.js"></script>
<script src="../js/common.js"></script>
<script type="text/javascript">
function renderProp(data){
	var page = $("#prop-template").html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(".props").html(html);
}
function renderPropValue(key,value){
	var page = $("#prop-value-template").html();
	var template = Handlebars.compile(page);
	var html = template(value);
	$("#"+key).html(html);
}
function renderGoods(data){
	console.log(data);
	var page = $("#goods-template").html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(".goods_content").html(html);
}
</script>
<script type="text/javascript">
var flag = 5;
window.onload=function(){
	getPropsByCatalogId(1);
	getPropsValueByCatalogId(1);
	flag=3;
	if(($(".sl-v-list").children().length==0) && flag>0){
		console.log(flag+"================");
		flag--;
		getPropsValueByCatalogId(1);
	}
	getGoodsByCatalogId(1);
}

/*getGoodsByCatalogId function*/
function getGoodsByCatalogId(id){
	$.getJSON(config.serverIp+"shop/getGoodsByCatalogId",{"catalogId":id},function(data){
		var msg=$.parseJSON(data).msg;
		if(msg!=null && msg=='OK'){
			renderGoods($.parseJSON(data));
		}else{
			console.log(msg);
		}
	});
}

/*getPropsByCatalogId function*/
function getPropsByCatalogId(id){
	$.getJSON(config.serverIp+"shop/getPropsByCatalogId",{"catalogId":id},function(data){
		var msg=$.parseJSON(data).msg;
		if(msg!=null && msg=='OK'){
			renderProp($.parseJSON(data));
		}else{
			console.log(msg);
		}
	});
}

var propValue;
/*getPropsValueByCatalogId function*/
function getPropsValueByCatalogId(id){
	$.getJSON(config.serverIp+"shop/getPropsValueByCatalogId",{"catalogId":id},function(data){
		var data_msg=$.parseJSON(data).msg;
		if(data_msg!=null && data_msg=='OK'){
			propValue=$.parseJSON(data).result;
			$.each(propValue,function(key,value){
				renderPropValue(key,value);
			});
		}else{
			console.log(data_msg);
		}
	});
}

</script>
</body>
</html>