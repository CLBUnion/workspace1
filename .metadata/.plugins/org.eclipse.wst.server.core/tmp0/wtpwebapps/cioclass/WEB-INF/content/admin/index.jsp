<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>Insert title here</title>
</head>
<body>
<script type ="text/javascript">
    function getInfoAndUpdate() {
        var Obj = window.dialogArguments;//用window.dialogArguments来获取父窗口的参数
       // alert(Obj.value); 用来测试对象的值是否传进来
        Obj.value = document.getElementById('oEnterColor').value;    //修改父窗口的值   
    }
    function cancel() {
        var callerWindowObj = dialogArguments;
        callerWindowObj.sColor = "Yellow";
        callerWindowObj.update();
	}
</script>
</head>
<body>
输入你最喜欢的颜色:
	<input id="oEnterColor" onkeyup ="getInfoAndUpdate();"/><br><br>
	<input value="Ok" type="button" onclick="getInfoAndUpdate();window.close();">
	<input value="Cancel"  type ="button" onclick="cancel();window.close();">
</body>
</html>