<%@ page language="java" pageEncoding="UTF-8"%>
<script id="getValue-template" type="text/x-handlebars-template">
	<div class="modal fade" id="{{model_id}}" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">  
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">{{model_title}}</h3>
		</div>
		<div class="modal-body">
			<div>
				{{#each body_link}}	
				<button class="btn btn-default" onclick="{{js_fun}}">{{link_name}}</button>
				{{/each}}
				<hr>
				<table class="table" border="1">
					<caption>{{body_title}}</caption>
					<thead>
						<tr>
							{{#each body_head}}	
							<th><span title="{{this}}">{{this}}</span></th>
							{{/each}}
						</tr>
					</thead>
					<tbody>
						{{#each body_content}}
						<tr class="h" ondblclick="dbc(this);">
							<td><input type="{{type}}" name="{{name}}" value="{{value}}"></td>
							{{#each content_list}}	
							<td><span title="{{this}}">{{this}}</span></td>
							{{/each}}
						</tr>
						{{/each}}
					</tbody>
				</table>
			</div>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
		    <button type="submit" class="btn btn-primary" onclick="javaScript:{{getFun}};">取回</button>  
		</div>
	</div>
</script>