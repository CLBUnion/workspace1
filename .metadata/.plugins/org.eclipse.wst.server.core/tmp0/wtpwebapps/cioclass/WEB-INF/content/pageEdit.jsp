<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="version" value="v1.0"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>编辑器</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta content="Coderthemes" name="author"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link rel="shortcut icon" href="statics/admin/images/favicon.png"/>
    <link href="//cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="//cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="statics/admin/css/style.min.css?v=${version}" rel="stylesheet" rel="stylesheet" type="text/css"/>
    <link href="//cdn.bootcss.com/limonte-sweetalert2/6.4.1/sweetalert2.min.css" rel="stylesheet" type="text/css"/>
    <link href="statics/admin/plugins/toggles/toggles.css" rel="stylesheet" type="text/css"/>
	<link href="//unpkg.com/mditor@1.0.8/dist/css/mditor.min.css" rel="stylesheet" type="text/css"/>
	<link href="//cdn.bootcss.com/summernote/0.8.2/summernote.css" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
   
	<style>
	    .mditor .editor{font-size: 14px;font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;}
	    .note-toolbar {text-align: center;}
	    .note-editor.note-frame {border: none;}
	    .note-editor .note-toolbar {background-color: #f5f5f5;padding-bottom: 10px;}
	    .note-toolbar .note-btn-group {margin: 0;}
	    .note-toolbar .note-btn {border: none;}
	</style>
</head>
<body class="fixed-left">
<div id="wrapper">
    <div class="content-page">
        <div class="content">
            <div class="container">	
				<div class="row">
				    <div class="col-md-12">
				        <form id="articleForm" role="form" novalidate="novalidate">
				            <div class="form-group col-xs-12">
				                <div class="pull-right">
				                    <a id="switch-btn" href="javascript:void(0)" class="btn btn-purple btn-sm waves-effect waves-light switch-editor">
				                    #if(null != contents && contents.fmt_type == 'html') 切换为Markdown编辑器 #else 切换为富文本编辑器 #end</a>
				                </div>
				            </div>
				
				            <div id="md-container" class="form-group col-md-12">
				                <textarea id="md-editor" class="#if(null != contents && contents.fmt_type == 'html') hide #end">
								文本区编辑处
								</textarea>
				            </div>
				            <div id="html-container" class="form-group col-md-12">
				                <div class="summernote"></div>
				            </div>
				            <div class="form-group col-md-3 col-sm-4">
				                <label class="col-sm-4">开启评论</label>
				                <div class="col-sm-8">
				                    <div class="toggle toggle-success allow-${contents.allow_comment != true}" onclick="allow_comment(this);"></div>
				                </div>
				            </div>
				            <div class="text-right">
				                <button type="button" class="btn btn-primary waves-effect waves-light" onclick="subArticle('publish');">保存页面</button>
				                <button type="button" class="btn btn-warning waves-effect waves-light" onclick="subArticle('draft');">存为草稿</button>
				            </div>
				        </form>
				    </div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="//cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="//cdn.bootcss.com/limonte-sweetalert2/6.4.1/sweetalert2.min.js"></script>
<script src="statics/admin/js/base.js?v=${version}"></script>
<script src="//unpkg.com/mditor@1.0.8/dist/js/mditor.min.js"></script>
<script src="//cdn.bootcss.com/wysihtml5/0.3.0/wysihtml5.min.js"></script>
<script src="//cdn.bootcss.com/summernote/0.8.2/summernote.min.js"></script>
<script src="//cdn.bootcss.com/summernote/0.8.2/lang/summernote-zh-CN.min.js"></script>
<script src="//cdn.bootcss.com/jquery-toggles/2.0.4/toggles.min.js"></script>
<script type="text/javascript">
var mditor, htmlEditor;
var tale = new $.tale();
var attach_url = $('#attach_url').val();
// 每60秒自动保存一次草稿
var refreshIntervalId = setInterval("autoSave()", 60 * 1000);
$(document).ready(function () {
    mditor = window.mditor = Mditor.fromTextarea(document.getElementById('md-editor'));
    // 富文本编辑器
    htmlEditor = $('.summernote').summernote({
        lang: 'zh-CN',
        height: 340,
        placeholder: '写点儿什么吧...',
        //上传图片的接口
        callbacks:{
            onImageUpload: function(files) {
                var data=new FormData();
                data.append('image_up',files[0]);
                tale.showLoading();
                $.ajax({
                    url: '/admin/attach/upload',//上传图片请求的路径
                    method: 'POST',             //方法
                    data:data,                  //数据
                    processData: false,         //告诉jQuery不要加工数据
                    dataType:'json',
                    contentType: false,         //<code class="javascript comments"> 告诉jQuery,在request head里不要设置Content-Type
                    success: function(result) {
                        tale.hideLoading();
                        if(result && result.success){
                            var url = $('#attach_url').val() + result.payload[0].fkey;
                            console.log('url =>' + url);
                            htmlEditor.summernote('insertImage', url);
                        } else {
                            tale.alertError(result.msg || '图片上传失败');
                        }
                    }
                });
            }
        }
    });

    var fmt_type = $('#fmt_type').val();
    // 富文本编辑器
    if (fmt_type != 'markdown') {
        var this_ = $('#switch-btn');
        mditor.value = '';
        $('#md-container').hide();
        $('#html-container').show();
        this_.text('切换为Markdown编辑器');
        this_.attr('type', 'texteditor');
    } else {
        var this_ = $('#switch-btn');
        $('#html-container').hide();
        $('#md-container').show();
        $('#fmt_type').val('markdown');
        this_.attr('type', 'markdown');
        this_.text('切换为富文本编辑器');
        htmlEditor.summernote("code", "");
    }

    /*
     * 切换编辑器
     * */
    $('#switch-btn').click(function () {
        var type = $('#fmt_type').val();
        var this_ = $(this);
        if (type == 'markdown') {
            // 切换为富文本编辑器
            mditor.value = '';
            $('#md-container').hide();
            $('#html-container').show();
            this_.text('切换为Markdown编辑器');
            $('#fmt_type').val('html');
        } else {
            // 切换为markdown编辑器
            $('#html-container').hide();
            $('#md-container').show();
            $('#fmt_type').val('markdown');
            this_.text('切换为富文本编辑器');
            htmlEditor.summernote("code", "");
        }
    });

    $('.toggle').toggles({
        on: true,
        text: {
            on: '开启',
            off: '关闭'
        }
    });

    $('div.allow-false').toggles({
        off: true,
        text: {
            on: '开启',
            off: '关闭'
        }
    });

});

/*
 * 自动保存为草稿
 * */
function  autoSave() {
    var content = $('#fmt_type').val() == 'markdown' ? mditor.value : htmlEditor.summernote('code');
    var title = $('#articleForm input[name=title]').val();
    if (title != '' && content != '') {
        $('#content-editor').val(content);
        $("#articleForm #status").val('draft');
        $("#articleForm #categories").val($('#multiple-sel').val());
        var params = $("#articleForm").serialize();
        var url = $('#articleForm #cid').val() != '' ? '/admin/page/modify' : '/admin/page/publish';
        tale.post({
            url: url,
            data: params,
            success: function (result) {
                if (result && result.success) {
                    $('#articleForm #cid').val(result.payload);
                } else {
                    tale.alertError(result.msg || '保存文章失败');
                }
            }
        });
    }
}

/**
 * 保存页面
 * @param status
 */
function subArticle(status) {
    var content = $('#fmt_type').val() == 'markdown' ? mditor.value : htmlEditor.summernote('code');
    var title = $('#articleForm input[name=title]').val();
    if (title == '') {
        tale.alertWarn('请输入页面标题');
        return;
    }
    if (content == '') {
        tale.alertWarn('请输入页面内容');
        return;
    }
    clearInterval(refreshIntervalId);
    $('#content-editor').val(content);
    $("#articleForm #status").val(status);
    var params = $("#articleForm").serialize();
    var url = $('#articleForm #cid').val() != '' ? '/admin/page/modify' : '/admin/page/publish';
    tale.post({
        url: url,
        data: params,
        success: function (result) {
            if (result && result.success) {
                tale.alertOk({
                    text: '页面保存成功',
                    then: function () {
                        setTimeout(function () {
                            window.location.href = '/admin/page';
                        }, 500);
                    }
                });
            } else {
                tale.alertError(result.msg || '页面保存失败');
            }
        }
    });
}

function allow_comment(obj) {
    var this_ = $(obj);
    var on = this_.attr('on');
    if (on == 'true') {
        this_.attr('on', 'false');
        $('#allow_comment').val('false');
    } else {
        this_.attr('on', 'true');
        $('#allow_comment').val('true');
    }
}
</script>
</body>
</html>