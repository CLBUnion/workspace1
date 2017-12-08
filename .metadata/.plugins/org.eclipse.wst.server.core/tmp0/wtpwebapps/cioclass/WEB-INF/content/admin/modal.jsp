<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<p>输入你最喜欢的颜色: 
<input type ="text" value ="Yellow" id="oColor" style="color:red;font-size:24"/>
</p>
<input type="button" id ="button" value="Display Modeless Dialog" onclick="callDialog();"/>

<script type="text/javascript">
var sColor = "";
function callDialog() {

    var args = document.getElementById("oColor");        
    window.showModalDialog("index",args, "status:false;dialogWidth:300px;dialogHeight:150px;dialogLeft:350px;dialogTop:350px;");   
}
function update() {
    oColor.innerText = sColor;
}
</script>
</body>
</html>