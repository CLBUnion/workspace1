<%@ page language="java" pageEncoding="UTF-8"%>
	<div class="modal fade" id="attrModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">  
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">取回属性</h3>
		</div>
		<div class="modal-body">
			<div>
				<button class="btn btn-default" onclick="fresh()">增加</button>
				<button class="btn btn-default" onclick="fresh()">刷新</button>
				<hr>
				<table class="table" border="1">
					<caption>属性列表</caption>
					<thead>
						<tr>
							<th>单选</th>
							<th>属性编号</th>
							<th>属性名称</th>
						</tr>
					</thead>
					<tbody>
						<tr class="h">
							<td><input type="radio" name="radio-attr" value="101"></td>
							<td>101</td>
							<td>名称101</td>
						</tr>
						<tr class="h">
							<td><input type="radio" name="radio-attr" value="102"></td>
							<td>102</td>
							<td>名称102</td>
						</tr>
						<tr class="h">
							<td><input type="radio" name="radio-attr" value="103"></td>
							<td>103</td>
							<td>名称103</td>
						</tr>
						<tr class="h">
							<td><input type="radio" name="radio-attr" value="104"></td>
							<td>104</td>
							<td>名称104</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>  
		<div class="modal-footer">  
		    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>  
		    <button type="submit" class="btn btn-primary" onclick="javaScript:getAttr();">取回</button>  
		</div>
	</div>
	