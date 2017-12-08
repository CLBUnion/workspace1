<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="../statics/plugins/ztree/css/zTreeStyle/zTreeStyle.css">
<title>ztree</title>
</head>
<body>
	<div>
		<ul id="treeDemo" class="ztree"></ul>
	</div>


	<script src="../js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript"
		src="../statics/plugins/ztree/jquery.ztree.all.min.js"></script>
	<script type="text/javascript">
		var setting = {
			view : {
				/*不显示连接线，默认显示连接线*/
				showLine : false
			},
			data : {
				simpleData : {
					enable : true
				}
			}
		};
		var zNodes = [ {
			"id" : 1,
			"pid" : 0,
			"name" : "父节点1",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 11,
			"pid" : 0,
			"name" : "父节点11",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 111,
			"pid" : 0,
			"name" : "叶子节点111",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 112,
			"pid" : 0,
			"name" : "叶子节点112",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 113,
			"pid" : 0,
			"name" : "叶子节点113",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 114,
			"pid" : 0,
			"name" : "叶子节点114",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 12,
			"pid" : 0,
			"name" : "父节点12",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 121,
			"pid" : 0,
			"name" : "叶子节点121",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 122,
			"pid" : 0,
			"name" : "叶子节点122",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 123,
			"pid" : 0,
			"name" : "叶子节点123",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 124,
			"pid" : 0,
			"name" : "叶子节点124",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 13,
			"pid" : 0,
			"name" : "父节点13",
			"open" : true,
			"isParent" : true,
			"click" : false
		}, {
			"id" : 2,
			"pid" : 0,
			"name" : "父节点2",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 21,
			"pid" : 0,
			"name" : "父节点21",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 211,
			"pid" : 0,
			"name" : "叶子节点211",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 212,
			"pid" : 0,
			"name" : "叶子节点212",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 213,
			"pid" : 0,
			"name" : "叶子节点213",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 214,
			"pid" : 0,
			"name" : "叶子节点214",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 22,
			"pid" : 0,
			"name" : "父节点22",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 221,
			"pid" : 0,
			"name" : "叶子节点221",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 222,
			"pid" : 0,
			"name" : "叶子节点222",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 223,
			"pid" : 0,
			"name" : "叶子节点223",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 224,
			"pid" : 0,
			"name" : "叶子节点224",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 23,
			"pid" : 0,
			"name" : "父节点23",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 231,
			"pid" : 0,
			"name" : "叶子节点231",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 232,
			"pid" : 0,
			"name" : "叶子节点232",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 233,
			"pid" : 0,
			"name" : "叶子节点233",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 234,
			"pid" : 0,
			"name" : "叶子节点234",
			"open" : true,
			"isParent" : false,
			"click" : false
		}, {
			"id" : 3,
			"pid" : 0,
			"name" : "父节点3",
			"open" : true,
			"isParent" : true,
			"click" : false
		} ];

		$(document).ready(function() {
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
	</script>

</body>
</html>