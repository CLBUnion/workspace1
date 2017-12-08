<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix='security'
	uri='http://www.springframework.org/security/tags'%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- <security:csrfMetaTags /> --%>
<title>文件上传实例</title>
</head>

<body>
	<h2>文件上传实例</h2>
	<form action="fileUpload" method="post" enctype="multipart/form-data">
		<%-- <security:csrfInput /> --%>
		选择文件:<input type="file" name="file"> <input type="submit"
			value="提交">
	</form>

	<h2>文件批量上传实例</h2>
	<form action="filesUpload" method="post" enctype="multipart/form-data">
		<%-- <security:csrfInput /> --%>
		选择文件:<input type="file" name="file"> 选择文件:<input type="file"
			name="file"> 选择文件:<input type="file" name="file">
		选择文件:<input type="file" name="file"> <input type="submit"
			value="提交">
	</form>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	
</body>

</html>