/**
 * 通用JS文件
 */
$(document).ready(function(){
	$(".header").load("header"); 
	$(".footer").load("footer"); 
});

$("#nav li").click(function() {
	$(this).attr("class","active").siblings().removeAttr("class");
});
/*
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?cfab3bcce7a32ad4f77dedbfc4b9acb7";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
*/
var config={
		//serverIp:"http://cioclass.com:8090/cioclass/",
  server:"http://cioclass.com/",
  //serverIp:"http://192.168.0.101:8080/cioclass/"
serverIp:"http://localhost:8080/cioclass/"
   // serverIp:"http://localhost:8080/"
};
/**
 * title 浮动的标题
 * uri 访问uri
 * id 选择器id名称
 * */
var msgg="";
var msg="";
function getData(title,uri,id){
	$.ajax({  
	        type: "GET",  
	        url:config.serverIp+""+uri,
	     	dataType: "json",
	        async: false,
	        success: function(msg) {
	        	msgg = jQuery.parseJSON(msg);
	        	if(msgg.content===undefined){
	        		init_data(title);
	        	}else{
		        	$.each(msgg.content,function(index,tr){
			        	var str=tr.name+' '+tr.education+' '+tr.experience;
		   	            var str_info ='姓名：'+tr.name+'<br>最高学历：'+tr.education+'<br>学习或工作经验：'+tr.experience;
		   	            $("#"+id).append("<li><a href='#' onclick='info(\""+title+"\",\""+str_info+"\")' data-toggle='modal' data-target='#rc_1' title='"+str+"'>"+str+"</a></li>");
		        	});
	        	}
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	bmlog(XMLHttpRequest, textStatus, errorThrown);
	        	init_data(title);
	        }
		});
}

function getJson(uri){
	$.ajax({  
	        type: "GET",  
	        url:config.serverIp+""+uri,
	     	dataType: "json",
	        async: false,
	        success: function(data) {
	        	msg = jQuery.parseJSON(data);
	        },
	        error: function(XMLHttpRequest, textStatus, errorThrown) {
	        	console.log("我错了.by "+XMLHttpRequest+","+textStatus+","+errorThrown);
	        }
		});
}
/**
 * ajax请求错误日志弹出框错误提醒
 * @param XMLHttpRequest XMLHttpRequest
 * @param textStatus textStatus
 * @param errorThrown errorThrown
 * @returns alert对话框提醒
 */
function bmerror(XMLHttpRequest, textStatus, errorThrown) {
	if (XMLHttpRequest.status === 400) {
		alert("您所提交的信息不合法，请正确提交真实信息！");
	} else if (XMLHttpRequest.status === 500) {
		alert("后台程序代码有误，请稍后再次提交信息！");
	} else if(XMLHttpRequest.status === 404){
		alert("服务器可能已经暂停服务，所以我迷路了！");
	} else {
		console.log("textStatus:"+textStatus+" & errorThrown:"+errorThrown);
		alert("恭喜你报名成功了！");
	}
}
/**
 * ajax请求错误日志打印
 * @param XMLHttpRequest
 * @param textStatus
 * @param errorThrown
 * @returns console控制台输出
 */
function bmlog(XMLHttpRequest, textStatus, errorThrown) {
	if (XMLHttpRequest.status === 400) {
		console.log("您所提交的信息不合法，请正确提交真实信息！");
	} else if (XMLHttpRequest.status === 500) {
		console.log("后台程序代码有误，请稍后再次提交信息！");
	} else if(XMLHttpRequest.status === 404){
		console.log("服务器可能已经暂停服务，所以我迷路了！");
	} else {
		console.log("textStatus:"+textStatus+" & errorThrown:"+errorThrown);
		console.log("恭喜你报名成功了！");
	}
}
/**
 * 模态窗中表身数据双击选择
 * @param o this对象
 * @returns 该行记录被选择
 */
function dbc(o){
	o.children[0].children[0].checked="checked";
}
/**
 * 获取多选框的值
 * @param name checkbox的name属性
 * @returns 如果未选中复选框，返回"",否则各值之间以逗号“,”隔开
 */
function getCheckbox(name){
	var total = 0,i;
	var val = [],str="";
	var checks = $('input:checkbox[name="'+name+'"]:checked');
	for(i=0;i<checks.length;i++){
		val[total]=checks[i].value;
		total++;
	}
	if(total === 0){
		alert("未选中复选框");
		return "";
	}else{
		for(i=0;i<total;i++){
			str+=val[i]+","
		}
		return str;
	}
}
/**
 * 获取单选框的值
 * @param name radio的name属性
 * @returns 如果未选中复选框，返回"",否则返回选中的值
 */
function getRadio(name){
	var checks = $('input:radio[name="'+name+'"]:checked');
	if(checks.length===0){
		alert("未选中单选框");
		return "";
	}else{
		return checks[0].value;
	}
}
/**
 * 渲染Modal模态窗模板
 * @param templateSelector 模板选择器，必须包含前置的","或者"."
 * @param data JSON格式数据
 * @param htmlSelector HTML选择器，必须包含前置的","或者"."
 * @returns handlebars渲染
 */
function render_modal(templateSelector,data,htmlSelector){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
}

/*比较*/
var handleHelper = Handlebars.registerHelper("compare",function(name,arg){
    return $.contains(name,arg);
});

handleHelper = Handlebars.registerHelper("eq",function(arg1,arg2){
    return arg1==arg2;
});

handleHelper = Handlebars.registerHelper("get0",function(array){
    return array[0];
});

handleHelper = Handlebars.registerHelper("addOne",function(index){
    return index+1;
});