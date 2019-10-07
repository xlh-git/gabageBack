<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加新垃圾</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<script src="js/jquery-1.9.1.js"></script>
<script src="layui/layui.js"></script>
</head>
<body>
	<div>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">垃圾名称</label>
				<div class="layui-input-inline">
					<input type="text" name="name" lay-verify="required"
						placeholder="垃圾名" class="layui-input">
					<span id="garbagename"></span>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单行选择框</label>
				<div class="layui-input-inline">
					<select name="tid" id="sel">
					    <option value="0" selected=""></option>
						<option value="1">可回收物</option>
						<option value="2">有害垃圾</option>
						<option value="3">湿垃圾</option>
						<option value="4">干垃圾</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" onclick="add()" lay-submit=""
						lay-filter="*">立即提交</button>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	layui.use([ 'layer', 'form' ], function() {
		var layer = layui.layer;
		var form = layui.form;
		form.on('submit(*)', function(data) {
			return false; 
		});
	});
	function add(){
		var nameval = $("input[name='name']").val();
		parent.GetValue(nameval); 
		var index = parent.layer.getFrameIndex(window.name);
		parent.layer.close(index);
	}	
</script>
</html>