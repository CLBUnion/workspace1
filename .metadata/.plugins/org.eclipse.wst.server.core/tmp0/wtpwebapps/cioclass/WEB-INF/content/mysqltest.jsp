<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MySQL Test</title>
</head>
<body>
MySQL Test
<script type="text/javascript" src="${pageContext.request.contextPath}/js/require.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mysqlConnect.js"></script>
<script type="text/javascript">
query("select 1 from 1",function(err,vals,fields){  
   console.log(err);
   console.log(vals);
   console.log(fields);
});
</script>
</body>
</html>