<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.black{color:#000;}
.modal{margin:0;padding:0}
</style>
<footer>
	<div class="row clearfix">
		<div class="col-xs-3 column">
			<ul>
				<li class="footer_title">解决方案</li>
				<li class="center"><a href="${pageContext.request.contextPath}/fa.html" target="_blank">解决方案</a></li>
			</ul>
		</div>
		<div class="col-xs-3 column">
			<ul>
				<li class="footer_title">产品介绍</li>
				<li class="center"><a href="${pageContext.request.contextPath}/product.html" target="_blank">产品介绍</a></li>
			</ul>
		</div>
		<div class="col-xs-3 column">
			<ul>
				<li class="footer_title">服务支持</li>
				<li class="center"><a href="http://cioclass.com:9000/" target="_blank">洋葱头知识库</a></li>
			</ul>
		</div>
		<div class="col-xs-3 column">
			<ul>
				<li class="footer_title">最新动态</li>
				<li class="center"><a href="${pageContext.request.contextPath}/companyProfile.html" target="_blank">公司介绍</a></li>
				<li class="center"><a href="${pageContext.request.contextPath}/dt.html" target="_blank">最新动态</a></li>
			</ul>
		</div>
	</div>
	<hr>
	<div class="row clearfix footer_bottom">
		<div class="col-md-12 column">
			<div class="center"><a href="#" data-toggle="modal" data-target="#myModal">联系方式</a> | <a href="http://cioclass.com/sitemap.html" target="_blank">网站地图</a> | <a href="http://map.baidu.com/?newmap=1&s=inf%26uid%3D8ecfcc5a968652a904fef5dd%26wd%3D%E6%B4%8B%E8%91%B1%E5%A4%B4%E4%BF%A1%E6%81%AF%E7%A7%91%E6%8A%80%26all%3D1%26c%3D194&from=alamap&tpl=map_singlepoint" target="_blank">公司地址</a></div>
			<div class="center">Copyright @ 2016-2017 All rights Reserved  <a href="${pageContext.request.contextPath}/">洋葱头（厦门）信息科技有限公司</a>  版权所有    闽ICP备12140001号</div>
		</div>
	</div>
	
	<!-- 模态框（Modal） -->
	<div class="modal fade black" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel">洋葱头（厦门）信息科技有限公司联系方式</h4>
	            </div>
	            <div class="modal-body">
					售前服务电话：<a class="black" href="tel:4001122661" target="_blank">400-1122661</a><br>
					售后服务电话：<a class="black" href="tel:05923945086" target="_blank">0592-3945086</a><br>
					服务续约电话：<a class="black" href="tel:13459282901" target="_blank">13459282901</a><br>
					客服QQ：3455431525 技术小陈<br>
					官网：http://www.cioclass.com<br>
					微信公众号：qiyemall<br>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- 人才信息 -->
	<div class="modal fade black" id="rc_1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                <h4 class="modal-title" id="myModalLabel2">洋葱头人才库-人才信息</h4>
	            </div>
	            <div class="modal-body" id="content">
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
	            </div>
	        </div>
	    </div>
	</div>
	<script type="text/javascript">
	function info(title,str){
		$("#myModalLabel2").html(title);
		$("#content").html(str);
	}
	</script>
</footer>