<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>系统目录</title>
    <style>
        .catalog{width: 80%;margin: 0 auto;margin-bottom: 100px;}
        .catalog a{display: block;padding-left: 20px;}
    </style>
</head>
<body>
<div class="catalog">
    <h1>选型系统</h1><hr>
    <a href="${pageContext.request.contextPath}/xx/attributeAdd" target="_blank">添加属性</a>
    <a href="${pageContext.request.contextPath}/xx/attributePage" target="_blank">属性列表</a>
    <a href="${pageContext.request.contextPath}/xx/attributeValueAdd" target="_blank">添加属性值</a>
    <a href="${pageContext.request.contextPath}/xx/attributeValuePage" target="_blank">属性值列表</a>

    <H1>root</H1><hr>
    <a href="${pageContext.request.contextPath}/index" target="_top">首页刷新</a>
    <a href="${pageContext.request.contextPath}/exercisePage" target="_blank">活动表</a>
    <a href="${pageContext.request.contextPath}/handlebars" target="_blank">handlebars 实例</a>
    <a href="${pageContext.request.contextPath}/login" target="_blank">登录页面</a>
    <a href="${pageContext.request.contextPath}/mysqltest" target="_blank">mysql测试页</a>
    <a href="${pageContext.request.contextPath}/page" target="_blank">JQuery简单分页</a>
    <a href="${pageContext.request.contextPath}/page2" target="_blank">千里马列表</a>
    <a href="${pageContext.request.contextPath}/pageEdit" target="_blank">富文本编辑器</a>
    <a href="${pageContext.request.contextPath}/upload" target="_blank">文件上传</a>
    <a href="${pageContext.request.contextPath}/welcome" target="_blank">欢迎页面</a>

    <H1>admin</H1><hr>
    <a href="${pageContext.request.contextPath}/admin/index" target="_blank">admin首页</a>
    <a href="${pageContext.request.contextPath}/admin/modal" target="_blank">模型工具</a>
    <a href="${pageContext.request.contextPath}/admin/qlmcx" target="_blank">查询千里马名单</a>

    <H1>note</H1><hr>
    <a href="${pageContext.request.contextPath}/note/addTrickler" target="_blank">添加备忘录</a>
    <a href="${pageContext.request.contextPath}/note/notePage" target="_blank">备忘录列表</a>

    <H1>or</H1><hr>
    <a href="${pageContext.request.contextPath}/c" target="_blank">溯源二维码生成器</a>
    <a href="${pageContext.request.contextPath}/or/2444Main" target="_blank">访问页面主页</a>
    <a href="${pageContext.request.contextPath}/or/2444MainBak" target="_blank">访问页面主页备份</a>
    <a href="${pageContext.request.contextPath}/or/batchInfo" target="_blank">批次信息</a>
    <a href="${pageContext.request.contextPath}/or/batchInfoAdd" target="_blank">添加批次信息</a>
    <a href="${pageContext.request.contextPath}/or/companyAdd" target="_blank">添加公司</a>
    <a href="${pageContext.request.contextPath}/or/company" target="_blank">公司信息</a>
    <a href="${pageContext.request.contextPath}/or/batchSub" target="_blank">子批次信息</a>
    <a href="${pageContext.request.contextPath}/or/brand" target="_blank">品牌溯源</a>
    <a href="${pageContext.request.contextPath}/index_or" target="_blank">溯源后台首页</a>
    
    <h1>Jsoup/zx</h1>
    <a href="${pageContext.request.contextPath}/zx/index" target="_blank">Jsoup首页</a>
    <a href="${pageContext.request.contextPath}/zx/zb" target="_blank">招标网</a>
</div>
</body>
</html>