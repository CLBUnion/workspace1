<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Echarts 饼状图</title>
<style>
h1{text-align:center;}
</style>
</head>
<body>
<div id="main" style="width:100%;height:80%;min-width:300px;min-height:480px"></div>
<script src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript">

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
	    title: {
	        text: '天气情况统计',
	        subtext: '虚构数据',
	        left: 'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{b} : {c} ({d}%)"
	    },
	    /**图例*/
	    legend: {
	        bottom: 10,
	        left: 'center',
	        data: ['西凉', '益州','兖州','荆州','幽州']
	    },
	    series : [
	        {
	            type: 'pie',
	            radius : '65%',
	            center: ['50%', '50%'],
	            selectedMode: 'single',
	            data:[
	                {value:1548, name: '幽州'},
	                {value:535, name: '荆州'},
	                {value:510, name: '兖州'},
	                {value:634, name: '益州'},
	                {value:735, name: '西凉'}
	            ],
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
	};
	/**使用刚指定的配置项和数据显示图表*/
	myChart.setOption(option);
}
</script>
</body>
</html>