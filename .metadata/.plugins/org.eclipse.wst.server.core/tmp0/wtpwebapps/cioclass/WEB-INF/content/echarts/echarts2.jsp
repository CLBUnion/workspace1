<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Echarts 柱状图</title>
<style>
h3{text-align:center;}
</style>
</head>
<body>
<h3>各表的记录数</h3>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width:100%;height:100%;min-width:300px;min-height:600px"></div>
<script src="../js/echarts.min.js"></script>
<script type="text/javascript">
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
option = {
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
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
            data : ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'记录数',
            type:'bar',
            barWidth: '60%',
            data:[10, 52, 200, 334, 590, 330, 220]
        }
    ]
};

//使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
</script>
</body>
</html>