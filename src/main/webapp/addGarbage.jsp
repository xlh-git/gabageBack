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
					autocomplete="off"	placeholder="请输入要添加的垃圾名称" class="layui-input" onblur="chekName()">
					<span id="garbagename"></span>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">垃圾类别</label>
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
<script src="js/jquery-1.7.2.js"></script>
<script src="layui/layui.js"></script>
<script type="text/javascript">
	layui.use([ 'layer', 'form' ], function() {
		var layer = layui.layer;
		var form = layui.form;
		form.render('select');
		form.on('submit(*)', function(data) {
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	});
	var x = 0;
	function chekName() {
		var nameval = $("input[name='name']").val();
		$.post("selByRealName", {
			name : nameval
		}, function(data) {
			console.log(data.chekInfo);
			if (data.chekInfo == 0&&nameval!="") {
				$("#garbagename").html("该垃圾名称已存在请查看表格").css("color", "red");
				x = 0;
			}		
			else if(data.chekInfo!=0&&nameval!=""){
				$("#garbagename").html("该垃圾名称可用").css("color", "green");
				x = 1;
			}
			else{
				$("#garbagename").html("");
				x=0;
			}
		}, "json");
	}
	function add() {
		var tid=$("#sel").val(); 
		if (x == 1&&tid!=0) {
			$.post("addGarbage", $("form").serialize(), function(data) {				
			}, "json");
			var nameval = $("input[name='name']").val();
			parent.GetValue(nameval); 
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		} else {
			alert("请核对你填写的信息是否正确");
		}
	}
</script>
</html>