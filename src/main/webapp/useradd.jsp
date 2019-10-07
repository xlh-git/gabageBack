<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新建账号</title>
<link rel="stylesheet" href="layui/css/layui.css" media="all">
<script src="js/jquery-1.9.1.js"></script>
<script src="layui/layui.js"></script>
</head>
<body>
	<div>
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">账号名</label>
				<div class="layui-input-inline">
					<input type="text" name="username" lay-verify="required"
					autocomplete="off"	placeholder="用户名" class="layui-input" onblur="chekUser()">
					<span id="username"></span>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码</label>
				<div class="layui-input-inline">
					<input type="text" name="password" lay-verify="required"
					autocomplete="off"	placeholder="密码" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">请确认密码</label>
				<div class="layui-input-inline">
					<input type="password" name="repassword" lay-verify="required"
						autocomplete="off" placeholder="请输入密码" class="layui-input"
						onblur="chekPassword()"> <span id="repassword"></span>
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">单行选择框</label>
				<div class="layui-input-inline">
					<select name="rid">
						<option value="1">超级管理员</option>
						<option value="2" selected="">管理员</option>
					</select>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" onclick="addUser()" lay-submit=""
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
			return false; //阻止表单跳转。如果需要表单跳转，去掉这段即可。
		});
	});
	var x = 0;
	var y = 0;
	function chekUser() {
		var usernameval = $("input[name='username']").val();
		$.post("selByUsername", {
			username : usernameval
		}, function(data) {
			if (data.userInfo == 0) {
				$("#username").html("该用户名已存在").css("color", "red");
				x = 0;
			} else {
				$("#username").html("该用户名可用").css("color", "green");
				x = 1;
			}
		}, "json");
	}
	function chekPassword() {
		var passwordval = $("input[name='password']").val();
		var repasswordval = $("input[name='repassword']").val();
		if (passwordval != repasswordval) {
			$("#repassword").html("两次密码不一致").css("color", "red");
			y = 0;
		} else {
			$("#repassword").html("密码一致").css("color", "green");
			y = 1;
		}
	}
	function addUser() {
		if (x == 1 && y == 1) {
			$.post("addUser", $("form").serialize(), function(data) {
				console.log(data.addInfo);
			}, "json");
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		} else {
			alert("请核对你填写的信息是否正确");
		}
	}
</script>
</html>