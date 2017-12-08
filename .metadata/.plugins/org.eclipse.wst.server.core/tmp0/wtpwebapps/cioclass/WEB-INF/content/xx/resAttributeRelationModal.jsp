<%@ page language="java" pageEncoding="UTF-8"%>
<script id="attr-template" type="text/x-handlebars-template">
	<table class="table" border="1">
		<caption>{{body_title}}</caption>
		<thead>
			<tr>
                <th>选择</th>
				{{#each body_head}}	
				<th><span title="{{this}}">{{this}}</span></th>
				{{/each}}
			</tr>
		</thead>
		<tbody>
			{{#each body_content}}
			<tr class="h">
                <td>
                    <!--已选多选框-->
                    <%--<input name="had_select" type="checkbox" value="{{get0 content_list}}">--%>
                    <button class="btn btn-primary" onclick="del_attr('{{get0 content_list}}');">删除</button>
                </td>
				{{#each content_list}}	
					<td><span title="{{this}}">{{this}}</span></td>
				{{/each}}
			</tr>
			{{/each}}
		</tbody>
	</table>
</script>
<script id="attr-no-template" type="text/x-handlebars-template">
    <table class="table" border="1">
        <caption>{{body_title}}</caption>
        <thead>
        <tr>
            <th>选择</th>
            {{#each body_head}}
            <th><span title="{{this}}">{{this}}</span></th>
            {{/each}}
        </tr>
        </thead>
        <tbody>
        {{#each body_content}}
        <tr class="h">
            <td>
                <!--未选多选框-->
                <%--<input name="no_select" type="checkbox" value="{{get0 content_list}}">--%>
                <button class="btn btn-primary" onclick="add_attr('{{get0 content_list}}');">增加</button>
            </td>
            {{#each content_list}}
            <td><span title="{{this}}">{{this}}</span></td>
            {{/each}}
        </tr>
        {{/each}}
        </tbody>
    </table>
</script>