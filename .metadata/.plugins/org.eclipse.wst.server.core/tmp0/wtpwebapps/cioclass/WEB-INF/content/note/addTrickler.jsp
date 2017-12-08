<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>添加日记</title>
</head>
<body>

	<form action="/cioclass/note/addTickler" method="post">
		标题：<input type="text" name="title"><br>
		内容：<textarea rows="5" cols="25" name="content"></textarea><br>
		<input type="submit" value="添加">
	</form>
</body>
</html>