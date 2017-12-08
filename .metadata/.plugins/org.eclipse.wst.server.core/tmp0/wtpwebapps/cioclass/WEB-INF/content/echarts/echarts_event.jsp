<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017-10-28
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>



<script>
    app.title = '坐标轴刻度与标签对齐';
    option = {
        color: ['#3398DB'],
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
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
                name:'直接访问',
                type:'bar',
                barWidth: '60%',
                data:[10, 52, 200, 334, 390, 330, 220],
                onclick:"http://www.baidu.com"
            }
        ]
    };

    myChart.on('click', function (params) {
        console.log(params);
        if (params.componentType === 'markPoint') {
            // 点击到了 markPoint 上
            if (params.seriesIndex === 5) {
                // 点击到了 index 为 5 的 series 的 markPoint 上。
            }
        }
        else if (params.componentType === 'series') {
            if (params.seriesType === 'graph') {
                if (params.dataType === 'edge') {
                    // 点击到了 graph 的 edge（边）上。
                }
                else {
                    // 点击到了 graph 的 node（节点）上。
                }
            }else if(params.seriesType === 'bar'){
                console.log(params.data);
            }
        }else{
            alert(params.componentType);
        }
    });
</script>
</body>
</html>
