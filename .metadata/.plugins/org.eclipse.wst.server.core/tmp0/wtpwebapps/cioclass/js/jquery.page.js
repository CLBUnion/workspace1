(function($){
	var ms = {
		init:function(obj,args){
			return (function(){
				ms.fillHtml(obj,args);
				ms.bindEvent(obj,args);
			})();
		},
		//填充html
		fillHtml:function(obj,args){
			function f(className,num,textContent){
				obj.append('<a href="javaScript:'+args.funName+'('+num+');" title="第'+num+'页" data="'+num+'" class="'+className+'">'+textContent+'</a>');
			}
			return (function(){
				obj.empty();
				//上一页
				if(args.current > 1){
					f("prevPage",args.current-1,"上一页");
				}
				//中间页码
				if(args.current != 1 && args.current >= 4 && args.pageCount != 4){
					f("tcdNumber",1,1);
				}
				var start = args.current -2,end = args.current+2;
				if(start > 2 && args.current <= args.pageCount && args.pageCount > 5){
					f("tcdNumber",Math.floor((args.current-1)/2),"...");
				}
				if((start > 1 && args.current < 4)||args.current == 1){
					end++;
				}
				if(args.current > args.pageCount-4 && args.current >= args.pageCount){
					start--;
				}
				for (;start <= end; start++) {
					if(start <= args.pageCount && start >= 1){
						if(start != args.current){
							f("tcdNumber",start,start);
						}else{
							obj.append('<span class="current" title="当前第'+start+'页">'+ start +'</span>');
						}
					}
				}
				if(end < args.pageCount - 1 && args.current >= 1 && args.pageCount > 5){
					f("tcdNumber",Math.ceil((args.current+args.pageCount+2)/2),"...");
				}
				if(args.current != args.pageCount && args.current < args.pageCount -2  && args.pageCount != 4){
					f("tcdNumber",args.pageCount,args.pageCount);
				}
				//下一页
				if(args.current < args.pageCount){
					f("nextPage",args.current+1,"下一页");
				}
			})();
		},
		//绑定事件
		bindEvent:function(obj,args){
			function bindFun(num){
				ms.fillHtml(obj,{"current":num,"pageCount":args.pageCount});
				if(typeof(args.backFn)=="function"){
					args.backFn(num);
				}
			}
			return (function(){
				obj.on("click","a.tcdNumber",function(){
					var cur="";
					if($(this).text().indexOf(".")!=-1){
						cur=parseInt($(this).attr('data'));
					}else{
						cur = parseInt($(this).text());
					}
					bindFun(cur);
				});
				//上一页
				obj.on("click","a.prevPage",function(){
					bindFun(parseInt(obj.children("span.current").text())-1);
				});
				//下一页
				obj.on("click","a.nextPage",function(){
					bindFun(parseInt(obj.children("span.current").text())+1);
				});
			})();
		}
	}
	$.fn.createPage = function(options){
		var args = $.extend({
			pageCount : 1,
			current : 0,
			funName :"tos",
			backFn : function(){}
		},options);
		ms.init(this,args);
	}
})(jQuery);

/**统计总共几页*/
var pageCount;
/*当前第几页*/
var current=1;
/**
 * template渲染选择器
 * @param templateSelector template选择器ID
 * @param data ajax请求之后的数据
 * @param htmlSelector html页面中的选择器ID
 * @returns
 */
function render(templateSelector,data,htmlSelector){
	renders(templateSelector,data,htmlSelector,"page","tos");
}

/**
 * template渲染选择器
 * @param templateSelector template选择器ID
 * @param data ajax请求之后的数据
 * @param htmlSelector html页面中的选择器ID
 * @param pageClass 显示分页页码的类选择器
 * @param tosName 跳转页面的方法名
 * @returns
 */
function renders(templateSelector,data,htmlSelector,pageClass,tosName){
	var page = $(templateSelector).html();
	var template = Handlebars.compile(page);
	var html = template(data);
	$(htmlSelector).html(html);
	
	pageCount = data.totalPages;
	current = data.number+1;
	$("."+pageClass).createPage({
	    pageCount:pageCount,
	    current:current,
	    funName:tosName
	});
}

function turn_to_page(src,num){
	$.getJSON(src,{pageNo:num,pageSize:pageSize},function(data){render("#page-template",$.parseJSON(data),"#pages");});
}
/**
 * @param src:请求Page数据的网址<br>
 * @param num:请求数据的页码<br>
 * @param templateId:模板ID（默认为page-template）<br>
 * @param pagesId:显示数据表格的ID（默认为pages）<br>
 * @param pageClass:显示分页页码插件的class名字（默认为page）<br>
 * @param tosName:重写的tosName命名的方法（默认为tos）<br>
 * @returns
 */
function turn_to_pages(src,num,templateId,pagesId,pageClass,tosName){
	$.getJSON(src,
			{pageNo:num,pageSize:pageSize},
			function(data){
				renders("#"+templateId,$.parseJSON(data),"#"+pagesId,pageClass,tosName);
			});
}

/*每页大小*/
var pageSize=1;