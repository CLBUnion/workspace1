<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
<!--  <meta http-equiv="X-Frame-Options" content="ALLOW-FROM http://localhost:8080/cioclass"> -->
 <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 <title>溯源系统</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/font-awesome.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/AdminLTE.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/all-skins.min.css">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/statics/css/main.css">
 <!--[if lt IE 9]>
 <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
 <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
 <![endif]-->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper" id="rrapp" v-cloak>
  <header class="main-header">
    <a href="javascript:void(0);" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>&nbsp;&nbsp;</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>溯源系统</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
	  <div style="float:left;color:#fff;padding:15px 10px;">欢迎<!--  {{user.username}} -->用户名</div>
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li><a href="index.html" target="_top"><i class="fa fa-home"></i> &nbsp;首页</a></li>
		  <li><a href="javascript:;" @click="updatePassword"><i class="fa fa-lock"></i> &nbsp;修改密码</a></li>
          <li><a href="logout"><i class="fa fa-sign-out"></i> &nbsp;退出系统</a></li>
		</ul>
      </div>
    </nav>
  </header>
  <!-- Left side column. contains the sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header">导航菜单</li>
        <!-- vue生成的菜单 -->
		<!-- <menu-item :item="item" v-for="item in menuList"></menu-item> -->
		
		<!-- "active" 如果要展开此菜单栏下的内容，则class="active" -->
		<li class>
			<a href="javascript:;">
				<i class="fa fa-cog"></i>
				<span>系统管理</span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu" style="display: none;">
				<li><a href="footer" target="main_index"><i class="fa fa-user"></i> 管理员列表</a></li>
				<li><a href="#"><i class="fa fa-user-secret"></i> 角色管理</a></li>
				<li><a href="#"><i class="fa fa-th-list"></i> 菜单管理</a></li>
				<li><a href="#"><i class="fa fa-bug"></i> SQL监控</a></li>
				<li><a href="#"><i class="fa fa-tasks"></i> 定时任务</a></li>
				<li><a href="#"><i class="fa fa-sun-o"></i> 参数管理</a></li>
				<li><a href="#"><i class="fa fa-file-image-o"></i> 文件上传</a></li>
				<li><a href="#"><i class="fa fa-file-text-o"></i> 系统日志</a></li>
			</ul>
		</li>
		
		
		<!-- <li class>
			<a href="javascript:;">
				<i class="fa fa-cog"></i>
				<span>系统管理2</span>
				<i class="fa fa-angle-left pull-right"></i>
			</a>
			<ul class="treeview-menu" style="display: none;">
				<li><a href="#"><i class="fa fa-user"></i> 管理员列表</a></li>
			</ul>
		</li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- =============================================== -->
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <ol class="breadcrumb" id="nav_title" style="position:static;float:none;">
        <li class="active"><i class="fa fa-home" style="font-size:20px;position:relative;top:2px;left:-3px;"></i> &nbsp; 首页</li>
        <li class="active"><!-- {{navTitle}} -->导航标题</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content" style="background:#fff;">
      <iframe scrolling="yes" name="main_index" frameborder="0" style="width:100%;min-height:1000px;overflow:visible;background:#fff;" :src="main"></iframe>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="pull-right hidden-xs">
      Version 1.0.0
    </div>
    Copyright &copy; 2017 <a href="${pageContext.request.contextPath}/" target="_blank">cioclass.com</a> All Rights Reserved 洋葱头信息科技有限公司
  </footer>

  <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
  
  <!-- 修改密码 -->
<div id="passwordLayer" style="display: none;">
	<form class="form-horizontal">
	<div class="form-group">
		<div class="form-group">
		   	<div class="col-sm-2 control-label">账号</div>
		    <span class="label label-success" style="vertical-align: bottom;"><!-- {{user.username}} -->用户名</span>
		</div>
		<div class="form-group">
		   	<div class="col-sm-2 control-label">原密码</div>
		   	<div class="col-sm-10">
		      <input type="password" class="form-control" v-model="password" placeholder="原密码"/>
		    </div>
		</div>
		<div class="form-group">
		   	<div class="col-sm-2 control-label">新密码</div>
		   	<div class="col-sm-10">
		      <input type="text" class="form-control" v-model="newPassword" placeholder="新密码"/>
		    </div>
		</div>
	</div>
	</form>
</div>

</div>
<!-- ./wrapper -->

<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/js/router.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/js/fastclick.min.js"></script>
<script src="${pageContext.request.contextPath}/js/app.js"></script>
<script src="${pageContext.request.contextPath}/statics/plugins/layer/layer.js"></script>
<script src="${pageContext.request.contextPath}/js/index.js"></script>
</body>
</html>