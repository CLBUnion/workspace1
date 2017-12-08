<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日期插件</title>
</head>
<body>
<input id="inp2" onclick="opcal();">
<script src="../js/jquery.min.js"></script>
<script type="text/javascript" src="/cioclass/js/lhgcore.lhgcalendar.min.js"></script>
<script type="text/javascript">

function opcal(){
    $.calendar();
}

</script>
</body>
</html>