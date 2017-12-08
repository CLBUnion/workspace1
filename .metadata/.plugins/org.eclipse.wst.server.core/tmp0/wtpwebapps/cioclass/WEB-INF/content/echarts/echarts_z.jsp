<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Echarts 柱状图</title>
<style>
h1{text-align:center;}
</style>
</head>
<body>
<h1>各表的记录数</h1>

<form action="javaScript:fsql();">
	<label for="IPAddress">数据库域名或者IP</label><br>
	<input type="text" name="IPAddress" id="IPAddress" value="userchoose.gicp.net" placeholder="填写数据库域名或者IP地址，默认为userchoose.gicp.net">
	<br>
	<label for="databaseName">数据库名称</label><br>
	<input type="text" name="databaseName" id="databaseName" value="DEMO" placeholder="填写数据库名称，默认为DEMO">
	<br>
	<label for="tableName">表名称，多个表用逗号隔开</label><br>
	<input type="text" id="tableName" id="tableName" value="LRPTA,LRPTB,LRPTC,LRPTE" placeholder="填写数据库表民，多个表以逗号隔开,默认为LRPTA,LRPTB,LRPTC,LRPTE" size="200">
	<br>
	<button onclick="javaScript:fsql();">刷新</button>
	<input type="submit" value="查询">
</form>


<div id="main" style="width:100%;height:80%;min-width:300px;min-height:480px"></div>
<script src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">
var x_values=new Array('Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun');
var y_values=new Array(10, 52, 200, 334, 590, 330, 220);
/**初始化echarts实例*/
var myChart =null;
window.onload=function(){
	hz();
}
</script>
<script type="text/javascript">
/**绘制图表函数*/
function hz(){
	myChart= echarts.init(document.getElementById('main'));
	option = {
	    color : ['#3398DB'],
	    title: {
	        text: '各表的记录数',
	        subtext: '真实数据',
	        left: 'center'
	    },
	    tooltip : {
	        trigger : 'axis',
	        formatter: "{b} : {c}",
	        axisPointer : {
	            type : 'shadow'
	        }
	    },
	   
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : x_values,
	            axisTick : {
	                alignWithLabel : true
	            }
	        }
	    ],
	    yAxis : [{type : 'value'}],
	    series : [
	        {
	            name :'记录数',
	            type :'bar',
	            barWidth : '60%',
	            data : y_values
	        }
	    ]
	};
	/**使用刚指定的配置项和数据显示图表*/
	myChart.setOption(option);
}
</script>
<script type="text/javascript">
/**获取数据并绘制图表*/
function fsql(){
	getSQL("sql");
	console.log(msg);
	if(msg.code=="0"){
		x_values=new Array();
		y_values=new Array();
		$.each(msg.result,function(index,tr){
			x_values[index]=tr.key;
			y_values[index]=tr.value;
		});
		hz();
	}else{
		alert(msg+"<br>请注意连接关键词");
	}
}
/**数据请求*/
function getSQL(uri){
	var IPAddress = $("#IPAddress").val();
	var databaseName = $("#databaseName").val();
	var tableName = $("#tableName").val();
	$.ajax({  
	        type: "GET",  
	        url:config.serverIp+""+uri,
	        data:{"IPAddress":IPAddress,"databaseName":databaseName,"tableName":tableName},
	     	dataType: "json",
	        async: false,
	        success: function(data, textStatus) {
	        	msg = jQuery.parseJSON(data);
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	console.log("我错了");
	        }
		});
}
</script>
</body>
</html>