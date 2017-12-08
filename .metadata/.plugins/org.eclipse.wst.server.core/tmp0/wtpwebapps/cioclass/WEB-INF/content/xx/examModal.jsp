<%@ page language="java" pageEncoding="UTF-8"%>
<script id="question-template" type="text/x-handlebars-template">
    <ol>
    {{#each this}}
    <div class="form-group">
        <li><label for="{{question}}">{{questionDesc}}</label></li>
        {{#each item}}
        <input name="{{../question}}" type="radio" placeholder="{{itemDesc}}" value="{{itemValue}}">{{addOne @index}}.{{itemDesc}}<br>
        {{/each}}
    </div>
    {{/each}}
    </ol>
</script>

<script id="question-template1" type="text/x-handlebars-template">
    <ol>
    {{#each this}}
    <div class="form-group">
        <li><label for="{{id}}">{{questionDes}}</label></li>
        {{#each list}}
        <input name="{{../id}}" type="radio" placeholder="{{itemDesc}}" value="{{itemValue}}">{{addOne @index}}.{{itemDesc}}<br>
        {{/each}}
    </div>
    {{/each}}
    </ol>
</script>
